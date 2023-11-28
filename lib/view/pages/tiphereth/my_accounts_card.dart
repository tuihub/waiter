import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../repo/grpc/l10n.dart';
import '../../helper/spacing.dart';
import 'account_dialog.dart';

class MyAccountsCard extends StatelessWidget {
  const MyAccountsCard({super.key});

  static const int accountPlatformCount = 1;

  @override
  Widget build(BuildContext context) {
    String msg = '加载中';
    bool firstBuild = true;
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethGetAccountsState) {
          if (state.msg != null) {
            msg = state.msg!;
          }
          if (state.success) {
            msg = '添加绑定';
          }
        }
      },
      builder: (context, state) {
        void refresh() {
          context.read<TipherethBloc>().add(TipherethGetAccountsEvent());
        }

        if (firstBuild) {
          firstBuild = false;
          refresh();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final Account account in state.accounts ?? [])
                    _AccountCard(
                      account: account,
                      callback: () {
                        unawaited(showDialog<void>(
                          context: context,
                          builder: (context) => UnLinkAccountDialog(
                            account: account,
                          ),
                        ));
                      },
                    ),
                  if (state.accounts == null)
                    _AccountCard(
                      account: null,
                      callback: refresh,
                      msg: msg,
                    )
                  else if (state.accounts!.length < accountPlatformCount)
                    _AccountCard(
                      account: null,
                      callback: () {
                        unawaited(showDialog<void>(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: context.read<TipherethBloc>(),
                            child: const LinkAccountDialog(),
                          ),
                        ));
                      },
                      msg: msg ?? '',
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard(
      {required this.account, required this.callback, this.msg = ''});

  final Account? account;
  final String msg;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 384,
      height: 128,
      child: Material(
        borderRadius: SpacingHelper.defaultBorderRadius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: SpacingHelper.defaultBorderRadius,
          ),
          child: InkWell(
            borderRadius: SpacingHelper.defaultBorderRadius,
            onTap: callback,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: account == null
                  ? Center(
                      child: TextButton(
                        onPressed: callback,
                        child: Text(msg),
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: SpacingHelper.defaultBorderRadius,
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  account!.avatarUrl,
                                ),
                                fit: BoxFit.cover),
                          ),
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
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
                              Text(
                                '${S.current.ACCOUNT_PLATFORM}: ${accountPlatformString(account!.platform)}',
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10,
                                ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
