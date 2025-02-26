part of 'server_select_page.dart';

class ServerManualAddDialog extends StatefulWidget {
  const ServerManualAddDialog(this.navigator, {super.key});

  final NavigatorState navigator;

  @override
  State<ServerManualAddDialog> createState() => _ServerManualAddDialogState();
}

class _ServerManualAddDialogState extends State<ServerManualAddDialog> {
  final _formKey = GlobalKey<FormState>();

  String host = '';
  int port = 0;
  bool tls = false;
  ServerConfig server = const ServerConfig(host: '', port: 0, enableTLS: true);
  bool processing = false;

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: SpacingHelper.listSpacing(height: 8, children: [
          UniversalTextFormField(
            onSaved: (newValue) => host = newValue!,
            labelText: S.of(context).address,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseInputServerAddress;
              }
              return null;
            },
          ),
          UniversalTextFormField(
            onSaved: (newValue) => port = int.parse(newValue!),
            labelText: S.of(context).port,
            validator: (value) {
              final p = int.tryParse(value!) ?? 0;
              if (p <= 0) {
                return S.of(context).pleaseInputServerPort;
              }
              return null;
            },
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          UniversalSwitchFormField(
            onSaved: (newValue) => tls = newValue!,
            title: Text(S.of(context).tls),
            initialValue: tls,
          ),
          if (processing) const UniversalLinearProgressIndicator(),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainGetServerInfoState) {
          if (state.statusCode == EventStatus.success) {
            Navigator.of(context).pop();
            widget.navigator.push(
              UniversalPageRoute(builder: (context) {
                return _TipherethServerLoginPage(server: server);
              }),
            );
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
      child: UniversalDialog(
        title: const Text('添加服务器'),
        content: _buildForm(context),
        actions: [
          UniversalDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).cancel),
          ),
          UniversalDialogAction(
            isPrimary: true,
            onPressed: processing
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        server = ServerConfig(
                            host: host, port: port, enableTLS: tls);
                        processing = true;
                      });
                      context
                          .read<MainBloc>()
                          .add(MainGetServerInfoEvent(null, server: server));
                    }
                  },
            child: Text(S.of(context).connect),
          ),
        ],
      ),
    );
  }
}
