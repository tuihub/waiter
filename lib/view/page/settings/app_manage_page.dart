import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/client/api_helper.dart';
import 'package:waitress/common/const/gebura.dart';
import 'package:waitress/view/page/settings/app_create_dialog.dart';
import 'package:waitress/view/page/settings/app_update_dialog.dart';

class AppManagePage extends StatefulWidget {
  const AppManagePage({super.key});

  @override
  State<AppManagePage> createState() => _AppManagePageState();
}

class _AppManagePageState extends State<AppManagePage> {
  int pageSize = 10;
  late AppTableSource dataSource = AppTableSource(pageSize);
  PaginatorController paginatorController = PaginatorController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataSource.context = context;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: MultiSelectDialogField(
                    title: const Text('按数据来源筛选'),
                    buttonText: const Text('数据来源'),
                    buttonIcon: const Icon(Icons.filter_alt_outlined),
                    items: [
                      MultiSelectItem(AppSource.APP_SOURCE_INTERNAL,
                          appSourceString(AppSource.APP_SOURCE_INTERNAL)),
                      MultiSelectItem(AppSource.APP_SOURCE_STEAM,
                          appSourceString(AppSource.APP_SOURCE_STEAM)),
                    ],
                    onConfirm: (values) {
                      dataSource.sourceFilter = values;
                      dataSource.refreshDatasource();
                      paginatorController.goToFirstPage();
                    },
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                FilledButton.tonalIcon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AppCreateDialog(
                        callback: () {
                          dataSource.refreshDatasource();
                          paginatorController.goToFirstPage();
                        },
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
              child: AsyncPaginatedDataTable2(
                empty: const Center(child: CircularProgressIndicator()),
                rowsPerPage: pageSize,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                controller: paginatorController,
                columns: const [
                  DataColumn2(
                    label: Text('Id'),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text('名称'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('数据来源'),
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text('类型'),
                    size: ColumnSize.S,
                  ),
                ],
                source: dataSource,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTableSource extends AsyncDataTableSource {
  AppTableSource(this.pageSize);
  late BuildContext context;
  final int pageSize;
  late List<AppSource> sourceFilter = [];

  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    var resp = await GetIt.I<ApiHelper>().doRequest((client, option) async {
      return client.listApps(
          ListAppsRequest(
            paging: PagingRequest(
                pageSize: pageSize, pageNum: start ~/ pageSize + 1),
            sourceFilter: sourceFilter,
          ),
          options: option);
    });
    return AsyncRowsResponse(
      resp.getData().paging.totalSize.toInt(),
      resp.getData().apps.map(
        (app) {
          return DataRow2(
              cells: [
                DataCell(Text(app.id.id.toHexString())),
                DataCell(Text(app.name)),
                DataCell(Text(appSourceString(app.source))),
                DataCell(Text(appTypeString(app.type))),
              ],
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AppUpdateDialog(
                    callback: () {
                      refreshDatasource();
                    },
                    app: app,
                  ),
                );
              });
        },
      ).toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
