# Waiter

[![](https://img.shields.io/github/v/release/tuihub/waiter.svg)](https://github.com/tuihub/waiter/releases/latest)

Waiter is the standard client implementation of TuiHub.  

It is recommended to use with the standard server implementation [Librarian](https://github.com/tuihub/librarian). **Check [document](https://docs.tuihub.org) site for user guide.**

## Translation

[![zh-CN](https://img.shields.io/badge/zh--CN-source-blue?logo=crowdin)](https://crowdin.com/project/tuihub-waiter)
[![en-US translation](https://img.shields.io/badge/dynamic/json?color=blue&label=en-US&style=flat&logo=crowdin&query=%24.progress[?(@.data.languageId==%27en-US%27)].data.translationProgress&url=https%3A%2F%2Fbadges.awesome-crowdin.com%2Fstats-16204710-643430.json)](https://crowdin.com/project/tuihub-waiter)

The translation of this project is managed by [Crowdin](https://crowdin.com/project/tuihub-waiter). Don't report translation related issues on Crowdin, report them here.

## Development

*You need an available server instance before going on.*

1. Setup [flutter](https://docs.flutter.dev/get-started/install) development environment
2. Install [rust](https://www.rust-lang.org/tools/install) (knowledge about rust is not required, just a dependency of a small part)
3. Open project with your IDE

## TODO

- v0.2
  - [ ] Login & Logout
    - [ ] `Tiphereth` Basic Sentinel manage (CreateUser, UpdateUser, GetUser, ListUsers, GenerateToken)
  - [ ] App
    - [ ] `Gebura` Sentinel reported app package manage (WIP)
    - [ ] `Gebura` Game save file manage (UploadGameSaveFile, ListGameSaveFiles, DownloadGameSaveFile)
    - [ ] `Gebura` App package run time record (AddAppPackageRunTime, GetAppPackageRunTime)
  - [ ] Feed
    - [x] `Yesod` Feed item list filter. by feed & by category
    - [ ] `Yesod` Use bilibili as feed source (WIP)
    - [ ] `Yesod` Generate feed and let server serving rss protocol (WIP)
    - [x] `Netzach` Push generated feed to Telegram
  - [ ] Image
    - [ ] `Chesed` Basic image upload and manage (UploadImage, UpdateImage, ListImages, GetImage, DownloadImage)
    - [ ] `Chesed` Search image by ocr (SearchImages)
  - [ ] Settings
    - [ ] `Gebura` Basic app bind relationship manage (MergeApp, PickApp)
  - [ ] Quality Tests
    - [ ] Windows
    - [ ] Linux
    - [ ] Web
    - [ ] Android