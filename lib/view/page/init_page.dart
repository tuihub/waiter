import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/bloc/user_login/user_bloc.dart';
import 'package:waitress/common/client/client.dart';
import 'package:waitress/common/const/color.dart';
import 'package:waitress/common/const/string.dart';
import 'package:waitress/view/page/frame_page.dart';
import 'package:waitress/view/widget/connectivity.dart';
import 'package:waitress/view/widget/title_bar.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: BlocConsumer<UserBloc, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "欢迎回来 ${state.acessToken}",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AppSettingInitial) {
            context.read<UserBloc>().add(CheckLocalSettingEvent());
          }
          if (state is UserLoginDone) {
            return BlocProvider(
              create: (context) => ApiRequestBloc(
                accessToken: state.acessToken,
                client: clientFactory(host: state.serverUrl),
              ),
              child: FramePage(),
            );
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
                        height: 320,
                        child: getInitWidget(state),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            floatingActionButton: state is ServerConnectDone
                ? FloatingActionButton.extended(
                    onPressed: () {
                      context.read<UserBloc>().add(UserLogoutEvent());
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("返回"),
                  )
                : Container(),
          );
        },
      ),
    );
  }

  Widget getInitWidget(UserLoginState state) {
    if (state is SettingLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tui",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 145, 0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Hub",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ],
      );
    }
    if (state is ServerConnectDone) {
      return const LoginWidget();
    }
    return const ConnectWidget();
  }
}

class WelComeWidget extends StatelessWidget {
  const WelComeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          '#',
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: AppDefaultAccentColor,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 3000),
            animatedTexts: [
              TyperAnimatedText(
                'Tiphereth',
                speed: const Duration(
                  milliseconds: 200,
                ),
                curve: Curves.easeOut,
              ),
              TyperAnimatedText(
                'Gebura',
                speed: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              ),
              TyperAnimatedText(
                'Yesod',
                speed: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ConnectWidget extends StatefulWidget {
  const ConnectWidget({super.key});

  @override
  State<ConnectWidget> createState() => _ConnectWidgetState();
}

class _ConnectWidgetState extends State<ConnectWidget> {
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

  bool submitUrl() {
    RegExp exp = RegExp(
      r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
    );
    final match = exp.hasMatch(_controller.text);
    if (!match) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).cardColor,
          content: Text(
            "链接格式错误, 请修改后重试",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      context.read<UserBloc>().add(
            ConnectToServerEvent(_controller.text),
          );
    }
    return match;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserLoginState>(
      listener: (context, state) {
        if (state is ServerConnectFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "无法连接到服务器,${state.message}",
                style: const TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: "重试",
                onPressed: () {
                  submitUrl();
                },
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "选择服务器",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 16,
            ),
            for (String server in serverList)
              ServerConnectivityWidget(
                url: server,
                callback: () {
                  context.read<UserBloc>().add(
                        ConnectToServerEvent(server),
                      );
                },
              ),
          ],
        );
      },
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
        SnackBar(
          content: Text(
            "用户名或密码为空, 请修改后重试",
          ),
        ),
      );
    } else {
      context.read<UserBloc>().add(
            UserLoginEvent(username, password),
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
                "登录失败,${state.message}",
              ),
              action: SnackBarAction(
                label: "重试",
                onPressed: () {
                  submitUrl();
                },
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
                    "🎉欢迎!",
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
                obscuringCharacter: "*",
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  submitUrl();
                },
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
                        "登录",
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
