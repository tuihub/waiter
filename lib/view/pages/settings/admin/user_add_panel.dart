import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../l10n/librarian.dart';

import '../../../specialized/right_panel_form.dart';
import '../../frame_page.dart';

class UserAddPanel extends StatefulWidget {
  const UserAddPanel({super.key});

  @override
  State<UserAddPanel> createState() => _UserAddPanelState();
}

class _UserAddPanelState extends State<UserAddPanel> {
  late String username;
  late String password;
  bool passwordSecure = true;
  UserType userType = UserType.USER_TYPE_NORMAL;
  UserStatus userStatus = UserStatus.USER_STATUS_ACTIVE;

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethAddUserState && state.success) {
        UniversalToast.show(context, message: '添加成功');
        close(context);
      }
    }, builder: (context, state) {
      return RightPanelForm(
        title: const Text('添加用户'),
        formFields: [
          TextFormField(
            onSaved: (newValue) => username = newValue!,
            decoration: InputDecoration(
              icon: Icon(UniversalIcon(context).person),
              border: const OutlineInputBorder(),
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
          TextFormField(
            onSaved: (newValue) => password = newValue!,
            obscureText: passwordSecure,
            decoration: InputDecoration(
              icon: const Icon(Icons.password),
              border: const OutlineInputBorder(),
              labelText: '密码',
              suffixIcon: UniversalIconButton(
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
                child: Text(userStatusString(UserStatus.USER_STATUS_ACTIVE)),
              ),
              DropdownMenuItem(
                value: UserStatus.USER_STATUS_BLOCKED,
                child: Text(userStatusString(UserStatus.USER_STATUS_BLOCKED)),
              ),
            ],
            onChanged: (select) {
              setState(() {
                userStatus = select ?? UserStatus.USER_STATUS_ACTIVE;
              });
            },
          ),
        ],
        errorMsg:
            state is TipherethAddUserState && state.failed ? state.msg : null,
        onSubmit: () {
          context.read<TipherethBloc>().add(TipherethAddUserEvent(
                null,
                User(
                  username: username,
                  password: password,
                  type: userType,
                  status: userStatus,
                ),
              ));
        },
        submitting: state is TipherethAddUserState && state.processing,
        close: () => close(context),
      );
    });
  }
}
