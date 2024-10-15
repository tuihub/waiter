import 'dart:io';
import 'package:win32_registry/win32_registry.dart';

import '../platform.dart';

Future<void> registerProtocol(String scheme) async {
  if (!PlatformHelper.isWindowsApp()) {
    return;
  }
  final String appPath = Platform.resolvedExecutable;

  final String protocolRegKey = 'Software\\Classes\\$scheme';
  const RegistryValue protocolRegValue = RegistryValue(
    'URL Protocol',
    RegistryValueType.string,
    '',
  );
  const String protocolCmdRegKey = r'shell\open\command';
  final RegistryValue protocolCmdRegValue = RegistryValue(
    '',
    RegistryValueType.string,
    '"$appPath" "%1"',
  );

  final regKey = Registry.currentUser.createKey(protocolRegKey);
  regKey.createValue(protocolRegValue);
  regKey.createKey(protocolCmdRegKey).createValue(protocolCmdRegValue);
}
