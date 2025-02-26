part of 'server_select_page.dart';

class ServerLinkAddDialog extends StatefulWidget {
  const ServerLinkAddDialog(this.navigator, {super.key, required this.server});

  final NavigatorState navigator;
  final ServerConfig server;

  @override
  State<ServerLinkAddDialog> createState() => _ServerLinkAddDialogState();
}

class _ServerLinkAddDialogState extends State<ServerLinkAddDialog> {
  @override
  void initState() {
    super.initState();
    _connect();
  }

  void _connect() {
    setState(() {
      processing = true;
    });
    context
        .read<MainBloc>()
        .add(MainGetServerInfoEvent(null, server: widget.server));
  }

  bool processing = true;
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainGetServerInfoState) {
          if (state.statusCode == EventStatus.success) {
            setState(() {
              processing = false;
              connected = true;
            });
          }
          if (state.statusCode == EventStatus.failed) {
            UniversalToast.show(
              context,
              message: S.of(context).serverConnectTestFailed(state.msg ?? ''),
            );
            setState(() {
              processing = false;
            });
          }
        }
      },
      builder: (context, state) {
        Widget content = const SizedBox();
        if (processing) {
          content = const LinearProgressIndicator();
        } else if (connected) {
          final instanceSummary =
              state.knownServerInstanceSummaries[widget.server.serverID];
          if (instanceSummary == null) {
            content = const Text('Unknown server');
          } else {
            content = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (instanceSummary.logoUrl.isNotEmpty)
                  Container(
                    height: 128,
                    width: 128,
                    margin: const EdgeInsets.all(16),
                    child: ExtendedImage.network(
                      instanceSummary.logoUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                Center(
                  child: Text(
                    instanceSummary.name.isNotEmpty
                        ? instanceSummary.name
                        : S.of(context).loggingInTo(widget.server.host),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (instanceSummary.description.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(instanceSummary.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
              ],
            );
          }
        }
        return UniversalDialog(
          title: const Text('添加服务器'),
          content: content,
          actions: [
            UniversalDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            UniversalDialogAction(
              onPressed: _connect,
              child: Text(S.of(context).retry),
            ),
            UniversalDialogAction(
              isPrimary: true,
              onPressed: connected
                  ? () async {
                      Navigator.of(context).pop();
                      await widget.navigator.push(
                        UniversalPageRoute(builder: (context) {
                          return _TipherethServerLoginPage(
                              server: widget.server);
                        }),
                      );
                    }
                  : null,
              child: Text(S.of(context).connect),
            ),
          ],
        );
      },
    );
  }
}
