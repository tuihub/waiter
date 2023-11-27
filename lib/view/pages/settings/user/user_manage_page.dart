import 'dart:async';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';
import '../../../helper/spacing.dart';

class UserManagePage extends StatefulWidget {
  const UserManagePage({super.key});

  @override
  State<UserManagePage> createState() => _UserManagePageState();
}

class _UserManagePageState extends State<UserManagePage> {
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
                child: MultiSelectDialogField(
                  title: const Text('按用户类型筛选'),
                  buttonText: const Text('用户类型'),
                  buttonIcon: const Icon(Icons.filter_alt_outlined),
                  items: [
                    MultiSelectItem(
                      UserType.USER_TYPE_ADMIN,
                      userTypeString(UserType.USER_TYPE_ADMIN),
                    ),
                    MultiSelectItem(
                      UserType.USER_TYPE_NORMAL,
                      userTypeString(UserType.USER_TYPE_NORMAL),
                    ),
                    MultiSelectItem(
                      UserType.USER_TYPE_SENTINEL,
                      userTypeString(UserType.USER_TYPE_SENTINEL),
                    ),
                  ],
                  onConfirm: (values) {
                    dataSource.typeFilter = values;
                    dataSource.refreshDatasource();
                    paginatorController.goToFirstPage();
                  },
                  decoration: BoxDecoration(
                    borderRadius: SpacingHelper.defaultBorderRadius,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: SpacingHelper.defaultBorderRadius,
                ),
                child: MultiSelectDialogField(
                  title: const Text('按用户状态筛选'),
                  buttonText: const Text('用户状态'),
                  buttonIcon: const Icon(Icons.filter_alt_outlined),
                  items: [
                    MultiSelectItem(
                      UserStatus.USER_STATUS_ACTIVE,
                      userStatusString(UserStatus.USER_STATUS_ACTIVE),
                    ),
                    MultiSelectItem(
                      UserStatus.USER_STATUS_BLOCKED,
                      userStatusString(UserStatus.USER_STATUS_BLOCKED),
                    ),
                  ],
                  onConfirm: (values) {
                    dataSource.statusFilter = values;
                    dataSource.refreshDatasource();
                    paginatorController.goToFirstPage();
                  },
                  decoration: BoxDecoration(
                    borderRadius: SpacingHelper.defaultBorderRadius,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              FilledButton.tonalIcon(
                onPressed: () {
                  AppRoutes.settingsUserAdd().go(context);
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
                ),
                DataColumn2(
                  label: Text('用户名'),
                ),
                DataColumn2(
                  label: Text('用户状态'),
                ),
                DataColumn2(
                  label: Text('用户类型'),
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
  late List<UserType> typeFilter = [];
  late List<UserStatus> statusFilter = [];

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final data = await context.read<TipherethBloc>().listUsers(
          pageSize,
          startIndex ~/ pageSize + 1,
          typeFilter,
          statusFilter,
        );
    return AsyncRowsResponse(
      data.paging.totalSize.toInt(),
      data.users.map(
        (user) {
          return DataRow2(
              cells: [
                DataCell(Text(user.id.id.toHexString())),
                DataCell(Text(user.username)),
                DataCell(Text(userTypeString(user.type))),
                DataCell(Text(userStatusString(user.status))),
              ],
              onTap: () {
                AppRoutes.settingsUserEdit().go(context, extra: user);
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
