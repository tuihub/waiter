// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TuiHub`
  String get title {
    return Intl.message(
      'TuiHub',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get buttonConfirm {
    return Intl.message(
      'Confirm',
      name: 'buttonConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get buttonClose {
    return Intl.message(
      'Close',
      name: 'buttonClose',
      desc: '',
      args: [],
    );
  }

  /// `Parse failed`
  String get parseFailed {
    return Intl.message(
      'Parse failed',
      name: 'parseFailed',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred`
  String get unknownErrorOccurred {
    return Intl.message(
      'Unknown error occurred',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to close?`
  String get areYouSureToClose {
    return Intl.message(
      'Are you sure to close?',
      name: 'areYouSureToClose',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get buttonExit {
    return Intl.message(
      'Exit',
      name: 'buttonExit',
      desc: '',
      args: [],
    );
  }

  /// `Minimize to tray`
  String get buttonMinimizeToTray {
    return Intl.message(
      'Minimize to tray',
      name: 'buttonMinimizeToTray',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get buttonCancel {
    return Intl.message(
      'Cancel',
      name: 'buttonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Web version has limited functionality, for evaluation use only`
  String get webVersionFunctionLimited {
    return Intl.message(
      'Web version has limited functionality, for evaluation use only',
      name: 'webVersionFunctionLimited',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get durationJustNow {
    return Intl.message(
      'Just now',
      name: 'durationJustNow',
      desc: '',
      args: [],
    );
  }

  /// `{number} seconds ago`
  String durationSeconds(Object number) {
    return Intl.message(
      '$number seconds ago',
      name: 'durationSeconds',
      desc: '',
      args: [number],
    );
  }

  /// `{number} minutes ago`
  String durationMinutes(Object number) {
    return Intl.message(
      '$number minutes ago',
      name: 'durationMinutes',
      desc: '',
      args: [number],
    );
  }

  /// `{number} hours ago`
  String durationHours(Object number) {
    return Intl.message(
      '$number hours ago',
      name: 'durationHours',
      desc: '',
      args: [number],
    );
  }

  /// `{number} days ago`
  String durationDays(Object number) {
    return Intl.message(
      '$number days ago',
      name: 'durationDays',
      desc: '',
      args: [number],
    );
  }

  /// `{number} weeks ago`
  String durationWeeks(Object number) {
    return Intl.message(
      '$number weeks ago',
      name: 'durationWeeks',
      desc: '',
      args: [number],
    );
  }

  /// `{number} months ago`
  String durationMonths(Object number) {
    return Intl.message(
      '$number months ago',
      name: 'durationMonths',
      desc: '',
      args: [number],
    );
  }

  /// `{number} years ago`
  String durationYears(Object number) {
    return Intl.message(
      '$number years ago',
      name: 'durationYears',
      desc: '',
      args: [number],
    );
  }

  /// `🎉Welcome!`
  String get welcomeHeader {
    return Intl.message(
      '🎉Welcome!',
      name: 'welcomeHeader',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `CLICK LOGIN TO START`
  String get clickLoginToStart {
    return Intl.message(
      'CLICK LOGIN TO START',
      name: 'clickLoginToStart',
      desc: '',
      args: [],
    );
  }

  /// `Server setup`
  String get serverSetup {
    return Intl.message(
      'Server setup',
      name: 'serverSetup',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Please input server address`
  String get pleaseInputServerAddress {
    return Intl.message(
      'Please input server address',
      name: 'pleaseInputServerAddress',
      desc: '',
      args: [],
    );
  }

  /// `Port`
  String get port {
    return Intl.message(
      'Port',
      name: 'port',
      desc: '',
      args: [],
    );
  }

  /// `Please input server port`
  String get pleaseInputServerPort {
    return Intl.message(
      'Please input server port',
      name: 'pleaseInputServerPort',
      desc: '',
      args: [],
    );
  }

  /// `TLS`
  String get tls {
    return Intl.message(
      'TLS',
      name: 'tls',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get buttonCheck {
    return Intl.message(
      'Check',
      name: 'buttonCheck',
      desc: '',
      args: [],
    );
  }

  /// `Login failed, {reason}`
  String loginFailed(Object reason) {
    return Intl.message(
      'Login failed, $reason',
      name: 'loginFailed',
      desc: '',
      args: [reason],
    );
  }

  /// `Retry`
  String get buttonRetry {
    return Intl.message(
      'Retry',
      name: 'buttonRetry',
      desc: '',
      args: [],
    );
  }

  /// `Logging in to {server}`
  String loggingInTo(Object server) {
    return Intl.message(
      'Logging in to $server',
      name: 'loggingInTo',
      desc: '',
      args: [server],
    );
  }

  /// `Backward`
  String get buttonBackward {
    return Intl.message(
      'Backward',
      name: 'buttonBackward',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get buttonLogin {
    return Intl.message(
      'Login',
      name: 'buttonLogin',
      desc: '',
      args: [],
    );
  }

  /// `Chesed`
  String get chesed {
    return Intl.message(
      'Chesed',
      name: 'chesed',
      desc: '',
      args: [],
    );
  }

  /// `User canceled pick`
  String get updateImageUserCanceledPick {
    return Intl.message(
      'User canceled pick',
      name: 'updateImageUserCanceledPick',
      desc: '',
      args: [],
    );
  }

  /// `User canceled capture`
  String get updateImageUserCanceledCapture {
    return Intl.message(
      'User canceled capture',
      name: 'updateImageUserCanceledCapture',
      desc: '',
      args: [],
    );
  }

  /// `Upload image failed`
  String get uploadImageFailed {
    return Intl.message(
      'Upload image failed',
      name: 'uploadImageFailed',
      desc: '',
      args: [],
    );
  }

  /// `Gebura`
  String get gebura {
    return Intl.message(
      'Gebura',
      name: 'gebura',
      desc: '',
      args: [],
    );
  }

  /// `Please setup application path`
  String get pleaseSetupApplicationPath {
    return Intl.message(
      'Please setup application path',
      name: 'pleaseSetupApplicationPath',
      desc: '',
      args: [],
    );
  }

  /// `Please don't re-run application`
  String get pleaseDontReRunApplication {
    return Intl.message(
      'Please don\'t re-run application',
      name: 'pleaseDontReRunApplication',
      desc: '',
      args: [],
    );
  }

  /// `Application exit abnormally`
  String get applicationExitAbnormally {
    return Intl.message(
      'Application exit abnormally',
      name: 'applicationExitAbnormally',
      desc: '',
      args: [],
    );
  }

  /// `Launcher error`
  String get launcherError {
    return Intl.message(
      'Launcher error',
      name: 'launcherError',
      desc: '',
      args: [],
    );
  }

  /// `Scanning local files`
  String get scanningLocalFiles {
    return Intl.message(
      'Scanning local files',
      name: 'scanningLocalFiles',
      desc: '',
      args: [],
    );
  }

  /// `{number} new applications found`
  String newApplicationFound(Object number) {
    return Intl.message(
      '$number new applications found',
      name: 'newApplicationFound',
      desc: '',
      args: [number],
    );
  }

  /// `Importing steam applications`
  String get importingSteamApplications {
    return Intl.message(
      'Importing steam applications',
      name: 'importingSteamApplications',
      desc: '',
      args: [],
    );
  }

  /// `Import steam application finished, {success} success, {failed} failed`
  String importSteamApplicationFinished(Object success, Object failed) {
    return Intl.message(
      'Import steam application finished, $success success, $failed failed',
      name: 'importSteamApplicationFinished',
      desc: '',
      args: [success, failed],
    );
  }

  /// `gRPC`
  String get grpc {
    return Intl.message(
      'gRPC',
      name: 'grpc',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get USER_TYPE {
    return Intl.message(
      'Type',
      name: 'USER_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get USER_TYPE_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'USER_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get USER_TYPE_ADMIN {
    return Intl.message(
      'Admin',
      name: 'USER_TYPE_ADMIN',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get USER_TYPE_NORMAL {
    return Intl.message(
      'Normal',
      name: 'USER_TYPE_NORMAL',
      desc: '',
      args: [],
    );
  }

  /// `Sentinel`
  String get USER_TYPE_SENTINEL {
    return Intl.message(
      'Sentinel',
      name: 'USER_TYPE_SENTINEL',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get USER_STATUS {
    return Intl.message(
      'Status',
      name: 'USER_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get USER_STATUS_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'USER_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get USER_STATUS_ACTIVE {
    return Intl.message(
      'Active',
      name: 'USER_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `Blocked`
  String get USER_STATUS_BLOCKED {
    return Intl.message(
      'Blocked',
      name: 'USER_STATUS_BLOCKED',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get ACCOUNT_PLATFORM {
    return Intl.message(
      'Platform',
      name: 'ACCOUNT_PLATFORM',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get ACCOUNT_PLATFORM_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'ACCOUNT_PLATFORM_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Steam`
  String get ACCOUNT_PLATFORM_STEAM {
    return Intl.message(
      'Steam',
      name: 'ACCOUNT_PLATFORM_STEAM',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get APP_SOURCE {
    return Intl.message(
      'Source',
      name: 'APP_SOURCE',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get APP_SOURCE_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'APP_SOURCE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Internal`
  String get APP_SOURCE_INTERNAL {
    return Intl.message(
      'Internal',
      name: 'APP_SOURCE_INTERNAL',
      desc: '',
      args: [],
    );
  }

  /// `Steam`
  String get APP_SOURCE_STEAM {
    return Intl.message(
      'Steam',
      name: 'APP_SOURCE_STEAM',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get APP_TYPE {
    return Intl.message(
      'Type',
      name: 'APP_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get APP_TYPE_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'APP_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Game`
  String get APP_TYPE_GAME {
    return Intl.message(
      'Game',
      name: 'APP_TYPE_GAME',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get APP_PACKAGE_SOURCE {
    return Intl.message(
      'Source',
      name: 'APP_PACKAGE_SOURCE',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get APP_PACKAGE_SOURCE_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'APP_PACKAGE_SOURCE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get APP_PACKAGE_SOURCE_MANUAL {
    return Intl.message(
      'Manual',
      name: 'APP_PACKAGE_SOURCE_MANUAL',
      desc: '',
      args: [],
    );
  }

  /// `Sentinel`
  String get APP_PACKAGE_SOURCE_SENTINEL {
    return Intl.message(
      'Sentinel',
      name: 'APP_PACKAGE_SOURCE_SENTINEL',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get FEED_CONFIG_STATUS {
    return Intl.message(
      'Status',
      name: 'FEED_CONFIG_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get FEED_CONFIG_STATUS_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'FEED_CONFIG_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get FEED_CONFIG_STATUS_ACTIVE {
    return Intl.message(
      'Active',
      name: 'FEED_CONFIG_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `Suspend`
  String get FEED_CONFIG_STATUS_SUSPEND {
    return Intl.message(
      'Suspend',
      name: 'FEED_CONFIG_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get NOTIFY_TARGET_STATUS {
    return Intl.message(
      'Status',
      name: 'NOTIFY_TARGET_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get NOTIFY_TARGET_STATUS_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'NOTIFY_TARGET_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get NOTIFY_TARGET_STATUS_ACTIVE {
    return Intl.message(
      'Active',
      name: 'NOTIFY_TARGET_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `Suspend`
  String get NOTIFY_TARGET_STATUS_SUSPEND {
    return Intl.message(
      'Suspend',
      name: 'NOTIFY_TARGET_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get NOTIFY_TARGET_TYPE {
    return Intl.message(
      'Type',
      name: 'NOTIFY_TARGET_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get NOTIFY_TARGET_TYPE_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'NOTIFY_TARGET_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Telegram`
  String get NOTIFY_TARGET_TYPE_TELEGRAM {
    return Intl.message(
      'Telegram',
      name: 'NOTIFY_TARGET_TYPE_TELEGRAM',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get NOTIFY_FLOW_STATUS {
    return Intl.message(
      'Status',
      name: 'NOTIFY_FLOW_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `Unspecified`
  String get NOTIFY_FLOW_STATUS_UNSPECIFIED {
    return Intl.message(
      'Unspecified',
      name: 'NOTIFY_FLOW_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get NOTIFY_FLOW_STATUS_ACTIVE {
    return Intl.message(
      'Active',
      name: 'NOTIFY_FLOW_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `Suspend`
  String get NOTIFY_FLOW_STATUS_SUSPEND {
    return Intl.message(
      'Suspend',
      name: 'NOTIFY_FLOW_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
