import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../consts.dart';
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
            const Toast(title: '', message: '欢迎').show(context);
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

  // bool submitUrl() {
  //   RegExp exp = RegExp(
  //     r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
  //   );
  //   final match = exp.hasMatch(_controller.text);
  //   if (!match) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Theme.of(context).cardColor,
  //         content: Text(
  //           "链接格式错误, 请修改后重试",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     );
  //   } else {
  //     context.read<UserBloc>().add(
  //       ConnectToServerEvent(ServerConfig(_controller.text, 443, true)),
  //     );
  //   }
  //   return match;
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 96,
          title: const Center(child: Text('连接服务器')),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.input),
              onPressed: () {
                unawaited(showDialog<void>(
                  context: context,
                  builder: (context) {
                    return BlocConsumer<MainBloc, MainState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return AlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('内置服务器配置'),
                              for (final server in newServerList)
                                ServerConnectivityWidget(
                                  config: server,
                                  callback: () {
                                    context.read<MainBloc>().add(
                                          MainSetServerConfigEvent(server),
                                        );
                                    Navigator.of(context).pop();
                                  },
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ));
              },
            ),
          ],
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
  final String name = '确定';
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '地址',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入地址';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onSaved: (newValue) => port = int.parse(newValue!),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '端口',
              ),
              validator: (value) {
                final p = int.tryParse(value!) ?? 0;
                if (p <= 0) {
                  return '请输入端口';
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
              title: const Text('TLS'),
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
              child: const Text('检查'),
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

  void submitUrl() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      const Toast(title: '', message: '用户名或密码为空, 请修改后重试').show(context);
    } else {
      context.read<MainBloc>().add(
            MainManualLoginEvent(username, password),
          );
    }
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainManualLoginState && state.failed) {
          Toast(
            title: '',
            message: '登录失败,${state.msg}',
            action: SnackBarAction(
              label: '重试',
              onPressed: submitUrl,
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
                    '🎉欢迎!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextButton(
                    onPressed: () {
                      context.read<MainBloc>().add(MainLogoutEvent());
                    },
                    child: const Text('< 返回'),
                  ),
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: '用户名',
                ),
                controller: _usernameController,
                onSubmitted: (value) {
                  submitUrl();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: '密码',
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
                  submitUrl();
                },
                obscuringCharacter: '*',
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: submitUrl,
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
                    : const Text(
                        '登录',
                        style: TextStyle(
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
