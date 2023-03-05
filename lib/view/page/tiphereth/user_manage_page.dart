import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';

class UserManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is! UserTableBase) {
          context.read<ApiRequestBloc>().add(
                UserTableLoadEvent(
                  ListUsersRequest(
                    paging: PagingRequest.getDefault(),
                  ),
                ),
              );
        }
        return Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  FilledButton.tonalIcon(
                    onPressed: () {
                      context.read<ApiRequestBloc>().add(
                            UserTableLoadEvent(
                              ListUsersRequest(
                                paging: PagingRequest.getDefault(),
                              ),
                            ),
                          );
                    },
                    icon: Icon(Icons.refresh),
                    label: Text("刷新"),
                  ),
                  Expanded(child: SizedBox()),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      context.read<ApiRequestBloc>().add(
                            CreateUserEvent(
                              CreateUserRequest(
                                user: User(
                                  username: "test_user",
                                  password: "123456",
                                  status: UserStatus.USER_STATUS_ACTIVE,
                                  type: UserType.USER_TYPE_NORMAL,
                                ),
                              ),
                            ),
                          );
                    },
                    icon: Icon(Icons.add),
                    label: Text("新增"),
                  ),
                ],
              ),
              Expanded(
                child: PaginatedDataTable2(
                  empty: Center(
                    child: state is UserTableLoading
                        ? CircularProgressIndicator()
                        : Container(
                            padding: const EdgeInsets.all(20),
                            child: state is UserTableFailed
                                ? Text('error ${state.message}')
                                : const Text('No data'),
                          ),
                  ),
                  rowsPerPage: 10,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: [
                    DataColumn2(
                      label: Text('Id'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('用户名'),
                    ),
                    DataColumn(
                      label: Text('密码'),
                    ),
                    DataColumn(
                      label: Text('用户状态'),
                    ),
                    DataColumn(
                      label: Text('用户类型'),
                    ),
                  ],
                  source: state is UserTableDone
                      ? UserTableSource(context, state.resp.users)
                      : UserTableSource(context, []),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class UserTableSource extends DataTableSource {
  UserTableSource(this.context, this.users);
  final BuildContext context;
  final List<User> users;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(Text('${users[index].id.id}')),
        DataCell(Text(users[index].username)),
        DataCell(Text("********")),
        DataCell(Text('${users[index].status}')),
        DataCell(Text('${users[index].type}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
