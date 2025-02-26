part of 'server_select_page.dart';

class _TipherethServerLoginPage extends StatefulWidget {
  const _TipherethServerLoginPage({required this.server});

  final ServerConfig server;

  @override
  State<_TipherethServerLoginPage> createState() =>
      _TipherethServerLoginPageState();
}

class _TipherethServerLoginPageState extends State<_TipherethServerLoginPage> {
  bool flipCardIsFront = true;
  bool flipping = false;
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
          icon: Icon(UniversalIcon(context).arrowBack),
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
                    state.knownServerInstanceSummaries[widget.server.serverID];
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
                        child: UniversalFilledButton.icon(
                          onPressed: toggleCard,
                          icon: Icon(UniversalIcon(context).swap),
                          label: Text(
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
                      onFlip: () {
                        setState(() {
                          flipping = true;
                        });
                      },
                      onFlipDone: (isFront) {
                        setState(() {
                          flipping = false;
                        });
                      },
                      front: UniversalCard(
                          child: flipCardIsFront || flipping
                              ? _LoginForm(
                                  readOnly: false,
                                  server: widget.server,
                                )
                              : const SizedBox(height: 100)),
                      back: UniversalCard(
                        child: !flipCardIsFront || flipping
                            ? _RegisterForm(
                                readOnly: false,
                                onRegistered: toggleCard,
                                server: widget.server,
                              )
                            : const SizedBox(height: 100),
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

class _LoginForm extends StatefulWidget {
  const _LoginForm({required this.server, required this.readOnly});

  final bool readOnly;
  final ServerConfig server;

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
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
          null,
          password: password,
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
            UniversalToast.show(context,
                message: S.of(context).loginFailed(state.msg ?? ''));
          }
          if (state.success) {
            Navigator.of(context).pop();
          }
        }
      },
      builder: (context, state) {
        final instanceSummary =
            state.knownServerInstanceSummaries[widget.server.serverID];
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
                UniversalFilledButton(
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({
    this.onRegistered,
    required this.server,
    required this.readOnly,
  });

  final bool readOnly;
  final void Function()? onRegistered;
  final ServerConfig server;

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
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
      UniversalToast.show(context, message: S.of(context).passwordInconsistent);
      return;
    }

    if (_captchaID == null || newCaptcha) {
      context.read<MainBloc>().add(MainRegisterEvent(
            null,
            widget.server.copyWith(username: username),
            password,
          ));
    } else {
      context.read<MainBloc>().add(MainRegisterEvent(
            null,
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
          UniversalToast.show(context,
              message: S.of(context).loginFailed(state.msg ?? ''));
          if (state.captchaID != null && state.captchaImage != null) {
            setState(() {
              _captchaID = state.captchaID;
              _captchaImage = state.captchaImage;
            });
          }
        }
        if (state is MainRegisterState && state.success) {
          UniversalToast.show(context, message: S.of(context).registerSuccess);
          setState(() {
            _captchaID = null;
            _captchaImage = null;
          });
          widget.onRegistered?.call();
        }
      },
      builder: (context, state) {
        final instanceSummary =
            state.knownServerInstanceSummaries[widget.server.serverID];
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
                UniversalFilledButton(
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
