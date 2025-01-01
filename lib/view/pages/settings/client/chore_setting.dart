part of 'client_setting_page.dart';

class ChoreSetting extends StatelessWidget {
  const ChoreSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final basePath = DIService.instance.dataPath;
    return BlocBuilder<ClientSettingBloc, ClientSettingState>(
        builder: (context, state) {
      return UniversalExpansionTile(
        leading: Icon(UniversalUI.of(context).icons.warning),
        title: const Text('高级'),
        subtitle: const Text('使用前确保你知道你在做什么'),
        children: [
          if (!PlatformHelper.isWeb())
            UniversalListTile(
              title: const Text('使用系统代理（实验性）'),
              trailing: UniversalSwitch(
                value: state.useSystemProxy ?? false,
                onChanged: (value) {
                  context
                      .read<ClientSettingBloc>()
                      .add(ChangeUseSystemProxyEvent(value));
                },
              ),
            ),
          if (PlatformHelper.isWindowsApp())
            UniversalListTile(
              title: const Text('使用 Fluent UI（实验性）'),
              trailing: UniversalSwitch(
                value: state.useFluentUI ?? false,
                onChanged: (value) {
                  context
                      .read<ClientSettingBloc>()
                      .add(ChangeUseFluentUIEvent(value));
                },
              ),
            ),
          if (PlatformHelper.isWindowsApp())
            UniversalListTile(
              title: const Text('数据目录'),
              subtitle: Text(basePath),
              trailing: UniversalIconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: () {
                  unawaited(OpenFile.open(basePath));
                },
              ),
            ),
        ],
      );
    });
  }
}
