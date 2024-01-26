import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../l10n/l10n.dart';
import '../../model/common_model.dart';
import '../../route.dart';
import '../components/toast.dart';
import '../form/form_field.dart';
import '../layout/bootstrap_container.dart';
import '../specialized/connectivity.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state.currentUser != null) {
            AppRoutes.tiphereth.go(context);
            Toast(title: '', message: S.of(context).welcome).show(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BootstrapContainer(children: [
              BootstrapColumn(
                xxs: 12,
                md: 8,
                lg: 6,
                child: Card(
                  child: getInitWidget(state),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget getInitWidget(MainState state) {
    if (state.serverConfig != null) {
      return const SizedBox(height: 360, child: LoginWidget());
    }
    return const SizedBox(height: 450, child: ServerSelectWidget());
  }
}

class ServerSelectWidget extends StatefulWidget {
  const ServerSelectWidget({super.key});

  @override
  State<ServerSelectWidget> createState() => _ServerSelectWidgetState();
}

class _ServerSelectWidgetState extends State<ServerSelectWidget>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 96,
          title: Center(child: Text(S.of(context).serverSetup)),
          backgroundColor: Colors.transparent,
        ),
        body: ServerSelectForm(callback: () {}));
  }
}

class ServerSelectForm extends StatefulWidget {
  final void Function() callback;

  const ServerSelectForm({super.key, required this.callback});
  @override
  State<ServerSelectForm> createState() => _ServerSelectFormState();
}

class _ServerSelectFormState extends State<ServerSelectForm> {
  final _formKey = GlobalKey<FormState>();

  String host = '';
  int port = 0;
  bool tls = false;
  final String name = '确定'; // TODO: what is this?
  ServerConfig server = const ServerConfig('', 0, true, '');

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        server = ServerConfig(host, port, tls, name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onSaved: (newValue) => host = newValue!,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: S.of(context).address,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).pleaseInputServerAddress;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onSaved: (newValue) => port = int.parse(newValue!),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: S.of(context).port,
              ),
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
            const SizedBox(
              height: 8,
            ),
            SwitchFormField(
              onSaved: (newValue) => tls = newValue!,
              title: Text(S.of(context).tls),
              initialValue: tls,
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(128, 32),
              ),
              onPressed: submit,
              child: Text(S.of(context).buttonCheck),
            ),
            ServerConnectivityWidget(
              config: server,
              callback: () {
                context.read<MainBloc>().add(
                      MainSetServerConfigEvent(server),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    context.read<MainBloc>().add(
          MainManualLoginEvent(username, password),
        );
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainManualLoginState && state.failed) {
          Toast(
            title: '',
            message: S.of(context).loginFailed(state.msg ?? ''),
            action: SnackBarAction(
              label: S.of(context).buttonRetry,
              onPressed: login,
            ),
          ).show(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    S.of(context).welcomeHeader,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(S.of(context).loggingInTo(
                  '${state.serverConfig?.host}:${state.serverConfig?.port}')),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextButton(
                    onPressed: () {
                      context.read<MainBloc>().add(MainLogoutEvent());
                    },
                    child: Text('< ${S.of(context).buttonBackward}'),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: S.of(context).username,
                ),
                controller: _usernameController,
                onSubmitted: (value) {
                  login();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: S.of(context).password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: hidePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                controller: _passwordController,
                onSubmitted: (value) {
                  login();
                },
                obscuringCharacter: '*',
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: login,
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(144, 36),
                  ),
                  elevation: MaterialStatePropertyAll(0),
                ),
                child: state is MainManualLoginState && state.processing
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        S.of(context).buttonLogin,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
