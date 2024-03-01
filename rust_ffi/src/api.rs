// This is the entry point of your Rust library.
// When adding new code to your project, note that only items used
// here will be transformed to their Dart equivalents.

use std::{
    ops::Add,
    path::PathBuf,
    process,
    sync::{Arc, Mutex},
    thread,
    thread::sleep,
    time::{Duration, UNIX_EPOCH},
};

use anyhow::{anyhow as err_msg, Result};
use log::info;
use strum_macros::{Display, EnumString};
use sysinfo::{PidExt, Process, ProcessExt, System, SystemExt};
use sysproxy;
use time;

/// trace mode
#[derive(Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum TraceMode {
    /// Wait child process to exit
    Simple,
    /// Search process by given name and wait them all exit
    ByName,
}

/// find and trace stared process then get end_time and exit_code
pub fn process_runner(
    mode: TraceMode,
    name: String,
    execute_path: String,
    monitor_path: String,
    working_dir: String,
    sleep_count: i32,
    sleep_millis: u64,
) -> Result<(i64, i64, bool)> {
    let execute =
        PathBuf::try_from(execute_path).map_err(|e| err_msg!("invalid execute path {}", e))?;
    if !execute.is_file() {
        return Err(err_msg!("invalid execute path"));
    }
    let working_dir =
        PathBuf::try_from(&working_dir).map_err(|e| err_msg!("invalid working dir {}", e))?;
    if !working_dir.is_dir() {
        return Err(err_msg!("invalid working dir path"));
    }
    // return Err(err_msg!("break for test {}",
    // working_dir.to_string_lossy().to_lowercase()));
    let start_time = time::OffsetDateTime::now_utc();
    let mut child = process::Command::new(execute)
        .current_dir(working_dir)
        .spawn()?;
    match mode {
        TraceMode::Simple => {
            let status = child.wait()?;
            let end_time = time::OffsetDateTime::now_utc();
            Ok((
                start_time.unix_timestamp(),
                end_time.unix_timestamp(),
                status.success(),
            ))
        }
        TraceMode::ByName => {
            for _ in 0..sleep_count {
                sleep(Duration::from_millis(sleep_millis));
                let s = System::new_all();
                let exit_code_mutex = Arc::new(Mutex::new(0));
                let processes: Vec<&Process> = s
                    .processes()
                    .values()
                    .filter(|val: &&Process| {
                        val.name().to_lowercase().contains(&name.to_lowercase())
                    })
                    .filter(|p| {
                        time::OffsetDateTime::from(
                            UNIX_EPOCH.add(time::Duration::seconds(p.start_time() as i64)),
                        )
                        .add(time::Duration::seconds(1))
                            > start_time
                    })
                    .filter(|p| {
                        p.exe().to_string_lossy().to_lowercase() == monitor_path.to_lowercase()
                    })
                    .collect();
                info!("processes num: {}", processes.len());
                let handles: Vec<_> = processes
                    .into_iter()
                    .map(|p| p.pid().as_u32())
                    .map(|pid| {
                        let mu = Arc::clone(&exit_code_mutex);
                        thread::spawn(move || {
                            if let Ok(exit_code) = wait_for_process_exit(pid) {
                                if exit_code != 0 {
                                    let mut guard = mu.lock().unwrap();
                                    *guard = exit_code;
                                }
                            }
                        })
                    })
                    .collect();
                if !handles.is_empty() {
                    for handle in handles {
                        handle.join().unwrap();
                    }
                    let end_time = time::OffsetDateTime::now_utc();
                    let exit_code = *exit_code_mutex.lock().unwrap();
                    return Ok((
                        start_time.unix_timestamp(),
                        end_time.unix_timestamp(),
                        exit_code == 0,
                    ));
                }
            }
            Err(err_msg!("sleep time limit exceeded"))
        }
    }
}

#[cfg(target_os = "linux")]
fn wait_for_process_exit(pid: u32) -> Result<i32> {
    use libc::{c_int, pid_t, WEXITSTATUS, WIFEXITED, WIFSIGNALED, WTERMSIG};

    extern "C" {
        fn waitpid(pid: pid_t, status: *mut c_int, options: c_int) -> pid_t;
    }
    let mut status: c_int = 0;
    unsafe {
        let result = waitpid(pid as i32, &mut status as *mut c_int, 0);
        if result == -1 {
            return Err(err_msg!(
                "An error occurred while waiting for the process to exit"
            ));
        }
    }

    if WIFEXITED(status) {
        let exit_code = WEXITSTATUS(status);
        Ok(exit_code)
    } else if WIFSIGNALED(status) {
        let signal = WTERMSIG(status);
        Err(err_msg!(
            "Process terminated by signal, signal number: {}",
            signal
        ))
    } else {
        Err(err_msg!("Unknown error"))
    }
}

#[cfg(target_os = "windows")]
fn wait_for_process_exit(pid: u32) -> Result<i32> {
    use winapi::{
        shared::minwindef::DWORD,
        um::{
            minwinbase::STILL_ACTIVE,
            processthreadsapi::{GetExitCodeProcess, OpenProcess},
            synchapi::WaitForSingleObject,
            winnt::{PROCESS_QUERY_INFORMATION, SYNCHRONIZE},
        },
    };

    unsafe {
        let handle = OpenProcess(PROCESS_QUERY_INFORMATION | SYNCHRONIZE, 0, pid as DWORD);
        if handle.is_null() {
            return Err(err_msg!("can't get handle"));
        }

        WaitForSingleObject(handle, winapi::um::winbase::INFINITE);

        let mut exit_code: DWORD = 0;
        GetExitCodeProcess(handle, &mut exit_code);

        if exit_code == STILL_ACTIVE {
            WaitForSingleObject(handle, winapi::um::winbase::INFINITE);
            GetExitCodeProcess(handle, &mut exit_code);
        }

        Ok(exit_code as i32)
    }
}

/// get system proxy settings, support windows, macos and linux
pub fn get_system_proxy() -> Result<(bool, String, u16)> {
    let proxy = sysproxy::Sysproxy::get_system_proxy()?;
    Ok((proxy.enable, proxy.host, proxy.port))
}
