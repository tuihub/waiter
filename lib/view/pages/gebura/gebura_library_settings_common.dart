part of 'gebura_library_settings.dart';

class _CommonSettingCard extends StatelessWidget {
  const _CommonSettingCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final libraryFolders = state.localSteamLibraryFolders ?? [];
      return Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: SpacingHelper.listSpacing(width: 16, children: [
                  const Icon(Icons.folder),
                  const Text('文件夹扫描'),
                  const Expanded(child: SizedBox()),
                  // OutlinedButton.icon(
                  //   label: const Text('添加应用'),
                  //   icon: const Icon(FontAwesomeIcons.circlePlus),
                  //   onPressed: () {
                  //     // unawaited(
                  //     //   showDialog(
                  //     //     context: context,
                  //     //     builder: (_) {
                  //     //       return BlocProvider.value(
                  //     //         value: context.read<GeburaBloc>(),
                  //     //         child: const NewLocalAppInstDialog(),
                  //     //       );
                  //     //     },
                  //     //   ),
                  //     // );
                  //   },
                  // ),
                  OutlinedButton.icon(
                    label: const Text('添加文件夹'),
                    icon: const Icon(FontAwesomeIcons.folderPlus),
                    onPressed: null,
                  ),
                ]),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    });
  }
}
