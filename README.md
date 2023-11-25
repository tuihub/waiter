# Waiter

Current version is for developer testing only. It's not ready for user. Don't run it on your computer.

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
    - [ ] `Netzach` Push generated feed to Telegram (WIP)
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