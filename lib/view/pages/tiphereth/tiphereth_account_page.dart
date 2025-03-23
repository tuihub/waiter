import 'dart:async';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../consts.dart';
import '../../../l10n/librarian.dart';
import '../../helper/duration_format.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import '../settings/server_select/server_select_page.dart';

class TipherethAccountPage extends StatelessWidget {
  const TipherethAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Scaffold(
        body: Column(
          children: [
            const MyProfileCard(),
            if (state.isNotLocal)
              const MyAccountsCard()
            else
              Expanded(
                child: Center(
                  child: UniversalFilledButton(
                      child: const Text('添加服务器'),
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return ServerManualAddDialog(navigator);
                          },
                        );
                      }),
                ),
              ),
          ],
        ),
      );
    });
  }
}

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return UniversalCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.isNotLocal)
                    Text(
                      '${state.currentUser?.id.id.toHexString()}',
                      style: TextStyle(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  if (state.isNotLocal)
                    Text(state.currentUser?.username ?? '',
                        style: const TextStyle(
                          fontSize: 32,
                        ))
                  else
                    const Text('本地模式',
                        style: TextStyle(
                          fontSize: 32,
                        )),
                  if (state.isNotLocal)
                    if (state.currentUser != null)
                      Text(userTypeString(state.currentUser!.type))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyAccountsCard extends StatelessWidget {
  const MyAccountsCard({super.key});

  static const int accountPlatformCount = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {},
      builder: (context, state) {
        final supportedAccountPlatforms = context
                .read<MainBloc>()
                .state
                .serverFeatureSummary
                ?.accountPlatforms ??
            [];
        final unsupportedWellKnownAccountPlatforms =
            wellKnownAccountPlatforms.where((element) =>
                !supportedAccountPlatforms.any((e) => e.id == element));
        final accountPlatforms = supportedAccountPlatforms.followedBy(
            unsupportedWellKnownAccountPlatforms
                .map((e) => FeatureFlag(id: e)));
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
                          icon: _wellKnownAccountPlatformIcon(platform.id),
                          text: accountPlatformString(platform.id),
                        ),
                    ],
                  ),
                  Expanded(child: Container()),
                  UniversalIconButton(
                    onPressed: () {
                      context
                          .read<TipherethBloc>()
                          .add(TipherethGetAccountsEvent(null));
                    },
                    icon: Icon(UniversalIcon(context).refresh),
                  ),
                ],
              ),
              SizedBox(
                height: 256,
                child: TabBarView(
                  children: [
                    for (final platform in accountPlatforms)
                      _AccountCard(
                        platform: platform.id,
                        serverSupported:
                            supportedAccountPlatforms.contains(platform),
                        account: accountMap[platform.id],
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
                  borderRadius: UniversalUI.of(context).defaultBorderRadius,
                ),
                child: ClipRRect(
                  borderRadius: UniversalUI.of(context).defaultBorderRadius,
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
                      borderRadius: UniversalUI.of(context).defaultBorderRadius,
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
                      UniversalOutlinedButton(
                        onPressed: () {
                          unawaited(showDialog<void>(
                            context: context,
                            builder: (context) => UnLinkAccountDialog(
                              account: account!,
                            ),
                          ));
                        },
                        child: const Text('详情'),
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
            context.read<TipherethBloc>().add(TipherethGetAccountsEvent(null));
          },
        ),
      );
    } else {
      content = Center(
        child: UniversalCard(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.75),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text('服务器不支持此平台'),
          ),
        ),
      );
    }

    return UniversalCard(
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
                        UniversalTextFormField(
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
                                  ? UniversalCard(
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
                  UniversalFilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<TipherethBloc>().add(
                            TipherethLinkAccountEvent(
                                null, widget.platform, platformAccountID));
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

class UnLinkAccountDialog extends StatelessWidget {
  const UnLinkAccountDialog({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethUnLinkAccountState && state.success) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return UniversalDialog(
        title: const Text('账户详情'),
        content: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UniversalTextFormField(
                onSaved: null,
                readOnly: true,
                labelText: 'ID',
                initialValue: account.platformAccountId,
              ),
              const SizedBox(
                height: 16,
              ),
              UniversalTextFormField(
                onSaved: null,
                readOnly: true,
                labelText: '平台',
                initialValue: account.platform,
              ),
              const SizedBox(
                height: 16,
              ),
              UniversalTextFormField(
                onSaved: null,
                readOnly: true,
                labelText: '用户名',
                initialValue: account.name,
              ),
              const SizedBox(
                height: 16,
              ),
              UniversalTextFormField(
                onSaved: null,
                readOnly: true,
                labelText: '上次更新时间',
                initialValue: DurationHelper.recentString(
                    account.latestUpdateTime.toDateTime()),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state is TipherethUnLinkAccountState && state.failed
                    ? 48
                    : 0,
                child: state is TipherethUnLinkAccountState && state.failed
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
                        ),
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
        actions: [
          UniversalDialogAction(
            onPressed: () {
              context.read<TipherethBloc>().add(TipherethUnLinkAccountEvent(
                    null,
                    account.platform,
                    account.platformAccountId,
                  ));
            },
            child: state is TipherethUnLinkAccountState && state.processing
                ? const CircularProgressIndicator()
                : const Text('解绑'),
          ),
          UniversalDialogAction(
            onPressed: () {
              Navigator.pop(context); //close Dialog
            },
            isPrimary: true,
            child: const Text('关闭'),
          )
        ],
      );
    });
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
