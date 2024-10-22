part of 'client_setting_page.dart';

class CacheSetting extends StatefulWidget {
  const CacheSetting({super.key});

  @override
  State<CacheSetting> createState() => _CacheSettingState();
}

class _CacheSettingState extends State<CacheSetting> {
  var _clearing = false;
  var _cacheSize = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      _cacheSize = context.read<MainBloc>().cacheSize();
      return Card(
        margin: EdgeInsets.zero,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: UniversalListTile(
            title: Text(S.of(context).cache),
            subtitle: Text(
              FileSize.getSize(_cacheSize),
              style: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _cacheSize = context.read<MainBloc>().cacheSize();
                    });
                  },
                  icon: const Icon(Icons.cached),
                  label: Text(S.of(context).refresh),
                ),
                TextButton.icon(
                  onPressed: () async {
                    setState(() {
                      _clearing = true;
                    });
                    await context.read<MainBloc>().clearCache().then((_) {
                      setState(() {
                        _cacheSize = context.read<MainBloc>().cacheSize();
                      });
                    });
                    setState(() {
                      _clearing = false;
                    });
                  },
                  icon: _clearing
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                            ),
                          ))
                      : const Icon(Icons.delete),
                  label: Text(S.of(context).clearCache),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
