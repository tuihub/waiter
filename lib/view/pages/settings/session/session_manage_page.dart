import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../model/common_model.dart';
import '../../../../route.dart';
import '../../../helper/duration_format.dart';
import '../../../helper/spacing.dart';

class SessionManagePage extends StatelessWidget {
  const SessionManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<TipherethBloc>().add(TipherethLoadSessionsEvent());
      }
      final listData = state.sessions ?? [];
      final deviceInfo = context.read<MainBloc>().state.deviceInfo ??
          const ClientDeviceInfo('', '');
      final bgColor = Theme.of(context).colorScheme.surface;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(children: [
                    if (state is TipherethLoadSessionsState && state.processing)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is TipherethLoadSessionsState && state.failed)
                      Center(
                        child: Text('加载失败: ${state.msg}'),
                      )
                    else
                      ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 36, 8, 36),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '当前设备',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 10,
                                              color: Theme.of(context)
                                                  .disabledColor),
                                          maxLines: 2,
                                        ),
                                        Text(
                                          deviceInfo.deviceName.isNotEmpty ||
                                                  deviceInfo
                                                      .systemVersion.isNotEmpty
                                              ? '${deviceInfo.deviceName} ${deviceInfo.systemVersion}'
                                              : '未知设备',
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        SpacingHelper.defaultDivider,
                        const SizedBox(height: 16),
                        ListView.builder(
                          itemCount: listData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = listData.elementAt(index);

                            void openEditPage() {
                              context.read<TipherethBloc>().add(
                                  TipherethSetSessionEditIndexEvent(index));
                              AppRoutes.settingsSessionEdit().go(context);
                            }

                            if (item.deviceInfo.deviceId ==
                                context
                                    .read<MainBloc>()
                                    .state
                                    .currentDeviceId) {
                              return const SizedBox();
                            }

                            return SelectionArea(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: openEditPage,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.id.id.toHexString(),
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 10,
                                                  color: Theme.of(context)
                                                      .disabledColor),
                                              maxLines: 2,
                                            ),
                                            Text(
                                              item.deviceInfo.deviceName
                                                          .isNotEmpty ||
                                                      item
                                                          .deviceInfo
                                                          .systemVersion
                                                          .isNotEmpty
                                                  ? '${item.deviceInfo.deviceName} ${item.deviceInfo.systemVersion}'
                                                  : '未知设备',
                                            ),
                                            Text(
                                              item.deviceInfo.clientName
                                                          .isNotEmpty ||
                                                      item
                                                          .deviceInfo
                                                          .clientVersion
                                                          .isNotEmpty
                                                  ? '${item.deviceInfo.clientName} ${item.deviceInfo.clientVersion}'
                                                  : '未知客户端',
                                            ),
                                            Text(
                                              '${DurationHelper.recentString(item.createTime.toDateTime(toLocal: true))}${item.expireTime.toDateTime(toLocal: true).isBefore(DateTime.now()) ? ' · 需要重新登录' : ''}',
                                            ),
                                          ],
                                        ),
                                        const Expanded(child: SizedBox()),
                                        SizedBox(
                                          width: 64,
                                          height: 64,
                                          child: IconButton(
                                            onPressed: openEditPage,
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ]),
                  ]),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TipherethBloc>().add(TipherethLoadSessionsEvent());
          },
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
