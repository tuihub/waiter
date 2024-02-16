import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class UserEditPage extends StatefulWidget {
  final User user;

  const UserEditPage({super.key, required this.user});
  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final _formKey = GlobalKey<FormState>();

  late String username;
  late String oldPassword = '';
  late String newPassword = '';
  final TextEditingController _pass = TextEditingController();
  late UserType userType;
  late UserStatus userStatus;
  bool passwordSecure = true;

  @override
  void initState() {
    super.initState();
    username = widget.user.username;
    userType = widget.user.type;
    userStatus = widget.user.status;
  }

  void close(BuildContext context) {
    AppRoutes.settingsUserEdit().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethEditUserState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('用户详情'),
        form: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('ID: ${widget.user.id.id.toHexString()}'),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: username,
                onSaved: (newValue) => username = newValue!,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '用户名',
                ),
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
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.security),
                  border: OutlineInputBorder(),
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
                onChanged: (select) {
                  setState(() {
                    userType = select ?? UserType.USER_TYPE_NORMAL;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.settings),
                  border: OutlineInputBorder(),
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
                onChanged: (select) {
                  setState(() {
                    userStatus = select ?? UserStatus.USER_STATUS_ACTIVE;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ExpansionTile(
                title: const Text('修改密码'),
                children: [
                  const Text('你必须拥有旧密码才能修改密码'),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onSaved: (newValue) => oldPassword = newValue!,
                    obscureText: passwordSecure,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      border: const OutlineInputBorder(),
                      labelText: '旧密码',
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
                    validator: (value) {
                      if (_pass.text.isNotEmpty) {
                        if (value == null || value.isEmpty) {
                          return '请输入密码';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onSaved: (newValue) => newPassword = newValue!,
                    obscureText: passwordSecure,
                    controller: _pass,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      border: const OutlineInputBorder(),
                      labelText: '新密码',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
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
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height:
                    state is TipherethEditUserState && state.failed ? 48 : 0,
                child: state is TipherethEditUserState && state.failed
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
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
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                final user = User(
                  id: widget.user.id,
                  username: username,
                  type: userType,
                  status: userStatus,
                );

                if (newPassword.isEmpty) {
                  context.read<TipherethBloc>().add(TipherethEditUserEvent(
                        user,
                      ));
                } else {
                  user.password = newPassword;
                  context.read<TipherethBloc>().add(TipherethEditUserEvent(
                        user,
                        password: oldPassword,
                      ));
                }
              }
            },
            child: state is TipherethEditUserState && state.processing
                ? const CircularProgressIndicator()
                : const Text('应用更改'),
          ),
          ElevatedButton(
            onPressed: () => close(context),
            child: const Text('取消'),
          )
        ],
      );
    });
  }
}
