part of 'client_setting_page.dart';

class ChoreSetting extends StatelessWidget {
  const ChoreSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final basePath = context.read<MainBloc>().basePath;
    return BlocBuilder<ClientSettingBloc, ClientSettingState>(
        builder: (context, state) {
      return Card(
        margin: EdgeInsets.zero,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            title: const Text('杂项'),
            children: [
              if (!PlatformHelper.isWeb())
                ListTile(
                  title: const Text('使用系统代理（实验性）'),
                  trailing: Switch(
                    value: state.useSystemProxy ?? false,
                    onChanged: (value) {
                      context
                          .read<ClientSettingBloc>()
                          .add(ChangeUseSystemProxyEvent(value));
                    },
                  ),
                ),
              if (basePath != null && PlatformHelper.isWindowsApp())
                ListTile(
                  title: const Text('数据目录'),
                  subtitle: Text(basePath),
                  trailing: IconButton(
                    icon: const Icon(Icons.open_in_new),
                    onPressed: () {
                      unawaited(OpenFile.open(basePath));
                    },
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
