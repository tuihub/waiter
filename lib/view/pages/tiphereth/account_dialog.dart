import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../common/api/api_mixins.dart';
import '../../helper/duration_format.dart';

class LinkAccountDialog extends StatefulWidget {
  const LinkAccountDialog({super.key, required this.callback});

  final void Function() callback;

  @override
  State<LinkAccountDialog> createState() => _LinkAccountDialogState();
}

class _LinkAccountDialogState extends State<LinkAccountDialog>
    with SingleRequestMixin<LinkAccountDialog, LinkAccountResponse> {
  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
        request: (client, option) {
          return client.linkAccount(
            LinkAccountRequest(
                accountId: AccountID(
              platform: platform,
              platformAccountId: platformAccountID,
            )),
            options: option,
          );
        },
      ).then((value) {
        widget.callback();
        Navigator.of(context).pop();
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  AccountPlatform platform = AccountPlatform.ACCOUNT_PLATFORM_STEAM;
  late String platformAccountID;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加绑定'),
      content: SizedBox(
        width: 600,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.place),
                  border: OutlineInputBorder(),
                  labelText: '平台',
                ),
                value: platform,
                items: const [
                  DropdownMenuItem(
                    value: AccountPlatform.ACCOUNT_PLATFORM_STEAM,
                    child: Text('Steam'),
                  ),
                ],
                onChanged: (newValue) => platform = newValue!,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: (newValue) => platformAccountID = newValue!,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
                // The validator receives the text that the user has entered.
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
                height: isError && !loading ? 48 : 0,
                child: isError && !loading
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            Text(response.error ?? '未知错误'),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: submit,
          child: loading ? const CircularProgressIndicator() : const Text('确定'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('取消'),
        )
      ],
    );
  }
}

class UnLinkAccountDialog extends StatefulWidget {
  const UnLinkAccountDialog(
      {super.key, required this.callback, required this.account});

  final void Function() callback;
  final Account account;

  @override
  State<UnLinkAccountDialog> createState() => _UnLinkAccountDialogState();
}

class _UnLinkAccountDialogState extends State<UnLinkAccountDialog>
    with SingleRequestMixin<UnLinkAccountDialog, UnLinkAccountResponse> {
  void unlink() {
    doRequest(
      request: (client, option) {
        return client.unLinkAccount(
          UnLinkAccountRequest(
              accountId: AccountID(
            platform: widget.account.platform,
            platformAccountId: widget.account.platformAccountId,
          )),
          options: option,
        );
      },
    ).then((value) {
      widget.callback();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('账户详情'),
      content: SizedBox(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              onSaved: null,
              readOnly: true,
              decoration: const InputDecoration(
                // icon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
              initialValue: widget.account.platformAccountId,
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                // icon: Icon(Icons.place),
                border: OutlineInputBorder(),
                labelText: '平台',
              ),
              value: widget.account.platform,
              items: const [
                DropdownMenuItem(
                  value: AccountPlatform.ACCOUNT_PLATFORM_STEAM,
                  child: Text('Steam'),
                ),
              ],
              onChanged: null,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onSaved: null,
              readOnly: true,
              decoration: const InputDecoration(
                // icon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: '用户名',
              ),
              initialValue: widget.account.name,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onSaved: null,
              readOnly: true,
              decoration: const InputDecoration(
                // icon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: '上次更新时间',
              ),
              initialValue: DurationHelper.recentString(
                  widget.account.latestUpdateTime.toDateTime()),
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isError && !loading ? 48 : 0,
              child: isError && !loading
                  ? Ink(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(kToolbarHeight),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(response.error ?? '未知错误'),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: unlink,
          child: loading ? const CircularProgressIndicator() : const Text('解绑'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('关闭'),
        )
      ],
    );
  }
}
