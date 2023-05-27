# Waiter

Current version is for developer testing only. It's not ready for user. Don't run it on your computer.

## To-do List

- [ ] Login & Logout
  - [x] `v0.1 Tiphereth` Check server status before login  (GetServerInformation)
  - [x] `v0.1 Tiphereth` Basic login and logout (GetToken, RefreshToken)
  - [ ] `v0.1 Tiphereth` Keep login status, auto refresh when AccessToken expired (RefreshToken)
  - [ ] `v0.1 Tiphereth` User editable server address (NONE)
  - [ ] `v0.2 Tiphereth` Basic Sentinel manage (CreateUser, UpdateUser, GetUser, ListUsers, GenerateToken)
- [ ] Third-Party Account
  - [ ] `v0.1 Tiphereth` Basic steam account link and unlink (LinkAccount, ListLinkAccounts, UnLinkAccount)
- [ ] App
  - [ ] `v0.1 Gebura` Basic app store explore (SearchApps, GetBindApps, PurchaseApp)
  - [ ] `v0.1 Gebura` Basic app library & app package manage (GetPurchasedApps, CreateAppPackage, UpdateAppPackage, ListAppPackages, AssignAppPackage, UnAssignAppPackage)
  - [ ] `v0.2 Gebura` Sentinel reported app package manage (WIP)
  - [ ] `v0.2 Gebura` Game save file manage (UploadGameSaveFile, ListGameSaveFiles, DownloadGameSaveFile)
  - [ ] `v0.2 Gebura` App package run time record (AddAppPackageRunTime, GetAppPackageRunTime)
- [ ] Feed
  - [ ] `v0.1 Yesod` Basic feed manage (CreateFeedConfig, UpdateFeedConfig, ListFeedConfigs)
  - [ ] `v0.1 Yesod` Basic feed reader (ListFeedItems, GroupFeedItems, GetFeedItem, GetBatchFeedItems)
  - [ ] `v0.2 Yesod` Feed category settings (WIP)
  - [ ] `v0.2 Yesod` Use bilibili as feed source (WIP)
  - [ ] `v0.2 Yesod` Generate feed and serving rss protocol (WIP)
  - [ ] `v0.2 Netzach` Push generated feed to Telegram (WIP)
- [ ] Image
  - [ ] `v0.2 Chesed` Basic image upload and manage (UploadImage, UpdateImage, ListImages, GetImage, DownloadImage)
- [ ] Admin Area
  - [ ] `v0.1 Tiphereth` Basic user manage (CreateUser, UpdateUser, GetUser, ListUsers)
  - [ ] `v0.1 Gebura` Basic internal app manage (CreateApp, UpdateApp, ListApps)
  - [ ] `v0.1 Gebura` Basic app bind relationship manage (MergeApp, PickApp)
- [ ] Quality Tests
  - [ ] v0.1 
    - [ ] Windows
    - [ ] Linux
    - [ ] Web
    - [ ] Android
