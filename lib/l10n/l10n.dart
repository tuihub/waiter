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

  /// `确认`
  String get confirm {
    return Intl.message(
      '确认',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `提交`
  String get submit {
    return Intl.message(
      '提交',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `关闭`
  String get close {
    return Intl.message(
      '关闭',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `解析失败`
  String get parseFailed {
    return Intl.message(
      '解析失败',
      name: 'parseFailed',
      desc: '',
      args: [],
    );
  }

  /// `发生未知错误`
  String get unknownErrorOccurred {
    return Intl.message(
      '发生未知错误',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `你确定要关闭吗？`
  String get areYouSureToClose {
    return Intl.message(
      '你确定要关闭吗？',
      name: 'areYouSureToClose',
      desc: '',
      args: [],
    );
  }

  /// `退出`
  String get exit {
    return Intl.message(
      '退出',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `最小化到托盘`
  String get minimizeToTray {
    return Intl.message(
      '最小化到托盘',
      name: 'minimizeToTray',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancel {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Web版本功能有限，仅供评估使用。`
  String get webVersionFunctionLimited {
    return Intl.message(
      'Web版本功能有限，仅供评估使用。',
      name: 'webVersionFunctionLimited',
      desc: '',
      args: [],
    );
  }

  /// `使用客户端登录`
  String get connectInClient {
    return Intl.message(
      '使用客户端登录',
      name: 'connectInClient',
      desc: '',
      args: [],
    );
  }

  /// `查看服务器信息`
  String get showServerConfig {
    return Intl.message(
      '查看服务器信息',
      name: 'showServerConfig',
      desc: '',
      args: [],
    );
  }

  /// `下载客户端`
  String get downloadClient {
    return Intl.message(
      '下载客户端',
      name: 'downloadClient',
      desc: '',
      args: [],
    );
  }

  /// `继续使用网页版`
  String get continueInWebVersion {
    return Intl.message(
      '继续使用网页版',
      name: 'continueInWebVersion',
      desc: '',
      args: [],
    );
  }

  /// `切换服务器`
  String get changeServer {
    return Intl.message(
      '切换服务器',
      name: 'changeServer',
      desc: '',
      args: [],
    );
  }

  /// `继续使用`
  String get continueInCurrentServer {
    return Intl.message(
      '继续使用',
      name: 'continueInCurrentServer',
      desc: '',
      args: [],
    );
  }

  /// `加载失败{reason}`
  String loadFailed(Object reason) {
    return Intl.message(
      '加载失败$reason',
      name: 'loadFailed',
      desc: '',
      args: [reason],
    );
  }

  /// `更改已应用`
  String get applySuccess {
    return Intl.message(
      '更改已应用',
      name: 'applySuccess',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `隐藏`
  String get hide {
    return Intl.message(
      '隐藏',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `添加`
  String get add {
    return Intl.message(
      '添加',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `必填`
  String get requiredField {
    return Intl.message(
      '必填',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `跳过加载`
  String get skipLoading {
    return Intl.message(
      '跳过加载',
      name: 'skipLoading',
      desc: '',
      args: [],
    );
  }

  /// `加载中`
  String get loading {
    return Intl.message(
      '加载中',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `加载失败`
  String get loadingFailed {
    return Intl.message(
      '加载失败',
      name: 'loadingFailed',
      desc: '',
      args: [],
    );
  }

  /// `无内容`
  String get emptyContent {
    return Intl.message(
      '无内容',
      name: 'emptyContent',
      desc: '',
      args: [],
    );
  }

  /// `没有更多内容`
  String get noMoreContent {
    return Intl.message(
      '没有更多内容',
      name: 'noMoreContent',
      desc: '',
      args: [],
    );
  }

  /// `连接`
  String get connect {
    return Intl.message(
      '连接',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `服务器连接成功 ↑↓ {delay}ms`
  String serverConnectTestSuccess(Object delay) {
    return Intl.message(
      '服务器连接成功 ↑↓ ${delay}ms',
      name: 'serverConnectTestSuccess',
      desc: '',
      args: [delay],
    );
  }

  /// `服务器连接失败 {reason}`
  String serverConnectTestFailed(Object reason) {
    return Intl.message(
      '服务器连接失败 $reason',
      name: 'serverConnectTestFailed',
      desc: '',
      args: [reason],
    );
  }

  /// `刚刚`
  String get durationJustNow {
    return Intl.message(
      '刚刚',
      name: 'durationJustNow',
      desc: '',
      args: [],
    );
  }

  /// `{number} 秒前`
  String durationSeconds(Object number) {
    return Intl.message(
      '$number 秒前',
      name: 'durationSeconds',
      desc: '',
      args: [number],
    );
  }

  /// `{number} 分钟前`
  String durationMinutes(Object number) {
    return Intl.message(
      '$number 分钟前',
      name: 'durationMinutes',
      desc: '',
      args: [number],
    );
  }

  /// `{number} 小时前`
  String durationHours(Object number) {
    return Intl.message(
      '$number 小时前',
      name: 'durationHours',
      desc: '',
      args: [number],
    );
  }

  /// `{number} 天前`
  String durationDays(Object number) {
    return Intl.message(
      '$number 天前',
      name: 'durationDays',
      desc: '',
      args: [number],
    );
  }

  /// `{number} 周前`
  String durationWeeks(Object number) {
    return Intl.message(
      '$number 周前',
      name: 'durationWeeks',
      desc: '',
      args: [number],
    );
  }

  /// `{number} 个月前`
  String durationMonths(Object number) {
    return Intl.message(
      '$number 个月前',
      name: 'durationMonths',
      desc: '',
      args: [number],
    );
  }

  /// `{number} 年前`
  String durationYears(Object number) {
    return Intl.message(
      '$number 年前',
      name: 'durationYears',
      desc: '',
      args: [number],
    );
  }

  /// `🎉欢迎！`
  String get welcomeHeader {
    return Intl.message(
      '🎉欢迎！',
      name: 'welcomeHeader',
      desc: '',
      args: [],
    );
  }

  /// `欢迎`
  String get welcome {
    return Intl.message(
      '欢迎',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `欢迎回来`
  String get welcomeBack {
    return Intl.message(
      '欢迎回来',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `点击登录以开始`
  String get clickLoginToStart {
    return Intl.message(
      '点击登录以开始',
      name: 'clickLoginToStart',
      desc: '',
      args: [],
    );
  }

  /// `服务器设置`
  String get serverSetup {
    return Intl.message(
      '服务器设置',
      name: 'serverSetup',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get address {
    return Intl.message(
      '地址',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `请输入服务器地址`
  String get pleaseInputServerAddress {
    return Intl.message(
      '请输入服务器地址',
      name: 'pleaseInputServerAddress',
      desc: '',
      args: [],
    );
  }

  /// `端口`
  String get port {
    return Intl.message(
      '端口',
      name: 'port',
      desc: '',
      args: [],
    );
  }

  /// `请输入服务器端口`
  String get pleaseInputServerPort {
    return Intl.message(
      '请输入服务器端口',
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

  /// `检查`
  String get check {
    return Intl.message(
      '检查',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `登录失败，{reason}`
  String loginFailed(Object reason) {
    return Intl.message(
      '登录失败，$reason',
      name: 'loginFailed',
      desc: '',
      args: [reason],
    );
  }

  /// `重试`
  String get retry {
    return Intl.message(
      '重试',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `登录到 {server}`
  String loggingInTo(Object server) {
    return Intl.message(
      '登录到 $server',
      name: 'loggingInTo',
      desc: '',
      args: [server],
    );
  }

  /// `返回`
  String get backward {
    return Intl.message(
      '返回',
      name: 'backward',
      desc: '',
      args: [],
    );
  }

  /// `用户名`
  String get username {
    return Intl.message(
      '用户名',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `密码`
  String get password {
    return Intl.message(
      '密码',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `再次输入密码`
  String get repeatPassword {
    return Intl.message(
      '再次输入密码',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get register {
    return Intl.message(
      '注册',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `注册到 {server}`
  String registerInTo(Object server) {
    return Intl.message(
      '注册到 $server',
      name: 'registerInTo',
      desc: '',
      args: [server],
    );
  }

  /// `注册成功`
  String get registerSuccess {
    return Intl.message(
      '注册成功',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `需要验证码`
  String get captchaRequired {
    return Intl.message(
      '需要验证码',
      name: 'captchaRequired',
      desc: '',
      args: [],
    );
  }

  /// `验证码`
  String get captcha {
    return Intl.message(
      '验证码',
      name: 'captcha',
      desc: '',
      args: [],
    );
  }

  /// `密码不一致`
  String get passwordInconsistent {
    return Intl.message(
      '密码不一致',
      name: 'passwordInconsistent',
      desc: '',
      args: [],
    );
  }

  /// `刷新验证码`
  String get refreshCaptcha {
    return Intl.message(
      '刷新验证码',
      name: 'refreshCaptcha',
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

  /// `用户取消了选择`
  String get updateImageUserCanceledPick {
    return Intl.message(
      '用户取消了选择',
      name: 'updateImageUserCanceledPick',
      desc: '',
      args: [],
    );
  }

  /// `用户取消了捕获`
  String get updateImageUserCanceledCapture {
    return Intl.message(
      '用户取消了捕获',
      name: 'updateImageUserCanceledCapture',
      desc: '',
      args: [],
    );
  }

  /// `上传图像失败`
  String get uploadImageFailed {
    return Intl.message(
      '上传图像失败',
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

  /// `商店`
  String get store {
    return Intl.message(
      '商店',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `库`
  String get library {
    return Intl.message(
      '库',
      name: 'library',
      desc: '',
      args: [],
    );
  }

  /// `本地库管理`
  String get localLibraryManage {
    return Intl.message(
      '本地库管理',
      name: 'localLibraryManage',
      desc: '',
      args: [],
    );
  }

  /// `未知应用`
  String get unknownApp {
    return Intl.message(
      '未知应用',
      name: 'unknownApp',
      desc: '',
      args: [],
    );
  }

  /// `请设置应用程序路径`
  String get pleaseSetupApplicationPath {
    return Intl.message(
      '请设置应用程序路径',
      name: 'pleaseSetupApplicationPath',
      desc: '',
      args: [],
    );
  }

  /// `请不要重复运行应用程序`
  String get pleaseDontReRunApplication {
    return Intl.message(
      '请不要重复运行应用程序',
      name: 'pleaseDontReRunApplication',
      desc: '',
      args: [],
    );
  }

  /// `应用程序异常退出`
  String get applicationExitAbnormally {
    return Intl.message(
      '应用程序异常退出',
      name: 'applicationExitAbnormally',
      desc: '',
      args: [],
    );
  }

  /// `启动器错误`
  String get launcherError {
    return Intl.message(
      '启动器错误',
      name: 'launcherError',
      desc: '',
      args: [],
    );
  }

  /// `正在扫描本地文件`
  String get scanningLocalFiles {
    return Intl.message(
      '正在扫描本地文件',
      name: 'scanningLocalFiles',
      desc: '',
      args: [],
    );
  }

  /// `发现 {number} 个新应用`
  String newApplicationFound(Object number) {
    return Intl.message(
      '发现 $number 个新应用',
      name: 'newApplicationFound',
      desc: '',
      args: [number],
    );
  }

  /// `正在导入应用程序`
  String get importingCommonApplications {
    return Intl.message(
      '正在导入应用程序',
      name: 'importingCommonApplications',
      desc: '',
      args: [],
    );
  }

  /// `导入应用程序完成，成功 {success} 个，失败 {failed} 个。`
  String importCommonApplicationFinished(Object success, Object failed) {
    return Intl.message(
      '导入应用程序完成，成功 $success 个，失败 $failed 个。',
      name: 'importCommonApplicationFinished',
      desc: '',
      args: [success, failed],
    );
  }

  /// `正在导入Steam应用程序`
  String get importingSteamApplications {
    return Intl.message(
      '正在导入Steam应用程序',
      name: 'importingSteamApplications',
      desc: '',
      args: [],
    );
  }

  /// `导入Steam应用程序完成，成功 {success} 个，失败 {failed} 个。`
  String importSteamApplicationFinished(Object success, Object failed) {
    return Intl.message(
      '导入Steam应用程序完成，成功 $success 个，失败 $failed 个。',
      name: 'importSteamApplicationFinished',
      desc: '',
      args: [success, failed],
    );
  }

  /// `库中没有应用`
  String get noAppInLibrary {
    return Intl.message(
      '库中没有应用',
      name: 'noAppInLibrary',
      desc: '',
      args: [],
    );
  }

  /// `添加应用`
  String get addApplication {
    return Intl.message(
      '添加应用',
      name: 'addApplication',
      desc: '',
      args: [],
    );
  }

  /// `不支持当前平台`
  String get steamScanResultPlatformUnsupported {
    return Intl.message(
      '不支持当前平台',
      name: 'steamScanResultPlatformUnsupported',
      desc: '',
      args: [],
    );
  }

  /// `未发现Steam客户端`
  String get steamScanResultSteamNotFound {
    return Intl.message(
      '未发现Steam客户端',
      name: 'steamScanResultSteamNotFound',
      desc: '',
      args: [],
    );
  }

  /// `未发现Steam游戏库`
  String get steamScanResultLibraryNotFound {
    return Intl.message(
      '未发现Steam游戏库',
      name: 'steamScanResultLibraryNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Steam游戏库为空`
  String get steamScanResultLibraryEmpty {
    return Intl.message(
      'Steam游戏库为空',
      name: 'steamScanResultLibraryEmpty',
      desc: '',
      args: [],
    );
  }

  /// `扫描时出现未知错误`
  String get steamScanResultUnknownError {
    return Intl.message(
      '扫描时出现未知错误',
      name: 'steamScanResultUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `扫描完成`
  String get steamScanResultFinished {
    return Intl.message(
      '扫描完成',
      name: 'steamScanResultFinished',
      desc: '',
      args: [],
    );
  }

  /// `Yesod`
  String get yesod {
    return Intl.message(
      'Yesod',
      name: 'yesod',
      desc: '',
      args: [],
    );
  }

  /// `订阅管理`
  String get feedConfigManage {
    return Intl.message(
      '订阅管理',
      name: 'feedConfigManage',
      desc: '',
      args: [],
    );
  }

  /// `添加订阅`
  String get feedConfigAdd {
    return Intl.message(
      '添加订阅',
      name: 'feedConfigAdd',
      desc: '',
      args: [],
    );
  }

  /// `编辑订阅`
  String get feedConfigEdit {
    return Intl.message(
      '编辑订阅',
      name: 'feedConfigEdit',
      desc: '',
      args: [],
    );
  }

  /// `自动化`
  String get automation {
    return Intl.message(
      '自动化',
      name: 'automation',
      desc: '',
      args: [],
    );
  }

  /// `规则集管理`
  String get feedActionSetManage {
    return Intl.message(
      '规则集管理',
      name: 'feedActionSetManage',
      desc: '',
      args: [],
    );
  }

  /// `添加规则集`
  String get feedActionSetAdd {
    return Intl.message(
      '添加规则集',
      name: 'feedActionSetAdd',
      desc: '',
      args: [],
    );
  }

  /// `编辑规则集`
  String get feedActionSetEdit {
    return Intl.message(
      '编辑规则集',
      name: 'feedActionSetEdit',
      desc: '',
      args: [],
    );
  }

  /// `全部文章`
  String get allArticles {
    return Intl.message(
      '全部文章',
      name: 'allArticles',
      desc: '',
      args: [],
    );
  }

  /// `筛选文章`
  String get filteredArticles {
    return Intl.message(
      '筛选文章',
      name: 'filteredArticles',
      desc: '',
      args: [],
    );
  }

  /// `推送管理`
  String get notifyFlowManage {
    return Intl.message(
      '推送管理',
      name: 'notifyFlowManage',
      desc: '',
      args: [],
    );
  }

  /// `添加推送`
  String get notifyFlowAdd {
    return Intl.message(
      '添加推送',
      name: 'notifyFlowAdd',
      desc: '',
      args: [],
    );
  }

  /// `编辑推送`
  String get notifyFlowEdit {
    return Intl.message(
      '编辑推送',
      name: 'notifyFlowEdit',
      desc: '',
      args: [],
    );
  }

  /// `推送目标管理`
  String get notifyTargetManage {
    return Intl.message(
      '推送目标管理',
      name: 'notifyTargetManage',
      desc: '',
      args: [],
    );
  }

  /// `添加推送目标`
  String get notifyTargetAdd {
    return Intl.message(
      '添加推送目标',
      name: 'notifyTargetAdd',
      desc: '',
      args: [],
    );
  }

  /// `编辑推送目标`
  String get notifyTargetEdit {
    return Intl.message(
      '编辑推送目标',
      name: 'notifyTargetEdit',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get settings {
    return Intl.message(
      '设置',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `当前设备`
  String get currentDevice {
    return Intl.message(
      '当前设备',
      name: 'currentDevice',
      desc: '',
      args: [],
    );
  }

  /// `未知设备`
  String get unknownDevice {
    return Intl.message(
      '未知设备',
      name: 'unknownDevice',
      desc: '',
      args: [],
    );
  }

  /// `未知客户端`
  String get unknownClient {
    return Intl.message(
      '未知客户端',
      name: 'unknownClient',
      desc: '',
      args: [],
    );
  }

  /// `登录已过期`
  String get loginExpired {
    return Intl.message(
      '登录已过期',
      name: 'loginExpired',
      desc: '',
      args: [],
    );
  }

  /// `设备详情`
  String get deviceDetail {
    return Intl.message(
      '设备详情',
      name: 'deviceDetail',
      desc: '',
      args: [],
    );
  }

  /// `设备名称`
  String get deviceName {
    return Intl.message(
      '设备名称',
      name: 'deviceName',
      desc: '',
      args: [],
    );
  }

  /// `操作系统`
  String get operatingSystem {
    return Intl.message(
      '操作系统',
      name: 'operatingSystem',
      desc: '',
      args: [],
    );
  }

  /// `客户端`
  String get client {
    return Intl.message(
      '客户端',
      name: 'client',
      desc: '',
      args: [],
    );
  }

  /// `上次登录`
  String get lastLogin {
    return Intl.message(
      '上次登录',
      name: 'lastLogin',
      desc: '',
      args: [],
    );
  }

  /// `注销设备`
  String get logoutDevice {
    return Intl.message(
      '注销设备',
      name: 'logoutDevice',
      desc: '',
      args: [],
    );
  }

  /// `客户端设置`
  String get clientSetting {
    return Intl.message(
      '客户端设置',
      name: 'clientSetting',
      desc: '',
      args: [],
    );
  }

  /// `主题`
  String get theme {
    return Intl.message(
      '主题',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `当前主题`
  String get currentTheme {
    return Intl.message(
      '当前主题',
      name: 'currentTheme',
      desc: '',
      args: [],
    );
  }

  /// `缓存`
  String get cache {
    return Intl.message(
      '缓存',
      name: 'cache',
      desc: '',
      args: [],
    );
  }

  /// `刷新`
  String get refresh {
    return Intl.message(
      '刷新',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `清空`
  String get clearCache {
    return Intl.message(
      '清空',
      name: 'clearCache',
      desc: '',
      args: [],
    );
  }

  /// `插件管理`
  String get pluginManage {
    return Intl.message(
      '插件管理',
      name: 'pluginManage',
      desc: '',
      args: [],
    );
  }

  /// `{working}/{enabled} ({total}) 个正在工作`
  String pluginWorkingProportion(Object working, Object enabled, Object total) {
    return Intl.message(
      '$working/$enabled ($total) 个正在工作',
      name: 'pluginWorkingProportion',
      desc: '',
      args: [working, enabled, total],
    );
  }

  /// `插件环境管理`
  String get pluginContextManage {
    return Intl.message(
      '插件环境管理',
      name: 'pluginContextManage',
      desc: '',
      args: [],
    );
  }

  /// `警告：你正在管理服务器{serverName}数据，你的操作将影响所有用户`
  String adminAreaWarning(Object serverName) {
    return Intl.message(
      '警告：你正在管理服务器$serverName数据，你的操作将影响所有用户',
      name: 'adminAreaWarning',
      desc: '',
      args: [serverName],
    );
  }

  /// `Chrome`
  String get chrome {
    return Intl.message(
      'Chrome',
      name: 'chrome',
      desc: '',
      args: [],
    );
  }

  /// `Firefox`
  String get firefox {
    return Intl.message(
      'Firefox',
      name: 'firefox',
      desc: '',
      args: [],
    );
  }

  /// `Safari`
  String get safari {
    return Intl.message(
      'Safari',
      name: 'safari',
      desc: '',
      args: [],
    );
  }

  /// `Edge`
  String get edge {
    return Intl.message(
      'Edge',
      name: 'edge',
      desc: '',
      args: [],
    );
  }

  /// `Opera`
  String get opera {
    return Intl.message(
      'Opera',
      name: 'opera',
      desc: '',
      args: [],
    );
  }

  /// `IE`
  String get msie {
    return Intl.message(
      'IE',
      name: 'msie',
      desc: '',
      args: [],
    );
  }

  /// `三星`
  String get samsung {
    return Intl.message(
      '三星',
      name: 'samsung',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get unknown {
    return Intl.message(
      '未知',
      name: 'unknown',
      desc: '',
      args: [],
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

  /// `类型`
  String get USER_TYPE {
    return Intl.message(
      '类型',
      name: 'USER_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get USER_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'USER_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `管理员`
  String get USER_TYPE_ADMIN {
    return Intl.message(
      '管理员',
      name: 'USER_TYPE_ADMIN',
      desc: '',
      args: [],
    );
  }

  /// `普通`
  String get USER_TYPE_NORMAL {
    return Intl.message(
      '普通',
      name: 'USER_TYPE_NORMAL',
      desc: '',
      args: [],
    );
  }

  /// `扫描器`
  String get USER_TYPE_SENTINEL {
    return Intl.message(
      '扫描器',
      name: 'USER_TYPE_SENTINEL',
      desc: '',
      args: [],
    );
  }

  /// `状态`
  String get USER_STATUS {
    return Intl.message(
      '状态',
      name: 'USER_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get USER_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'USER_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `正常`
  String get USER_STATUS_ACTIVE {
    return Intl.message(
      '正常',
      name: 'USER_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `禁用`
  String get USER_STATUS_BLOCKED {
    return Intl.message(
      '禁用',
      name: 'USER_STATUS_BLOCKED',
      desc: '',
      args: [],
    );
  }

  /// `平台`
  String get ACCOUNT_PLATFORM {
    return Intl.message(
      '平台',
      name: 'ACCOUNT_PLATFORM',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get ACCOUNT_PLATFORM_UNSPECIFIED {
    return Intl.message(
      '未知',
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

  /// `来源`
  String get APP_SOURCE {
    return Intl.message(
      '来源',
      name: 'APP_SOURCE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get APP_SOURCE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'APP_SOURCE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `内置`
  String get APP_SOURCE_INTERNAL {
    return Intl.message(
      '内置',
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

  /// `类型`
  String get APP_TYPE {
    return Intl.message(
      '类型',
      name: 'APP_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get APP_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'APP_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `游戏`
  String get APP_TYPE_GAME {
    return Intl.message(
      '游戏',
      name: 'APP_TYPE_GAME',
      desc: '',
      args: [],
    );
  }

  /// `状态`
  String get FEED_CONFIG_STATUS {
    return Intl.message(
      '状态',
      name: 'FEED_CONFIG_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get FEED_CONFIG_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'FEED_CONFIG_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `启用`
  String get FEED_CONFIG_STATUS_ACTIVE {
    return Intl.message(
      '启用',
      name: 'FEED_CONFIG_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `停止`
  String get FEED_CONFIG_STATUS_SUSPEND {
    return Intl.message(
      '停止',
      name: 'FEED_CONFIG_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `状态`
  String get NOTIFY_TARGET_STATUS {
    return Intl.message(
      '状态',
      name: 'NOTIFY_TARGET_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get NOTIFY_TARGET_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'NOTIFY_TARGET_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `启用`
  String get NOTIFY_TARGET_STATUS_ACTIVE {
    return Intl.message(
      '启用',
      name: 'NOTIFY_TARGET_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `停止`
  String get NOTIFY_TARGET_STATUS_SUSPEND {
    return Intl.message(
      '停止',
      name: 'NOTIFY_TARGET_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `类型`
  String get NOTIFY_TARGET_TYPE {
    return Intl.message(
      '类型',
      name: 'NOTIFY_TARGET_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get NOTIFY_TARGET_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
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

  /// `状态`
  String get NOTIFY_FLOW_STATUS {
    return Intl.message(
      '状态',
      name: 'NOTIFY_FLOW_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get NOTIFY_FLOW_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'NOTIFY_FLOW_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `启用`
  String get NOTIFY_FLOW_STATUS_ACTIVE {
    return Intl.message(
      '启用',
      name: 'NOTIFY_FLOW_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `停止`
  String get NOTIFY_FLOW_STATUS_SUSPEND {
    return Intl.message(
      '停止',
      name: 'NOTIFY_FLOW_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get PORTER_CONNECTION_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'PORTER_CONNECTION_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `已连接未启用`
  String get PORTER_CONNECTION_STATUS_CONNECTED {
    return Intl.message(
      '已连接未启用',
      name: 'PORTER_CONNECTION_STATUS_CONNECTED',
      desc: '',
      args: [],
    );
  }

  /// `连接断开`
  String get PORTER_CONNECTION_STATUS_DISCONNECTED {
    return Intl.message(
      '连接断开',
      name: 'PORTER_CONNECTION_STATUS_DISCONNECTED',
      desc: '',
      args: [],
    );
  }

  /// `工作中`
  String get PORTER_CONNECTION_STATUS_ACTIVE {
    return Intl.message(
      '工作中',
      name: 'PORTER_CONNECTION_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `启用失败`
  String get PORTER_CONNECTION_STATUS_ACTIVATION_FAILED {
    return Intl.message(
      '启用失败',
      name: 'PORTER_CONNECTION_STATUS_ACTIVATION_FAILED',
      desc: '',
      args: [],
    );
  }

  /// `降级`
  String get PORTER_CONNECTION_STATUS_DOWNGRADED {
    return Intl.message(
      '降级',
      name: 'PORTER_CONNECTION_STATUS_DOWNGRADED',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get PORTER_CONTEXT_HANDLE_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'PORTER_CONTEXT_HANDLE_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `排队中`
  String get PORTER_CONTEXT_HANDLE_STATUS_QUEUEING {
    return Intl.message(
      '排队中',
      name: 'PORTER_CONTEXT_HANDLE_STATUS_QUEUEING',
      desc: '',
      args: [],
    );
  }

  /// `降级`
  String get PORTER_CONTEXT_HANDLE_STATUS_DOWNGRADED {
    return Intl.message(
      '降级',
      name: 'PORTER_CONTEXT_HANDLE_STATUS_DOWNGRADED',
      desc: '',
      args: [],
    );
  }

  /// `工作中`
  String get PORTER_CONTEXT_HANDLE_STATUS_ACTIVE {
    return Intl.message(
      '工作中',
      name: 'PORTER_CONTEXT_HANDLE_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `未安排`
  String get PORTER_CONTEXT_HANDLE_STATUS_BLOCKED {
    return Intl.message(
      '未安排',
      name: 'PORTER_CONTEXT_HANDLE_STATUS_BLOCKED',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `错误`
  String get SYSTEM_NOTIFICATION_LEVEL_ERROR {
    return Intl.message(
      '错误',
      name: 'SYSTEM_NOTIFICATION_LEVEL_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `警告`
  String get SYSTEM_NOTIFICATION_LEVEL_WARNING {
    return Intl.message(
      '警告',
      name: 'SYSTEM_NOTIFICATION_LEVEL_WARNING',
      desc: '',
      args: [],
    );
  }

  /// `信息`
  String get SYSTEM_NOTIFICATION_LEVEL_INFO {
    return Intl.message(
      '信息',
      name: 'SYSTEM_NOTIFICATION_LEVEL_INFO',
      desc: '',
      args: [],
    );
  }

  /// `进行中`
  String get SYSTEM_NOTIFICATION_LEVEL_ONGOING {
    return Intl.message(
      '进行中',
      name: 'SYSTEM_NOTIFICATION_LEVEL_ONGOING',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get SYSTEM_NOTIFICATION_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'SYSTEM_NOTIFICATION_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `系统`
  String get SYSTEM_NOTIFICATION_TYPE_SYSTEM {
    return Intl.message(
      '系统',
      name: 'SYSTEM_NOTIFICATION_TYPE_SYSTEM',
      desc: '',
      args: [],
    );
  }

  /// `用户`
  String get SYSTEM_NOTIFICATION_TYPE_USER {
    return Intl.message(
      '用户',
      name: 'SYSTEM_NOTIFICATION_TYPE_USER',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
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
