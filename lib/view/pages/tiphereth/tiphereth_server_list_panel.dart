import 'package:dao/dao.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/main_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../components/toast.dart';
import '../../layout/bootstrap_container.dart';
import '../../layout/card_list_page.dart';
import '../../specialized/connectivity.dart';

class TipherethServerListPanel extends StatelessWidget {
  const TipherethServerListPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return ListManagePage(
          title: '服务器列表',
          processing: false,
          onAdd: () async {
            final navigator = Navigator.of(context);
            await showDialog(
              context: context,
              builder: (context) {
                return _TipherethServerAddDialog(navigator);
              },
            );
          },
          children: [
            for (final server in state.knownServers.values)
              ListTile(
                title: Text('${server.host}:${server.port}'),
                subtitle: Text(server.username),
                trailing: server.uniqueKey == state.currentServer
                    ? const Icon(Icons.check)
                    : null,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return _TipherethServerEditDialog(server: server);
                    },
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

class _TipherethServerEditDialog extends StatelessWidget {
  const _TipherethServerEditDialog({required this.server});

  final ServerConfig server;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('服务器信息'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${server.host}:${server.port}'),
          Text(server.username),
        ],
      ),
    );
  }
}

class _TipherethServerAddDialog extends StatefulWidget {
  const _TipherethServerAddDialog(this.navigator);

  final NavigatorState navigator;

  @override
  State<_TipherethServerAddDialog> createState() =>
      _TipherethServerAddDialogState();
}

class _TipherethServerAddDialogState extends State<_TipherethServerAddDialog> {
  final _formKey = GlobalKey<FormState>();

  String host = '';
  int port = 0;
  bool tls = false;
  ServerConfig server = const ServerConfig(host: '', port: 0, enableTLS: true);

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
          ServerConnectivityWidget(config: server, callback: () {}),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加服务器'),
      content: _buildForm(context),
      actions: [
        UniversalOutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).cancel),
        ),
        UniversalOutlinedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              setState(() {
                server = ServerConfig(host: host, port: port, enableTLS: tls);
              });
            }
          },
          child: Text(S.of(context).check),
        ),
        UniversalElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              setState(() {
                server = ServerConfig(host: host, port: port, enableTLS: tls);
              });
              Navigator.of(context).pop();
              await widget.navigator.push(
                UniversalPageRoute(builder: (context) {
                  return _TipherethServerLoginPage(server: server);
                }),
              );
            }
          },
          child: Text(S.of(context).submit),
        ),
      ],
    );
  }
}

class _TipherethServerLoginPage extends StatefulWidget {
  const _TipherethServerLoginPage({super.key, required this.server});

  final ServerConfig server;

  @override
  State<_TipherethServerLoginPage> createState() =>
      _TipherethServerLoginPageState();
}

class _TipherethServerLoginPageState extends State<_TipherethServerLoginPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.server.host}:${widget.server.port}'),
        shape: UniversalUI.of(context).defaultShape,
        backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(UniversalUI.of(context).icons.arrowBack),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BootstrapContainer(
        children: [
          BootstrapColumn(
            xxs: 12,
            md: 6,
            xl: 4,
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                final instanceSummary =
                    state.knownServerInstanceSummaries[widget.server.uniqueKey];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: SpacingHelper.listSpacing(height: 8, children: [
                    if (instanceSummary != null &&
                        instanceSummary.logoUrl.isNotEmpty)
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
                      front: UniversalCard(
                          child: LoginForm(
                        readOnly: !flipCardIsFront,
                        server: widget.server,
                      )),
                      back: UniversalCard(
                        child: RegisterForm(
                          readOnly: flipCardIsFront,
                          onRegistered: toggleCard,
                          server: widget.server,
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.readOnly = false, required this.server});

  final bool readOnly;
  final ServerConfig server;

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

    context.read<MainBloc>().add(MainLoginEvent(
          password,
          serverConfig: widget.server.copyWith(username: username),
        ));
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainLoginState) {
          if (state.failed) {
            Toast(
              title: '',
              message: S.of(context).loginFailed(state.msg ?? ''),
              action: SnackBarAction(
                label: S.of(context).retry,
                onPressed: login,
              ),
            ).show(context);
          }
          if (state.success) {
            Navigator.of(context).pop();
          }
        }
      },
      builder: (context, state) {
        final instanceSummary =
            state.knownServerInstanceSummaries[widget.server.uniqueKey];
        final instanceName = instanceSummary?.name ?? '';
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: SpacingHelper.listSpacing(height: 16, children: [
                Center(
                  child: Text(
                    instanceName.isNotEmpty
                        ? instanceName
                        : S.of(context).loggingInTo(widget.server.host),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (instanceSummary?.description.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(instanceSummary!.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                UniversalTextFormField(
                  labelText: S.of(context).username,
                  controller: _usernameController,
                  readOnly: widget.readOnly,
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
                UniversalElevatedButton(
                  onPressed: login,
                  child: state is MainLoginState && state.processing
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          S.of(context).loggingInTo(widget.server.host),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    this.readOnly = false,
    this.onRegistered,
    required this.server,
  });

  final bool readOnly;
  final void Function()? onRegistered;
  final ServerConfig server;

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
      context.read<MainBloc>().add(MainRegisterEvent(
            widget.server.copyWith(username: username),
            password,
          ));
    } else {
      context.read<MainBloc>().add(MainRegisterEvent(
            widget.server.copyWith(username: username),
            password,
            captchaID: _captchaID,
            captchaAns: captchaAns,
          ));
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
            state.knownServerInstanceSummaries[widget.server.uniqueKey];
        final instanceName = instanceSummary?.name ?? '';
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: SpacingHelper.listSpacing(height: 16, children: [
                Center(
                  child: Text(
                    instanceName.isNotEmpty
                        ? instanceName
                        : S.of(context).registerInTo(widget.server.host),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                UniversalTextFormField(
                  labelText: S.of(context).username,
                  controller: _usernameController,
                  readOnly: widget.readOnly,
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
                UniversalElevatedButton(
                  onPressed: register,
                  child: state is MainLoginState && state.processing
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          S.of(context).registerInTo(widget.server.host),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
