import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../route.dart';
import '../../../../l10n/librarian.dart';
import 'package:universal_ui/universal_ui.dart';
import '../../frame_page.dart';

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
    final appSources =
        context.read<MainBloc>().state.serverFeatureSummary?.appInfoSources ??
            [];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: UniversalUI.of(context).defaultBorderRadius,
                ),
                child: MultiSelectDialogField(
                  title: const Text('按数据来源筛选'),
                  buttonText: const Text('数据来源'),
                  buttonIcon: Icon(UniversalUI.of(context).icons.filter),
                  items: [
                    for (final source in appSources)
                      MultiSelectItem(source, appSourceString(source.id)),
                  ],
                  onConfirm: (values) {
                    dataSource.sourceFilter = values.map((e) => e.id).toList();
                    dataSource.refreshDatasource();
                    paginatorController.goToFirstPage();
                  },
                  decoration: BoxDecoration(
                    borderRadius: UniversalUI.of(context).defaultBorderRadius,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              FilledButton.tonalIcon(
                onPressed: () {
                  const SettingsFunctionRoute(SettingsFunctions.app,
                          action: SettingsActions.appAdd)
                      .go(context);
                  ModuleFramePage.of(context)?.openDrawer();
                },
                icon: Icon(UniversalUI.of(context).icons.refresh),
                label: const Text('新增'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: AsyncPaginatedDataTable2(
              empty: const Center(child: Text('No data')),
              errorBuilder: (e) {
                return Center(child: Text('Load Failed: $e'));
              },
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
    );
  }
}

class AppTableSource extends AsyncDataTableSource {
  AppTableSource(this.pageSize);
  late BuildContext context;
  final int pageSize;
  late List<String> sourceFilter = [];

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    return AsyncRowsResponse(0, []);
    // final data = await context
    //     .read<GeburaBloc>()
    //     .listAppInfos(pageSize, startIndex ~/ pageSize + 1, sourceFilter);
    // return AsyncRowsResponse(
    //   data.paging.totalSize.toInt(),
    //   data.appInfos.map(
    //     (app) {
    //       return DataRow2(
    //           cells: [
    //             DataCell(Text(app.id.id.toHexString())),
    //             DataCell(Text(app.name)),
    //             DataCell(Text(appSourceString(app.source))),
    //             DataCell(Text(appTypeString(app.type))),
    //           ],
    //           onTap: () {
    //             const SettingsFunctionRoute(SettingsFunctions.app,
    //                     action: SettingsActions.appEdit)
    //                 .go(context);
    //             ModuleFramePage.of(context)?.openDrawer();
    //           });
    //     },
    //   ).toList(),
    // );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
