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
use chrono::{DateTime, Utc};
use log::info;
use strum_macros::{Display, EnumString};
use sysinfo::{PidExt, Process, ProcessExt, System, SystemExt};

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
#[cfg(any(target_os = "windows", target_os = "linux"))]
pub fn process_runner(
    mode: TraceMode,
    name: String,
    execute_path: String,
    monitor_path: String,
    working_dir: String,
    sleep_count: i32,
    sleep_duration: chrono::Duration,
) -> Result<(DateTime<Utc>, DateTime<Utc>, bool)> {
    let execute = PathBuf::from(execute_path);
    if !execute.is_file() {
        return Err(err_msg!("invalid execute path"));
    }
    let working_dir = PathBuf::from(&working_dir);
    if !working_dir.is_dir() {
        return Err(err_msg!("invalid working dir path"));
    }
    // return Err(err_msg!("break for test {}",
    // working_dir.to_string_lossy().to_lowercase()));
    let start_time = Utc::now();
    let mut child = process::Command::new(execute)
        .current_dir(working_dir)
        .spawn()?;
    match mode {
        TraceMode::Simple => {
            let status = child.wait()?;
            let end_time = Utc::now();
            Ok((start_time, end_time, status.success()))
        }
        TraceMode::ByName => {
            for _ in 0..sleep_count {
                sleep(sleep_duration.to_std()?);
                let s = System::new_all();
                let exit_code_mutex = Arc::new(Mutex::new(0));
                let processes: Vec<&Process> = s
                    .processes()
                    .values()
                    .filter(|val: &&Process| {
                        val.name().to_lowercase().contains(&name.to_lowercase())
                    })
                    .filter(|p| {
                        DateTime::<Utc>::from(
                            UNIX_EPOCH.add(Duration::from_secs(p.start_time() + 1)),
                        ) > start_time
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
                    let end_time = Utc::now();
                    let exit_code = *exit_code_mutex.lock().unwrap();
                    return Ok((start_time, end_time, exit_code == 0));
                }
            }
            Err(err_msg!("sleep time limit exceeded"))
        }
    }
}

#[cfg(not(any(target_os = "windows", target_os = "linux")))]
pub fn process_runner(
    mode: TraceMode,
    name: String,
    execute_path: String,
    monitor_path: String,
    working_dir: String,
    sleep_count: i32,
    sleep_millis: u64,
) -> Result<(i64, i64, bool)> {
    Err(err_msg!("unsupported platform"))
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
