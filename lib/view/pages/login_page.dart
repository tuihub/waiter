import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/user_login/user_bloc.dart';
import '../../consts.dart';
import '../widgets/connectivity.dart';
import '../widgets/form_field.dart';
import '../widgets/title_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: BlocConsumer<UserBloc, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoggedIn) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  '欢迎',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AppInitialize) {
            context.read<UserBloc>().add(LoadLocalSettingEvent());
          }
          return Scaffold(
            body: Column(children: [
              const TitleBar(),
              Expanded(
                child: Scaffold(
                  body: Center(
                    child: Card(
                      child: SizedBox(
                        width: 540,
                        height: 450,
                        child: getInitWidget(state),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            floatingActionButton: state is ServerSelected
                ? FloatingActionButton.extended(
                    onPressed: () {
                      context.read<UserBloc>().add(ManualLoginEvent());
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('返回'),
                  )
                : Container(),
          );
        },
      ),
    );
  }

  Widget getInitWidget(UserLoginState state) {
    if (state is ServerSelected) {
      return const LoginWidget();
    }
    return const ServerSelectWidget();
  }
}

class ServerSelectWidget extends StatefulWidget {
  const ServerSelectWidget({super.key});

  @override
  State<ServerSelectWidget> createState() => _ServerSelectWidgetState();
}

class _ServerSelectWidgetState extends State<ServerSelectWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

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
    return BlocConsumer<UserBloc, UserLoginState>(
      listener: (context, state) {
        // if (state is ServerConnectFailed) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text(
        //         "无法连接到服务器,${state.message}",
        //         style: const TextStyle(color: Colors.white),
        //       ),
        //       action: SnackBarAction(
        //         label: "重试",
        //         onPressed: () {
        //           submitUrl();
        //         },
        //       ),
        //     ),
        //   );
        // }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('选择服务器')),
              bottom: const TabBar(tabs: [
                Tab(
                  text: '输入服务器',
                ),
                Tab(
                  text: '内置',
                ),
              ]),
            ),
            body: TabBarView(children: [
              ServerSelectForm(callback: () {}),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var server in newServerList)
                    ServerConnectivityWidget(
                      config: server,
                      callback: () {
                        context.read<UserBloc>().add(
                              ConnectToServerEvent(server),
                            );
                      },
                    ),
                ],
              ),
            ]),
          ),
        );
      },
    );
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
  ServerConfig server = const ServerConfig('', 0, true);

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        server = ServerConfig(host, port, tls, name: name);
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
          children: <Widget>[
            TextFormField(
              onSaved: (newValue) => host = newValue!,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '地址',
              ),
              // The validator receives the text that the user has entered.
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
              height: 16,
            ),
            SwitchFormField(
              onSaved: (newValue) => tls = newValue!,
              title: const Text('TLS'),
              initialValue: tls,
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: submit,
              child: const Text('检查'),
            ),
            ServerConnectivityWidget(
              config: server,
              callback: () {
                context.read<UserBloc>().add(
                      ConnectToServerEvent(server),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '用户名或密码为空, 请修改后重试',
          ),
        ),
      );
    } else {
      context.read<UserBloc>().add(
            UserLoginEvent(username, password),
          );
      GoRouter.of(context).go(
        '/app/Home',
      );
    }
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserLoginState>(
      listener: (context, state) {
        if (state is UserLoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '登录失败,${state.message}',
              ),
              action: SnackBarAction(
                label: '重试',
                onPressed: submitUrl,
              ),
            ),
          );
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
                  suffix: IconButton(
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
                child: state is UserLoginLoading
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
