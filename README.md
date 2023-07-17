# Waiter

Current version is for developer testing only. It's not ready for user. Don't run it on your computer.

## To-do List

- v0.1
  - [ ] Login & Logout
    - [x] `Tiphereth` Check server status before login  (GetServerInformation)
    - [x] `Tiphereth` Basic login and logout (GetToken, RefreshToken)
    - [ ] `Tiphereth` Keep login status, auto refresh when AccessToken expired (RefreshToken)
    - [ ] `Tiphereth` User editable server address (NONE)
  - [ ] Third-Party Account
    - [x] `Tiphereth` Basic steam account link and unlink (LinkAccount, ListLinkAccounts, UnLinkAccount)
    - [ ] `Gebura` Auto pull steam account library and pull status manage (WIP)
  - [ ] App
    - [x] `Gebura` Basic app store explore (SearchApps, GetBindApps, PurchaseApp)
    - [ ] `Gebura` Basic app library & simple app launcher (GetPurchasedApps, ListAppPackages)
  - [ ] Feed
    - [ ] `Yesod` Basic feed manage and pull state manage (CreateFeedConfig, UpdateFeedConfig, ListFeedConfigs)
    - [ ] `Yesod` Basic feed reader (ListFeedItems, GroupFeedItems, GetFeedItem, GetBatchFeedItems)
  - [ ] Settings
    - [ ] `Tiphereth` Basic user manage (CreateUser, UpdateUser, GetUser, ListUsers)
    - [x] `Gebura` Basic internal app manage (CreateApp, UpdateApp, ListApps)
    - [ ] `Gebura` Basic app package manage (CreateAppPackage, UpdateAppPackage, ListAppPackages, AssignAppPackage, UnAssignAppPackage)
    - [ ] `Gebura` Basic app bind relationship manage (MergeApp, PickApp)
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
  - [ ] Quality Tests
    - [ ] Windows
    - [ ] Linux
    - [ ] Web
    - [ ] Android