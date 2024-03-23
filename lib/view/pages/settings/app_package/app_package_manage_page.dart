import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/gebura/gebura_bloc.dart';
import '../../../../route.dart';
import '../../../helper/spacing.dart';

class AppPackageManagePage extends StatefulWidget {
  const AppPackageManagePage({super.key});

  @override
  State<AppPackageManagePage> createState() => _AppPackageManagePageState();
}

class _AppPackageManagePageState extends State<AppPackageManagePage> {
  int pageSize = 10;
  late AppPackageTableSource dataSource = AppPackageTableSource(pageSize);
  PaginatorController paginatorController = PaginatorController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataSource.context = context;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: SpacingHelper.defaultBorderRadius,
                ),
              ),
              const Expanded(child: SizedBox()),
              FilledButton.tonalIcon(
                onPressed: () {
                  const SettingsFunctionRoute(SettingsFunctions.appPackage,
                          action: SettingsActions.appPackageAdd)
                      .go(context);
                },
                icon: const Icon(Icons.add),
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
                  label: Text('简介'),
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

class AppPackageTableSource extends AsyncDataTableSource {
  AppPackageTableSource(this.pageSize);
  late BuildContext context;
  final int pageSize;

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final data = await context
        .read<GeburaBloc>()
        .listApps(pageSize, startIndex ~/ pageSize + 1);
    return AsyncRowsResponse(
      data.paging.totalSize.toInt(),
      data.apps.map(
        (app) {
          return DataRow2(
              cells: [
                DataCell(Text(app.id.id.toHexString())),
                DataCell(Text(app.name)),
                DataCell(Text(app.description)),
              ],
              onTap: () {
                SettingsFunctionRoute(SettingsFunctions.appPackage,
                        action: SettingsActions.appPackageEdit, $extra: app)
                    .go(context);
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
