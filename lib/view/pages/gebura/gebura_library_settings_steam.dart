part of 'gebura_library_settings.dart';

String? _steamScanResultString(BuildContext context, SteamScanResult? result) {
  if (result == null) {
    return null;
  }
  switch (result) {
    case SteamScanResult.unavailable:
      return S.of(context).steamScanResultPlatformUnsupported;
    case SteamScanResult.steamInstallationNotFound:
      return S.of(context).steamScanResultSteamNotFound;
    case SteamScanResult.libraryFoldersNotFound:
      return S.of(context).steamScanResultLibraryNotFound;
    case SteamScanResult.libraryEmpty:
      return S.of(context).steamScanResultLibraryEmpty;
    case SteamScanResult.unknownError:
      return S.of(context).steamScanResultUnknownError;
    case SteamScanResult.fullyScanned:
      return null;
  }
}
