use std::{
    cmp::PartialEq,
    fs::{self},
    path::Path,
};

use anyhow::Result;
use glob;

#[derive(Debug)]
pub struct CommonAppScanSetting {
    pub base_path: String,
    pub min_install_dir_depth: i32,
    pub max_install_dir_depth: i32,
    pub min_executable_depth: i32,
    pub max_executable_depth: i32,
    pub exclude_directory_matchers: Vec<String>,
    pub include_executable_matchers: Vec<String>,
    pub exclude_executable_matchers: Vec<String>,
}

#[derive(Debug)]
pub struct CommonAppScannedEntry {
    pub path: String,
    pub entry_type: CommonAppScannedEntryType,
    pub status: CommonAppScannedEntryStatus,
}

#[derive(Debug)]
pub enum CommonAppScannedEntryType {
    Directory,
    File,
    Unknown,
}

#[derive(Debug, PartialEq)]
pub enum CommonAppScannedEntryStatus {
    Accessed,
    Skipped,
    Hit,
    Error,
}

pub fn scan_common_apps(
    setting: CommonAppScanSetting,
) -> Result<Option<Vec<CommonAppScannedEntry>>> {
    walk_entry(&setting, setting.base_path.as_ref(), None)
}

#[cfg(target_os = "windows")]
fn walk_entry(
    setting: &CommonAppScanSetting,
    path: &Path,
    remain_walk_depth: Option<usize>,
) -> Result<Option<Vec<CommonAppScannedEntry>>> {
    let err_res = vec![CommonAppScannedEntry {
        path: path.display().to_string(),
        entry_type: CommonAppScannedEntryType::Unknown,
        status: CommonAppScannedEntryStatus::Skipped,
    }];
    if (!is_root(path.as_ref())) && is_hidden(path.as_ref()) {
        return Ok(None);
    }
    match fs::metadata(path) {
        Ok(metadata) => {
            if metadata.is_dir() {
                walk_directory(
                    setting,
                    path,
                    remain_walk_depth.unwrap_or(
                        (setting.max_install_dir_depth + setting.max_executable_depth) as usize,
                    ),
                )
            } else if metadata.is_file() {
                match walk_file(setting, path) {
                    Ok(Some(result)) => Ok(Some(vec![result])),
                    Ok(None) => Ok(Some(vec![])),
                    Err(_) => Ok(Some(err_res)),
                }
            } else {
                Ok(Some(err_res))
            }
        }
        Err(_) => Ok(None),
    }
}

#[cfg(target_os = "windows")]
fn walk_directory(
    setting: &CommonAppScanSetting,
    path: &Path,
    remain_walk_depth: usize,
) -> Result<Option<Vec<CommonAppScannedEntry>>> {
    let dir = Path::new(&path);
    if !dir.exists() {
        return Ok(None);
    }
    let skipped = CommonAppScannedEntry {
        path: path.display().to_string(),
        entry_type: CommonAppScannedEntryType::Directory,
        status: CommonAppScannedEntryStatus::Skipped,
    };
    if remain_walk_depth == 0 {
        return Ok(Some(vec![skipped]));
    }
    if let Some(Some(dir_name)) = dir.file_name().map(|x| x.to_str()) {
        for matcher in &setting.exclude_directory_matchers {
            if glob::Pattern::new(matcher)?.matches(dir_name) {
                return Ok(Some(vec![skipped]));
            }
        }
    }
    let mut result = vec![CommonAppScannedEntry {
        path: path.display().to_string(),
        entry_type: CommonAppScannedEntryType::Directory,
        status: CommonAppScannedEntryStatus::Accessed,
    }];
    for entry in fs::read_dir(dir)? {
        let entry = entry?;
        if let Some(details) =
            walk_entry(setting, entry.path().as_path(), Some(remain_walk_depth - 1))?
        {
            result.extend(details);
        }
    }
    Ok(Some(result))
}

#[cfg(target_os = "windows")]
fn walk_file(setting: &CommonAppScanSetting, path: &Path) -> Result<Option<CommonAppScannedEntry>> {
    let skipped = CommonAppScannedEntry {
        path: path.display().to_string(),
        entry_type: CommonAppScannedEntryType::File,
        status: CommonAppScannedEntryStatus::Skipped,
    };
    let file = Path::new(path);
    if !file.exists() {
        return Ok(None);
    }
    let file_name = match file.file_name().map(|x| x.to_str()) {
        Some(Some(name)) => name,
        _ => return Ok(None),
    };
    let mut is_matched = false;
    for matcher in &setting.include_executable_matchers {
        if glob::Pattern::new(matcher)?.matches(file_name) {
            is_matched = true;
            break;
        }
    }
    if !is_matched {
        return Ok(Some(skipped));
    }
    for matcher in &setting.exclude_executable_matchers {
        if glob::Pattern::new(matcher)?.matches(file_name) {
            return Ok(Some(skipped));
        }
    }
    Ok(Some(CommonAppScannedEntry {
        path: path.display().to_string(),
        entry_type: CommonAppScannedEntryType::File,
        status: CommonAppScannedEntryStatus::Hit,
    }))
}

fn is_root(path: &Path) -> bool {
    path == path.parent().unwrap_or(path)
}

#[cfg(target_os = "windows")]
fn is_hidden(path: &Path) -> bool {
    use std::os::windows::ffi::OsStrExt;

    use winapi::um::{fileapi::GetFileAttributesW, winnt::FILE_ATTRIBUTE_HIDDEN};

    let path: Vec<u16> = path.as_os_str().encode_wide().chain(Some(0)).collect();
    let attributes = unsafe { GetFileAttributesW(path.as_ptr()) };
    if attributes == u32::MAX {
        return false;
    }
    attributes & FILE_ATTRIBUTE_HIDDEN != 0
}
