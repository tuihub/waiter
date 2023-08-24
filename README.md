# Waiter

Current version is for developer testing only. It's not ready for user. Don't run it on your computer.

## TODO

- v0.1
  - [x] General
    - [x] Show appropriate pages based on user privilege
  - [x] Login & Logout
    - [x] `Tiphereth` Check server status before login  (GetServerInformation)
    - [x] `Tiphereth` Basic login and logout (GetToken, RefreshToken)
    - [x] `Tiphereth` Keep login status, auto refresh when AccessToken expired (RefreshToken)
    - [x] `Tiphereth` User editable server address (NONE)
  - [x] Third-Party Account
    - [x] `Tiphereth` Basic steam account link and unlink (LinkAccount, ListLinkAccounts, UnLinkAccount)
  - [x] App
    - [x] `Gebura` Basic app store explore (SearchApps, GetBindApps, PurchaseApp)
    - [x] `Gebura` Basic app library & simple app launcher (GetPurchasedApps, ListAppPackages)
  - [x] Feed
    - [x] `Yesod` Basic feed manage and pull state manage (CreateFeedConfig, UpdateFeedConfig, ListFeedConfigs)
    - [x] `Yesod` Basic feed reader (ListFeedItems, GroupFeedItems, GetFeedItem, GetBatchFeedItems)
  - [x] Settings
    - [x] `Tiphereth` Basic user manage (CreateUser, UpdateUser, GetUser, ListUsers)
    - [x] `Gebura` Basic internal app manage (CreateApp, UpdateApp, ListApps)
    - [x] `Gebura` Basic app package manage (CreateAppPackage, UpdateAppPackage, ListAppPackages, AssignAppPackage, UnAssignAppPackage)
  - [ ] Quality Tests
    - [ ] Windows
    - [ ] Linux
    - [ ] Web
    - [ ] Android
- v0.2
  - [ ] Login & Logout
    - [ ] `Tiphereth` Basic Sentinel manage (CreateUser, UpdateUser, GetUser, ListUsers, GenerateToken)
  - [ ] App
    - [ ] `Gebura` Sentinel reported app package manage (WIP)
    - [ ] `Gebura` Game save file manage (UploadGameSaveFile, ListGameSaveFiles, DownloadGameSaveFile)
    - [ ] `Gebura` App package run time record (AddAppPackageRunTime, GetAppPackageRunTime)
  - [ ] Feed
    - [ ] `Yesod` Feed category settings (WIP)
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