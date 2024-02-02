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
import '../specialized/nav_rail.dart';

class ServerSelectOverlay extends StatefulWidget {
  const ServerSelectOverlay({super.key, required this.child});

  final Widget child;

  static ServerSelectOverlayState? of(BuildContext context) {
    return context.findAncestorStateOfType<ServerSelectOverlayState>();
  }

  @override
  State<ServerSelectOverlay> createState() => ServerSelectOverlayState();
}

class ServerSelectOverlayState extends State<ServerSelectOverlay>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    current = context.read<MainBloc>().state.currentServer;
  }

  double height = 0;
  ServerConfig? current;
  ServerConfig? selected;
  double translate = 1;

  void fullscreen() {
    selected = current;
    _animateTo(0);
  }

  void minimize() {
    _animateTo(-height);
  }

  void hide() {
    _animateTo(-height);
  }

  void _animateTo(double goal) {
    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.dispose();
      }
    });

    final animation = Tween<double>(begin: translate, end: goal).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation.addListener(() {
      setState(() {
        translate = animation.value;
      });
    });

    animationController.forward();
  }

  @override
  void didUpdateWidget(covariant ServerSelectOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    current = context.read<MainBloc>().state.currentServer;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if (state is MainAutoLoginState && state.success) {
              AppRoutes.tiphereth.go(context);
              minimize();
            }
            if (state is MainAutoLoginState && state.failed) {
              fullscreen();
            }
            if (state is MainManualLoginState && state.success) {
              AppRoutes.tiphereth.go(context);
              minimize();
            }
            if (state is MainNewServerSetState) {
              setState(() {
                current = null;
              });
              fullscreen();
            }
          },
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
              if (height != constraints.biggest.height) {
                height = constraints.biggest.height;
                if (translate < 0) {
                  translate = -height;
                }
              }
              if (translate > 0) {
                translate = -height;
              }
              return Transform.translate(
                offset: Offset(0, translate),
                child: Scaffold(
                  body: Stack(children: [
                    NavRail(
                      leading: [
                        if (current != null)
                          AvatarMenuItem(
                            name: current!.host,
                            image: '',
                            selected: current?.id == selected?.id,
                            onPressed: () {
                              setState(() {
                                selected = current;
                              });
                            },
                          ),
                      ],
                      body: [
                        for (final ServerConfig server
                            in state.knownServers ?? [])
                          if (server.id != current?.id)
                            IconMenuItem(
                              icon: Icons.account_circle,
                              selected: server.id == selected?.id,
                              onPressed: () {
                                setState(() {
                                  selected = server;
                                });
                              },
                            ),
                      ],
                      trailing: [
                        IconMenuItem(
                          icon: Icons.add,
                          selected: selected == null,
                          onPressed: () {
                            setState(() {
                              selected = null;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 64),
                      child: BootstrapContainer(
                        children: [
                          BootstrapColumn(
                            xxs: 12,
                            md: 8,
                            lg: 6,
                            child: selected != null
                                ? ServerDetail(config: selected!)
                                : const NewServer(),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              );
            });
          },
        ),
      ],
    );
  }
}

class ServerDetail extends StatelessWidget {
  const ServerDetail({super.key, required this.config});

  final ServerConfig config;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(config.host),
            ElevatedButton.icon(
                onPressed: () {
                  if (config.id == state.currentServer?.id) {
                    ServerSelectOverlay.of(context)?.hide();
                  } else {
                    context.read<MainBloc>().add(
                          MainSetNextServerConfigEvent(config),
                        );
                  }
                },
                icon: const Icon(Icons.login),
                label: Text(S.of(context).buttonLogin)),
          ],
        ),
      );
    });
  }
}

class NewServer extends StatelessWidget {
  const NewServer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.nextServer != null && state.nextServer!.host.isNotEmpty) {
          return const Card(
            child: LoginForm(),
          );
        }
        return const Card(
          child: ServerSelectForm(),
        );
      },
    );
  }
}

class ServerSelectForm extends StatefulWidget {
  const ServerSelectForm({super.key});

  @override
  State<ServerSelectForm> createState() => _ServerSelectFormState();
}

class _ServerSelectFormState extends State<ServerSelectForm> {
  final _formKey = GlobalKey<FormState>();

  String host = '';
  int port = 0;
  bool tls = false;
  ServerConfig server = const ServerConfig('', 0, true);

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        server = ServerConfig(host, port, tls);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
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
                      MainSetNextServerConfigEvent(server),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  S.of(context).loggingInTo(
                      '${state.nextServer?.host}:${state.nextServer?.port}'),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<MainBloc>()
                          .add(MainClearNextServerConfigEvent());
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
