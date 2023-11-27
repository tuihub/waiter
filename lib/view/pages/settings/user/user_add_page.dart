import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';

class UserAddPage extends StatefulWidget {
  const UserAddPage({super.key});

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  final _formKey = GlobalKey<FormState>();

  late String username;
  late String password;
  bool passwordSecure = true;
  UserType userType = UserType.USER_TYPE_NORMAL;
  UserStatus userStatus = UserStatus.USER_STATUS_ACTIVE;

  void close(BuildContext context) {
    AppRoutes.settingsUserAdd().pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethAddUserState && state.success) {
        const Toast(title: '', message: '添加成功').show(context);
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('添加用户'),
        form: Form(
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
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state is TipherethAddUserState && state.failed ? 48 : 0,
                child: state is TipherethAddUserState && state.failed
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
                context.read<TipherethBloc>().add(TipherethAddUserEvent(
                      User(
                        username: username,
                        password: password,
                        type: userType,
                        status: userStatus,
                      ),
                    ));
              }
            },
            child: state is TipherethAddUserState && state.processing
                ? const CircularProgressIndicator()
                : const Text('确定'),
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
