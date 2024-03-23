import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/netzach/netzach_bloc.dart';
import '../../../../bloc/yesod/yesod_bloc.dart';
import '../../../../repo/grpc/l10n.dart';
import '../../../../route.dart';

class NotifyTargetPage extends StatelessWidget {
  const NotifyTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocBuilder<NetzachBloc, NetzachState>(builder: (context, state) {
      if (firstBuild) {
        firstBuild = false;
        context.read<NetzachBloc>().add(NetzachInitEvent());
        context.read<YesodBloc>().add(YesodInitEvent());
      }
      final listData = state.notifyTargets ?? [];
      final bgColor = Theme.of(context).colorScheme.surface;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  FilledButton.tonalIcon(
                    onPressed: () async {
                      const SettingsFunctionRoute(
                              SettingsFunctions.notifyTarget,
                              action: SettingsActions.notifyTargetAdd)
                          .go(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('添加'),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(children: [
                    if (state is NetzachTargetLoadState && state.processing)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is NetzachTargetLoadState && state.failed)
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
                                .read<NetzachBloc>()
                                .add(NetzachSetTargetEditIndexEvent(index));
                            const SettingsFunctionRoute(
                                    SettingsFunctions.notifyTarget,
                                    action: SettingsActions.notifyTargetEdit)
                                .go(context);
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
                                          Text(
                                              '类型: ${notifyTargetDestinationString(item.destination)}'),
                                          Text(
                                              '状态: ${notifyTargetStatusString(item.status)}'),
                                          Text(item.description),
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
            context.read<NetzachBloc>().add(NetzachTargetLoadEvent());
          },
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
