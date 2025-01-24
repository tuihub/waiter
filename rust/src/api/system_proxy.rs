/// get system proxy settings, support windows, macos and linux
#[cfg(any(target_os = "windows", target_os = "linux", target_os = "macos"))]
pub fn get_system_proxy() -> anyhow::Result<(bool, String, u16)> {
    let proxy = sysproxy::Sysproxy::get_system_proxy()?;
    Ok((proxy.enable, proxy.host, proxy.port))
}

#[cfg(not(any(target_os = "windows", target_os = "linux", target_os = "macos")))]
pub fn get_system_proxy() -> anyhow::Result<(bool, String, u16)> {
    Err(err_msg!("Unsupported platform"))
}
