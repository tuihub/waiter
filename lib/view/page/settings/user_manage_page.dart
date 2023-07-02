import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';

import 'user_edit_dialog.dart';

class UserManagePage extends StatefulWidget {
  const UserManagePage({super.key});

  @override
  State<UserManagePage> createState() => _UserManagePageState();
}

class _UserManagePageState extends State<UserManagePage>
    with SingleRequestMixin<UserManagePage, ListUsersResponse> {
  int page = 0;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    loadUserTable();
  }

  void loadUserTable() {
    doRequest(
      request: (client, option) {
        return client.listUsers(
          ListUsersRequest(
            paging: PagingRequest(pageSize: pageSize, pageNum: page + 1),
          ),
          options: option,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              children: [
                FilledButton.tonalIcon(
                  onPressed: loadUserTable,
                  icon: const Icon(Icons.refresh),
                  label: const Text("刷新"),
                ),
                const Expanded(child: SizedBox()),
                FilledButton.tonalIcon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => UserCreateDialog(
                        callback: loadUserTable,
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("新增"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: PaginatedDataTable2(
                empty: Center(
                  child: loading
                      ? const CircularProgressIndicator()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: isError
                              ? Text('error ${response.error}')
                              : const Text('No data'),
                        ),
                ),
                rowsPerPage: 10,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
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
                source: isSuccess
                    ? UserTableSource(context, response.data!.users)
                    : UserTableSource(context, []),
              ),
            ),
          ],
        ),
      ),
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
        const DataCell(Text("********")),
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
