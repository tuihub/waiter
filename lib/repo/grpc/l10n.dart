import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pbenum.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pbenum.dart';

import '../../l10n/l10n.dart';

String userTypeString(UserType type) {
  switch (type) {
    case UserType.USER_TYPE_UNSPECIFIED:
      return S.current.USER_TYPE_UNSPECIFIED;
    case UserType.USER_TYPE_ADMIN:
      return S.current.USER_TYPE_ADMIN;
    case UserType.USER_TYPE_NORMAL:
      return S.current.USER_TYPE_NORMAL;
    case UserType.USER_TYPE_SENTINEL:
      return S.current.USER_TYPE_SENTINEL;
  }
  return '';
}

String userStatusString(UserStatus status) {
  switch (status) {
    case UserStatus.USER_STATUS_UNSPECIFIED:
      return S.current.USER_STATUS_UNSPECIFIED;
    case UserStatus.USER_STATUS_ACTIVE:
      return S.current.USER_STATUS_ACTIVE;
    case UserStatus.USER_STATUS_BLOCKED:
      return S.current.USER_STATUS_BLOCKED;
  }
  return '';
}

String accountPlatformString(AccountPlatform platform) {
  switch (platform) {
    case AccountPlatform.ACCOUNT_PLATFORM_UNSPECIFIED:
      return S.current.ACCOUNT_PLATFORM_UNSPECIFIED;
    case AccountPlatform.ACCOUNT_PLATFORM_STEAM:
      return S.current.ACCOUNT_PLATFORM_STEAM;
  }
  return '';
}

String appSourceString(AppSource source) {
  switch (source) {
    case AppSource.APP_SOURCE_UNSPECIFIED:
      return S.current.APP_SOURCE_UNSPECIFIED;
    case AppSource.APP_SOURCE_INTERNAL:
      return S.current.APP_SOURCE_INTERNAL;
    case AppSource.APP_SOURCE_STEAM:
      return S.current.APP_SOURCE_STEAM;
  }
  return '';
}

String appTypeString(AppType type) {
  switch (type) {
    case AppType.APP_TYPE_UNSPECIFIED:
      return S.current.APP_TYPE_UNSPECIFIED;
    case AppType.APP_TYPE_GAME:
      return S.current.APP_TYPE_GAME;
  }
  return '';
}

String appPackageSourceString(AppPackageSource source) {
  switch (source) {
    case AppPackageSource.APP_PACKAGE_SOURCE_UNSPECIFIED:
      return S.current.APP_PACKAGE_SOURCE_UNSPECIFIED;
    case AppPackageSource.APP_PACKAGE_SOURCE_MANUAL:
      return S.current.APP_PACKAGE_SOURCE_MANUAL;
    case AppPackageSource.APP_PACKAGE_SOURCE_SENTINEL:
      return S.current.APP_PACKAGE_SOURCE_SENTINEL;
  }
  return '';
}

String feedConfigStatusString(FeedConfigStatus status) {
  switch (status) {
    case FeedConfigStatus.FEED_CONFIG_STATUS_UNSPECIFIED:
      return S.current.FEED_CONFIG_STATUS_UNSPECIFIED;
    case FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE:
      return S.current.FEED_CONFIG_STATUS_ACTIVE;
    case FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND:
      return S.current.FEED_CONFIG_STATUS_SUSPEND;
  }
  return '';
}

String notifyTargetTypeString(NotifyTargetType type) {
  switch (type) {
    case NotifyTargetType.NOTIFY_TARGET_TYPE_UNSPECIFIED:
      return S.current.NOTIFY_TARGET_TYPE_UNSPECIFIED;
    case NotifyTargetType.NOTIFY_TARGET_TYPE_TELEGRAM:
      return S.current.NOTIFY_TARGET_TYPE_TELEGRAM;
  }
  return '';
}

String notifyTargetStatusString(NotifyTargetStatus status) {
  switch (status) {
    case NotifyTargetStatus.NOTIFY_TARGET_STATUS_UNSPECIFIED:
      return S.current.NOTIFY_TARGET_STATUS_UNSPECIFIED;
    case NotifyTargetStatus.NOTIFY_TARGET_STATUS_ACTIVE:
      return S.current.NOTIFY_TARGET_STATUS_ACTIVE;
    case NotifyTargetStatus.NOTIFY_TARGET_STATUS_SUSPEND:
      return S.current.NOTIFY_TARGET_STATUS_SUSPEND;
  }
  return '';
}
