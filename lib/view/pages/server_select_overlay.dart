import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../bloc/main_bloc.dart';
import '../../l10n/l10n.dart';
import '../../model/common_model.dart';
import '../../route.dart';
import '../components/toast.dart';
import '../helper/connection.dart';
import '../layout/bootstrap_container.dart';
import '../specialized/backdrop_blur.dart';
import '../specialized/connectivity.dart';
import '../specialized/nav_rail.dart';
import '../universal/universal.dart';
import 'settings/client/client_setting_page.dart';

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

  double _height = double.maxFinite;
  ServerConfig? _current;
  ServerConfig? _selected;
  bool _preloginSettings = false;
  double translate = 1;
  bool _minimized = false;
  bool _fullscreen = false;
  static const minimizedHeight = 64.0;

  void fullscreen() {
    _minimized = false;
    _fullscreen = true;
    _animateTo(0);
  }

  void minimize() {
    _minimized = true;
    _fullscreen = false;
    _animateTo(minimizedHeight - _height);
    hide();
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
              _selected = _current;
              const TipherethRootRoute().go(context);
              minimize();
            }
            if (state is MainAutoLoginState && state.failed) {
              if (state.msg != null) {
                Toast(
                  title: '',
                  message: S.of(context).loginFailed(state.msg ?? ''),
                ).show(context);
              }
              if (_selected != null) {
                context.read<MainBloc>().add(
                      MainSetNextServerConfigEvent(_selected!),
                    );
              }
            }
            if (state is MainManualLoginState && state.success) {
              const TipherethRootRoute().go(context);
              minimize();
            }
            if (state is MainEnterLocalModeState && state.success) {
              const TipherethRootRoute().go(context);
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
            final instanceSummary = (state.knownServerInstanceSummary ??
                {})[_selected?.id ?? state.nextServer?.id];
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
                        image: ExtendedNetworkImageProvider(
                            instanceSummary?.backgroundUrl ?? ''),
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
                            if (ConnectionHelper.isLocal(context))
                              IconMenuItem(
                                icon: Icons.signal_wifi_connected_no_internet_4,
                                selected: false,
                                onPressed: () {
                                  setState(() {
                                    _preloginSettings = false;
                                    _selected = _current;
                                  });
                                },
                              )
                            else
                              AvatarMenuItem(
                                name: _current!.host,
                                image: state
                                        .knownServerInstanceSummary?[
                                            _current?.id ?? '']
                                        ?.logoUrl ??
                                    '',
                                selected: _current?.id == _selected?.id,
                                onPressed: () {
                                  setState(() {
                                    _preloginSettings = false;
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
                                image: state
                                        .knownServerInstanceSummary?[server.id]
                                        ?.logoUrl ??
                                    '',
                                selected: server.id == _selected?.id,
                                onPressed: () {
                                  setState(() {
                                    _preloginSettings = false;
                                    _selected = server;
                                  });
                                },
                              ),
                        ],
                        trailing: [
                          if (_minimized)
                            if (ConnectionHelper.isLocal(context))
                              IconMenuItem(
                                icon: Icons.signal_wifi_connected_no_internet_4,
                                selected: false,
                                onPressed: () {
                                  ServerSelectOverlay.of(context)?.fullscreen();
                                },
                              )
                            else
                              AvatarMenuItem(
                                name: _current?.host ?? '',
                                image: state
                                        .knownServerInstanceSummary?[
                                            _current?.id ?? '']
                                        ?.logoUrl ??
                                    '',
                                selected: false,
                                onPressed: () {
                                  ServerSelectOverlay.of(context)?.fullscreen();
                                },
                              )
                          else
                            IconMenuItem(
                              icon: Icons.add,
                              selected: !_preloginSettings && _selected == null,
                              onPressed: () {
                                setState(() {
                                  _preloginSettings = false;
                                  _selected = null;
                                });
                              },
                            ),
                          if (ConnectionHelper.isNotLocal(context))
                            IconMenuItem(
                              icon: Icons.signal_wifi_connected_no_internet_4,
                              selected: false,
                              onPressed: () {
                                unawaited(showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('进入本地模式'),
                                      content: const Text('是否进入本地模式？'),
                                      actions: [
                                        UniversalTextButton(
                                          onPressed: () {
                                            context
                                                .read<MainBloc>()
                                                .add(MainEnterLocalModeEvent());
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('是'),
                                        ),
                                        UniversalTextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('否'),
                                        ),
                                      ],
                                    );
                                  },
                                ));
                              },
                            ),
                          if (_current == null)
                            IconMenuItem(
                              icon: Icons.settings,
                              selected: _preloginSettings,
                              onPressed: () {
                                setState(() {
                                  _preloginSettings = true;
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
                              child: _preloginSettings
                                  ? const ClientSettingPage()
                                  : DynMouseScroll(
                                      builder: (context, controller, physics) {
                                      return SingleChildScrollView(
                                        controller: controller,
                                        physics: physics,
                                        child: _selected != null
                                            ? ServerDetail(config: _selected!)
                                            : const NewServer(),
                                      );
                                    }),
                            ),
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
                              : S.of(context).login),
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
      final instanceSummary =
          (state.knownServerInstanceSummary ?? {})[config.id];
      return Column(
        children: [
          if (instanceSummary != null && instanceSummary.logoUrl.isNotEmpty)
            Container(
              height: 128,
              width: 128,
              margin: const EdgeInsets.all(16),
              child: ExtendedImage.network(
                instanceSummary.logoUrl,
                fit: BoxFit.contain,
              ),
            ),
          UniversalCard(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    (instanceSummary?.name.isNotEmpty ?? false)
                        ? instanceSummary!.name
                        : config.id,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (instanceSummary?.description.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(instanceSummary!.description,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

class NewServer extends StatefulWidget {
  const NewServer({super.key});

  @override
  State<NewServer> createState() => _NewServerState();
}

class _NewServerState extends State<NewServer> {
  bool flipCardIsFront = true;
  final flipCardController = FlipCardController();

  Future<void> toggleCard() async {
    await flipCardController.toggleCard();
    if (flipCardController.state != null) {
      setState(() {
        flipCardIsFront = !flipCardController.state!.isFront;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.nextServer != null && state.nextServer!.host.isNotEmpty) {
          final instanceSummary =
              (state.knownServerInstanceSummary ?? {})[state.nextServer?.id];
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (instanceSummary != null && instanceSummary.logoUrl.isNotEmpty)
                Container(
                  height: 128,
                  width: 128,
                  margin: const EdgeInsets.all(16),
                  child: ExtendedImage.network(
                    instanceSummary.logoUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: UniversalElevatedButton(
                    onPressed: toggleCard,
                    child: Text(
                      flipCardIsFront
                          ? S.of(context).register
                          : S.of(context).login,
                    ),
                  ),
                ),
              ),
              FlipCard(
                controller: flipCardController,
                flipOnTouch: false,
                front:
                    UniversalCard(child: LoginForm(readOnly: !flipCardIsFront)),
                back: UniversalCard(
                  child: RegisterForm(
                    readOnly: flipCardIsFront,
                    onRegistered: toggleCard,
                  ),
                ),
              ),
              if (instanceSummary != null) const SizedBox(height: 128),
            ],
          );
        }
        return const UniversalCard(
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
            const SizedBox(
              height: 16,
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
            const SizedBox(
              height: 8,
            ),
            UniversalSwitchFormField(
              onSaved: (newValue) => tls = newValue!,
              title: Text(S.of(context).tls),
              initialValue: tls,
            ),
            const SizedBox(
              height: 8,
            ),
            UniversalElevatedButton(
              onPressed: submit,
              child: Text(S.of(context).check),
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
  const LoginForm({super.key, this.readOnly = false});

  final bool readOnly;

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
              label: S.of(context).retry,
              onPressed: login,
            ),
          ).show(context);
        }
      },
      builder: (context, state) {
        final instanceSummary =
            (state.knownServerInstanceSummary ?? {})[state.nextServer?.id];
        final instanceName = instanceSummary?.name ?? '';
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    instanceName.isNotEmpty
                        ? instanceName
                        : S.of(context).loggingInTo('${state.nextServer?.id}'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (instanceSummary?.description.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(instanceSummary!.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: UniversalTextButton(
                      onPressed: () {
                        context
                            .read<MainBloc>()
                            .add(MainClearNextServerConfigEvent());
                      },
                      child: Text('< ${S.of(context).backward}'),
                    ),
                  ),
                ),
                UniversalTextFormField(
                  labelText: S.of(context).username,
                  controller: _usernameController,
                  readOnly: widget.readOnly,
                ),
                const SizedBox(
                  height: 16,
                ),
                UniversalTextFormField(
                  obscureText: hidePassword,
                  labelText: S.of(context).password,
                  suffixIcon: UniversalIconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: hidePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  controller: _passwordController,
                  obscuringCharacter: '*',
                  readOnly: widget.readOnly,
                ),
                const SizedBox(
                  height: 16,
                ),
                UniversalElevatedButton(
                  onPressed: login,
                  child: state is MainManualLoginState && state.processing
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          S.of(context).loggingInTo('${state.nextServer?.id}'),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, this.readOnly = false, this.onRegistered});

  final bool readOnly;
  final void Function()? onRegistered;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;
  Uint8List? _captchaImage;
  String? _captchaID;
  late TextEditingController _captchaAnsController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    _captchaAnsController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _captchaAnsController.dispose();
    super.dispose();
  }

  void register({bool newCaptcha = false}) {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final repeatPassword = _repeatPasswordController.text.trim();
    final captchaAns = _captchaAnsController.text.trim();

    if (password != repeatPassword) {
      Toast(
        title: '',
        message: S.of(context).passwordInconsistent,
      ).show(context);
      return;
    }

    if (_captchaID == null || newCaptcha) {
      context.read<MainBloc>().add(
            MainRegisterEvent(username, password),
          );
    } else {
      context.read<MainBloc>().add(
            MainRegisterEvent(username, password,
                captchaID: _captchaID, captchaAns: captchaAns),
          );
    }
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainRegisterState && state.failed) {
          Toast(
            title: '',
            message: S.of(context).loginFailed(state.msg ?? ''),
          ).show(context);
          if (state.captchaID != null && state.captchaImage != null) {
            setState(() {
              _captchaID = state.captchaID;
              _captchaImage = state.captchaImage;
            });
          }
        }
        if (state is MainRegisterState && state.success) {
          Toast(
            title: '',
            message: S.of(context).registerSuccess,
          ).show(context);
          setState(() {
            _captchaID = null;
            _captchaImage = null;
          });
          widget.onRegistered?.call();
        }
      },
      builder: (context, state) {
        final instanceSummary =
            (state.knownServerInstanceSummary ?? {})[state.nextServer?.id];
        final instanceName = instanceSummary?.name ?? '';
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    instanceName.isNotEmpty
                        ? instanceName
                        : S.of(context).registerInTo('${state.nextServer?.id}'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                UniversalTextFormField(
                  labelText: S.of(context).username,
                  controller: _usernameController,
                  readOnly: widget.readOnly,
                ),
                const SizedBox(
                  height: 16,
                ),
                UniversalTextFormField(
                  obscureText: hidePassword,
                  labelText: S.of(context).password,
                  suffixIcon: UniversalIconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: hidePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  controller: _passwordController,
                  obscuringCharacter: '*',
                  readOnly: widget.readOnly,
                ),
                const SizedBox(
                  height: 16,
                ),
                UniversalTextFormField(
                  obscureText: hidePassword,
                  labelText: S.of(context).repeatPassword,
                  suffixIcon: UniversalIconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: hidePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  controller: _repeatPasswordController,
                  obscuringCharacter: '*',
                  readOnly: widget.readOnly,
                ),
                const SizedBox(
                  height: 16,
                ),
                if (_captchaImage != null) ExtendedImage.memory(_captchaImage!),
                if (_captchaImage != null)
                  UniversalTextButton(
                    onPressed: () => register(newCaptcha: true),
                    child: Text(S.of(context).refreshCaptcha),
                  ),
                if (_captchaID != null)
                  UniversalTextFormField(
                    labelText: S.of(context).captcha,
                    controller: _captchaAnsController,
                    readOnly: widget.readOnly,
                  ),
                if (_captchaID != null)
                  const SizedBox(
                    height: 16,
                  ),
                UniversalElevatedButton(
                  onPressed: register,
                  child: state is MainManualLoginState && state.processing
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          S.of(context).registerInTo('${state.nextServer?.id}'),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
