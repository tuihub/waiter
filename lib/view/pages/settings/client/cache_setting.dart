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
      return UniversalListTile(
        leading: Icon(UniversalIcon(context).cache),
        title: Text(S.of(context).cache),
        subtitle: Text(
          FileSize.getSize(_cacheSize),
          style: TextStyle(
            color: Theme.of(context).disabledColor,
          ),
        ),
        trailing: UniversalToolBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            UniversalToolBarItem(
              icon: UniversalIcon(context).refresh,
              label: Text(S.of(context).refresh),
              onPressed: () {
                setState(() {
                  _cacheSize = context.read<MainBloc>().cacheSize();
                });
              },
            ),
            UniversalToolBarItem(
              icon: UniversalIcon(context).delete,
              label: Text(S.of(context).clearCache),
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
            )
          ],
        ),
      );
    });
  }
}
