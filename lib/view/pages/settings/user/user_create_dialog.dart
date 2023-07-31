import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/api/api_mixins.dart';
import 'package:waitress/common/api/l10n.dart';

class UserCreateDialog extends StatefulWidget {
  final void Function() callback;

  const UserCreateDialog({super.key, required this.callback});
  @override
  State<UserCreateDialog> createState() => _UserCreateDialogState();
}

class _UserCreateDialogState extends State<UserCreateDialog>
    with SingleRequestMixin<UserCreateDialog, CreateUserResponse> {
  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRequest(
        request: (client, option) {
          return client.createUser(
            CreateUserRequest(
              user: User(
                username: username,
                password: password,
                type: userType,
                status: userStatus,
              ),
            ),
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

  late String username;
  late String password;
  bool passwordSecure = true;
  UserType userType = UserType.USER_TYPE_NORMAL;
  UserStatus userStatus = UserStatus.USER_STATUS_ACTIVE;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('添加用户'),
      content: SizedBox(
        width: 600,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onSaved: (newValue) => username = newValue!,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '用户名',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户名';
                  }
                  // to-do check username
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: (newValue) => password = newValue!,
                obscureText: passwordSecure,
                decoration: InputDecoration(
                  icon: const Icon(Icons.password),
                  border: const OutlineInputBorder(),
                  labelText: '密码',
                  suffixIcon: IconButton(
                    icon: passwordSecure
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        passwordSecure = !passwordSecure;
                      });
                    },
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }
                  if (value.length < 8) {
                    setState(() {
                      passwordSecure = false;
                    });
                    return '密码长度不能小于8位';
                  }
                  // to-do check username
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.security),
                  border: const OutlineInputBorder(),
                  labelText: '用户类型',
                ),
                value: userType,
                items: [
                  DropdownMenuItem(
                    value: UserType.USER_TYPE_ADMIN,
                    child: Text(userTypeString(UserType.USER_TYPE_ADMIN)),
                  ),
                  DropdownMenuItem(
                    value: UserType.USER_TYPE_NORMAL,
                    child: Text(userTypeString(UserType.USER_TYPE_NORMAL)),
                  ),
                  DropdownMenuItem(
                    value: UserType.USER_TYPE_SENTINEL,
                    child: Text(userTypeString(UserType.USER_TYPE_SENTINEL)),
                  ),
                ],
                onChanged: (select) {},
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.settings),
                  border: const OutlineInputBorder(),
                  labelText: '用户状态',
                ),
                value: userStatus,
                items: [
                  DropdownMenuItem(
                    value: UserStatus.USER_STATUS_ACTIVE,
                    child:
                        Text(userStatusString(UserStatus.USER_STATUS_ACTIVE)),
                  ),
                  DropdownMenuItem(
                    value: UserStatus.USER_STATUS_BLOCKED,
                    child:
                        Text(userStatusString(UserStatus.USER_STATUS_BLOCKED)),
                  ),
                ],
                onChanged: (select) {},
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
                            Text(response.error ?? "未知错误"),
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
