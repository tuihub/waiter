import 'dart:async';

import 'package:extended_image/extended_image.dart';
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
import '../specialized/backdrop_blur.dart';
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
    _current = context.read<MainBloc>().state.currentServer;
  }

  double _height = 0;
  ServerConfig? _current;
  ServerConfig? _selected;
  double translate = 1;
  bool _minimized = false;
  bool _fullscreen = false;
  static const minimizedHeight = 64.0;

  void fullscreen() {
    _minimized = false;
    _fullscreen = true;
    _animateTo(0, onComplete: () {
      setState(() {
        _selected = _current;
      });
    });
  }

  void minimize() {
    _minimized = true;
    _fullscreen = false;
    _animateTo(minimizedHeight - _height);
  }

  void hide() {
    _minimized = false;
    _fullscreen = false;
    _animateTo(-_height);
  }

  void _animateTo(double goal, {void Function()? onComplete}) {
    final animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
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

    unawaited(animationController.forward().then((value) {
      animationController.dispose();
      onComplete?.call();
    }));
  }

  @override
  void didUpdateWidget(covariant ServerSelectOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    _current = context.read<MainBloc>().state.currentServer;
    if (_minimized) {
      minimize();
    } else if (_fullscreen) {
      fullscreen();
    } else {
      hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if (state is MainAutoLoginState && state.success) {
              _current = context.read<MainBloc>().state.currentServer;
              AppRoutes.tiphereth.go(context);
              minimize();
            }
            if (state is MainAutoLoginState && state.failed) {
              if (state.msg != null) {
                Toast(
                  title: '',
                  message: S.of(context).loginFailed(state.msg ?? ''),
                ).show(context);
              }
              context.read<MainBloc>().add(
                    MainSetNextServerConfigEvent(_selected!),
                  );
            }
            if (state is MainManualLoginState && state.success) {
              AppRoutes.tiphereth.go(context);
              minimize();
            }
            if (state is MainNewServerSetState) {
              setState(() {
                _current = null;
              });
              fullscreen();
            }
          },
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
              if (_height != constraints.biggest.height) {
                _height = constraints.biggest.height;
                if (translate < 0) {
                  translate = -_height;
                }
              }
              if (translate > 0) {
                translate = -_height;
              }
              return Transform.translate(
                offset: Offset(0, translate),
                child: Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExtendedNetworkImageProvider(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints.expand(width: 64),
                        child: const ClipRect(
                          child: BackdropBlur(
                            begin: Alignment.center,
                            end: Alignment.center,
                          ),
                        ),
                      ),
                      if (_minimized)
                        Container(
                          margin: EdgeInsets.only(top: _height - 64),
                          alignment: Alignment.bottomCenter,
                          constraints: const BoxConstraints.expand(height: 64),
                          child: const ClipRect(
                            child: BackdropBlur(
                              begin: Alignment.center,
                              end: Alignment.center,
                            ),
                          ),
                        )
                      else
                        const SizedBox(),
                      if (_minimized)
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 64,
                            alignment: Alignment.center,
                            child: Text(
                              _current?.host ?? '',
                              style:
                                  backdropBlurTextStyle(context, fontSize: 24),
                            ),
                          ),
                        )
                      else
                        const SizedBox(),
                      NavRail(
                        leading: [
                          if (_current != null)
                            AvatarMenuItem(
                              name: _current!.host,
                              image: '',
                              selected: _current?.id == _selected?.id,
                              onPressed: () {
                                setState(() {
                                  _selected = _current;
                                });
                              },
                            ),
                        ],
                        body: [
                          for (final ServerConfig server
                              in state.knownServers ?? [])
                            if (server.id != _current?.id)
                              AvatarMenuItem(
                                name: server.host,
                                image: '',
                                selected: server.id == _selected?.id,
                                onPressed: () {
                                  setState(() {
                                    _selected = server;
                                  });
                                },
                              ),
                        ],
                        trailing: [
                          if (_minimized)
                            AvatarMenuItem(
                              name: _current!.host,
                              image: '',
                              selected: _current?.id == _selected?.id,
                              onPressed: () {
                                ServerSelectOverlay.of(context)?.fullscreen();
                              },
                            )
                          else
                            IconMenuItem(
                              icon: Icons.add,
                              selected: _selected == null,
                              onPressed: () {
                                setState(() {
                                  _selected = null;
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
                              xxs: 11,
                              md: 8,
                              lg: 6,
                              child: _selected != null
                                  ? ServerDetail(config: _selected!)
                                  : const NewServer(),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  floatingActionButton: _selected != null && !_minimized
                      ? FloatingActionButton.extended(
                          onPressed: (state is MainAutoLoginState &&
                                  state.processing)
                              ? null
                              : () {
                                  if (_selected!.id ==
                                      state.currentServer?.id) {
                                    ServerSelectOverlay.of(context)?.minimize();
                                  } else {
                                    context.read<MainBloc>().add(
                                          MainAutoLoginEvent(config: _selected),
                                        );
                                  }
                                },
                          icon: const Icon(Icons.login),
                          label: Text(_selected!.id == state.currentServer?.id
                              ? S.of(context).continueInCurrentServer
                              : S.of(context).buttonLogin),
                        )
                      : null,
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
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(config.host),
            ],
          ),
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
      padding: const EdgeInsets.all(16),
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
          padding: const EdgeInsets.all(16.0),
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
