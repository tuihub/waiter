part of 'tiphereth_frame_page.dart';

class MyAccountsCard extends StatelessWidget {
  const MyAccountsCard({super.key});

  static const int accountPlatformCount = 1;

  void refresh(BuildContext context) {
    context.read<TipherethBloc>().add(TipherethGetAccountsEvent());
  }

  @override
  Widget build(BuildContext context) {
    bool firstBuild = true;
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (firstBuild) {
          firstBuild = false;
          if (state.accounts == null) {
            refresh(context);
          }
        }
        final supportedAccountPlatforms = context
                .read<MainBloc>()
                .state
                .serverFeatureSummary
                ?.supportedAccountPlatforms ??
            [];
        final unsupportedWellKnownAccountPlatforms = wellKnownAccountPlatforms
            .where((element) => !supportedAccountPlatforms.contains(element));
        final accountPlatforms = supportedAccountPlatforms
            .followedBy(unsupportedWellKnownAccountPlatforms);
        final accounts = state.accounts ?? [];
        final accountMap =
            Map.fromEntries(accounts.map((e) => MapEntry(e.platform, e)));

        return DefaultTabController(
          length: accountPlatforms.length,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonsTabBar(
                    contentPadding: const EdgeInsets.all(8),
                    tabs: [
                      for (final platform in accountPlatforms)
                        Tab(
                          icon: _wellKnownAccountPlatformIcon(platform),
                          text: accountPlatformString(platform),
                        ),
                    ],
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      refresh(context);
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
              SizedBox(
                height: 256,
                child: TabBarView(
                  children: [
                    for (final platform in accountPlatforms)
                      _AccountCard(
                        platform: platform,
                        serverSupported:
                            supportedAccountPlatforms.contains(platform),
                        account: accountMap[platform],
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard({
    required this.account,
    required this.platform,
    required this.serverSupported,
  });

  final String platform;
  final bool serverSupported;
  final Account? account;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (account != null) {
      content = Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: SpacingHelper.defaultBorderRadius,
                ),
                child: ClipRRect(
                  borderRadius: SpacingHelper.defaultBorderRadius,
                  child: const BackdropBlur(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: SpacingHelper.defaultBorderRadius,
                      image: DecorationImage(
                          image: ExtendedNetworkImageProvider(
                            account!.avatarUrl,
                          ),
                          fit: BoxFit.cover),
                    ),
                    width: 96,
                    height: 96,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account!.id.id.toHexString(),
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            color: Theme.of(context).disabledColor),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        account!.name,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          unawaited(showDialog<void>(
                            context: context,
                            builder: (context) => UnLinkAccountDialog(
                              account: account!,
                            ),
                          ));
                        },
                        child: Text('详情'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (serverSupported) {
      content = Center(
        child: LinkAccountForm(
          platform: platform,
          callback: () {
            context.read<TipherethBloc>().add(TipherethGetAccountsEvent());
          },
        ),
      );
    } else {
      content = Center(
        child: Card(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.75),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text('服务器不支持此平台'),
          ),
        ),
      );
    }

    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: _wellKnownAccountPlatformBackground(platform),
        ),
        child: content,
      ),
    );
  }
}

class LinkAccountForm extends StatefulWidget {
  const LinkAccountForm(
      {super.key, required this.platform, required this.callback});

  final String platform;
  final void Function() callback;

  @override
  State<LinkAccountForm> createState() => _LinkAccountFormState();
}

class _LinkAccountFormState extends State<LinkAccountForm> {
  final formKey = GlobalKey<FormState>();
  String platformAccountID = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethLinkAccountState && state.success) {
          widget.callback();
        }
      },
      builder: (context, state) {
        return BootstrapContainer(
          children: [
            BootstrapColumn(
              xxs: 12,
              sm: 10,
              md: 8,
              lg: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          onSaved: (newValue) => platformAccountID = newValue!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '请输入ID';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height:
                              state is TipherethLinkAccountState && state.failed
                                  ? 48
                                  : 0,
                          child:
                              state is TipherethLinkAccountState && state.failed
                                  ? Card(
                                      child: Center(
                                        child: Text(
                                          state.msg ?? '未知错误',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<TipherethBloc>().add(
                            TipherethLinkAccountEvent(
                                widget.platform, platformAccountID));
                      }
                    },
                    child:
                        state is TipherethLinkAccountState && state.processing
                            ? const CircularProgressIndicator()
                            : const Text('绑定账户'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

DecorationImage? _wellKnownAccountPlatformBackground(String platform) {
  String? url;
  switch (platform) {
    case 'steam':
      url =
          'https://pbs.twimg.com/profile_banners/36803580/1694625433/1500x500';
  }
  if (url != null) {
    return DecorationImage(
      image: ExtendedNetworkImageProvider(url),
      fit: BoxFit.cover,
    );
  }
  return null;
}

Widget? _wellKnownAccountPlatformIcon(String platform) {
  switch (platform) {
    case 'steam':
      return const Icon(FontAwesomeIcons.steam);
  }
  return null;
}
