import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';

class PorterManagePage extends StatelessWidget {
  const PorterManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<TipherethBloc>().add(TipherethLoadPortersEvent());
      }
      final listData = state.porters ?? [];
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
                    if (state is TipherethLoadPortersState && state.processing)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is TipherethLoadPortersState && state.failed)
                      Center(
                        child: Text('加载失败: ${state.msg}'),
                      )
                    else
                      ListView.builder(
                        itemCount: listData.length,
                        itemBuilder: (context, index) {
                          final item = listData.elementAt(index);

                          void openEditPage() {
                            context
                                .read<TipherethBloc>()
                                .add(TipherethSetPorterEditIndexEvent(index));
                            AppRoutes.settingsPorterEdit().go(context);
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
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 10,
                                                color: Theme.of(context)
                                                    .disabledColor),
                                            maxLines: 2,
                                          ),
                                          Text(item.name),
                                          Text(item.version),
                                          Text(
                                              '状态: ${userStatusString(item.status)}'),
                                          Text(item.featureSummary),
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
            context.read<TipherethBloc>().add(TipherethLoadPortersEvent());
          },
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
