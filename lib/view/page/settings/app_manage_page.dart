import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/view/page/settings/app_create_dialog.dart';

import 'user_edit_dialog.dart';

class AppManagePage extends StatefulWidget {
  const AppManagePage({super.key});

  @override
  State<AppManagePage> createState() => _AppManagePageState();
}

class _AppManagePageState extends State<AppManagePage>
    with SingleRequestMixin<AppManagePage, ListAppsResponse> {
  int page = 0;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    loadAppTable();
  }

  void loadAppTable() {
    doRequest(
      request: (client, option) {
        return client.listApps(
          ListAppsRequest(
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
                  onPressed: loadAppTable,
                  icon: const Icon(Icons.refresh),
                  label: const Text("刷新"),
                ),
                const Expanded(child: SizedBox()),
                FilledButton.tonalIcon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AppCreateDialog(
                        callback: loadAppTable,
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
                    label: Text('名称'),
                  ),
                  DataColumn(
                    label: Text('描述'),
                  ),
                  DataColumn(
                    label: Text('数据来源'),
                  ),
                  DataColumn(
                    label: Text('类型'),
                  ),
                ],
                source: isSuccess
                    ? AppTableSource(context, response.data!.apps)
                    : AppTableSource(context, []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTableSource extends DataTableSource {
  AppTableSource(this.context, this.users);
  final BuildContext context;
  final List<App> users;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(Text(users[index].id.id.toHexString())),
        DataCell(Text(users[index].name)),
        DataCell(Text(users[index].shortDescription)),
        DataCell(Text('${users[index].source}')),
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
