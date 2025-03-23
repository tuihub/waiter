import 'package:tuihub_protos/librarian/porter/v1/gebura.pbenum.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/netzach.pbenum.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/yesod.pb.dart';

import 'l10n.dart';

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

String accountPlatformString(String platform) {
  switch (platform) {
    case '':
      return S.current.ACCOUNT_PLATFORM_UNSPECIFIED;
    case 'steam':
      return S.current.ACCOUNT_PLATFORM_STEAM;
  }
  return platform;
}

String appSourceString(String source) {
  switch (source) {
    case '':
      return S.current.APP_SOURCE_UNSPECIFIED;
    case 'steam':
      return S.current.APP_SOURCE_STEAM;
  }
  return source;
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

String notifyTargetDestinationString(String destination) {
  switch (destination) {
    case '':
      return S.current.NOTIFY_TARGET_TYPE_UNSPECIFIED;
    case 'telegram':
      return S.current.NOTIFY_TARGET_TYPE_TELEGRAM;
  }
  return destination;
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

String notifyFlowStatusString(NotifyFlowStatus status) {
  switch (status) {
    case NotifyFlowStatus.NOTIFY_FLOW_STATUS_UNSPECIFIED:
      return S.current.NOTIFY_FLOW_STATUS_UNSPECIFIED;
    case NotifyFlowStatus.NOTIFY_FLOW_STATUS_ACTIVE:
      return S.current.NOTIFY_FLOW_STATUS_ACTIVE;
    case NotifyFlowStatus.NOTIFY_FLOW_STATUS_SUSPEND:
      return S.current.NOTIFY_FLOW_STATUS_SUSPEND;
  }
  return '';
}

String porterConnectionStatusString(PorterConnectionStatus status) {
  switch (status) {
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_UNSPECIFIED:
      return S.current.PORTER_CONNECTION_STATUS_UNSPECIFIED;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_CONNECTED:
      return S.current.PORTER_CONNECTION_STATUS_CONNECTED;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DISCONNECTED:
      return S.current.PORTER_CONNECTION_STATUS_DISCONNECTED;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVE:
      return S.current.PORTER_CONNECTION_STATUS_ACTIVE;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_ACTIVATION_FAILED:
      return S.current.PORTER_CONNECTION_STATUS_ACTIVATION_FAILED;
    case PorterConnectionStatus.PORTER_CONNECTION_STATUS_DOWNGRADED:
      return S.current.PORTER_CONNECTION_STATUS_DOWNGRADED;
  }
  return '';
}

String porterContextHandleStatusString(PorterContextHandleStatus status) {
  switch (status) {
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_UNSPECIFIED:
      return S.current.PORTER_CONTEXT_HANDLE_STATUS_UNSPECIFIED;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_ACTIVE:
      return S.current.PORTER_CONTEXT_HANDLE_STATUS_ACTIVE;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_DOWNGRADED:
      return S.current.PORTER_CONTEXT_HANDLE_STATUS_DOWNGRADED;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_QUEUEING:
      return S.current.PORTER_CONTEXT_HANDLE_STATUS_QUEUEING;
    case PorterContextHandleStatus.PORTER_CONTEXT_HANDLE_STATUS_BLOCKED:
      return S.current.PORTER_CONTEXT_HANDLE_STATUS_BLOCKED;
  }
  return '';
}

String systemNotificationLevelString(SystemNotificationLevel level) {
  switch (level) {
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED:
      return S.current.SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ERROR:
      return S.current.SYSTEM_NOTIFICATION_LEVEL_ERROR;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_WARNING:
      return S.current.SYSTEM_NOTIFICATION_LEVEL_WARNING;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_INFO:
      return S.current.SYSTEM_NOTIFICATION_LEVEL_INFO;
    case SystemNotificationLevel.SYSTEM_NOTIFICATION_LEVEL_ONGOING:
      return S.current.SYSTEM_NOTIFICATION_LEVEL_ONGOING;
  }
  return '';
}
