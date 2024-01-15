import 'package:petitparser/debug.dart';

import 'acf_parser.dart';

const input = r'''
"AppState"
{
	"appid"		"250900"
	"universe"		"1"
	"LauncherPath"		"C:\\Program Files (x86)\\Steam\\steam.exe"
	"name"		"The Binding of Isaac: Rebirth"
	"StateFlags"		"4"
	"installdir"		"The Binding of Isaac Rebirth"
	"lastupdated"		"1702484397"
	"SizeOnDisk"		"1163117782"
	"StagingSize"		"0"
	"buildid"		"10102354"
	"LastOwner"		"76561198424783854"
	"UpdateResult"		"0"
	"BytesToDownload"		"0"
	"BytesDownloaded"		"0"
	"BytesToStage"		"0"
	"BytesStaged"		"0"
	"TargetBuildID"		"0"
	"AutoUpdateBehavior"		"0"
	"AllowOtherDownloadsWhileRunning"		"0"
	"ScheduledAutoUpdate"		"0"
	"InstalledDepots"
	{
		"250902"
		{
			"manifest"		"4994611894646808503"
			"size"		"326498528"
		}
		"250905"
		{
			"manifest"		"1709017229885880564"
			"size"		"165283102"
			"dlcappid"		"401920"
		}
		"250908"
		{
			"manifest"		"7333987924869605149"
			"size"		"147989670"
			"dlcappid"		"570660"
		}
		"250911"
		{
			"manifest"		"7652847940910762229"
			"size"		"655313480"
			"dlcappid"		"1426300"
		}
	}
	"SharedDepots"
	{
		"228986"		"228980"
	}
	"UserConfig"
	{
		"language"		"english"
	}
	"MountedConfig"
	{
		"language"		"english"
	}
}
''';

void main() {
  final parser = AcfDefinition().build();
  trace(parser).parse(input);
  print(parser.parse(input).value);
}
