import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/common_model.dart';
import '../../../../route.dart';
import '../../../form/form_field.dart';
import '../../../form/input_formatters.dart';
import '../yesod_preview_card.dart';
import 'bloc/yesod_add_bloc.dart';

part 'first_stage.dart';
part 'second_stage.dart';

class YesodConfigAdd extends StatelessWidget {
  const YesodConfigAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YesodAddBloc(),
      child:
          BlocBuilder<YesodAddBloc, YesodAddState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: const Text('添加订阅'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: state is! YesodAddSecondState
                  ? YesodAddFirstStage()
                  : const YesodAddSecondStage(),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state is YesodAddSecondState)
                  ElevatedButton(
                    onPressed: state.loadState == LoadState.loading
                        ? null
                        : () {
                            context.read<YesodAddBloc>().add(
                                  YesodUrlCheckEvent(
                                    url: state.url,
                                  ),
                                );
                          },
                    child: const Text('上一步'),
                  ),
                if (state is! YesodAddSecondState)
                  ElevatedButton(
                      onPressed: state.loadState == LoadState.loading
                          ? null
                          : () {
                              context.read<YesodAddBloc>().add(
                                    YesodUrlValidateEvent(),
                                  );
                            },
                      child: const Text('预览')),
                if (state is! YesodAddSecondState)
                  ElevatedButton(
                    onPressed: () {
                      context.read<YesodAddBloc>().add(
                            YesodAddSecondStageEvent(
                              state is YesodAddFirstState
                                  ? state.example?.subscription.title ?? ''
                                  : '',
                              state.url,
                            ),
                          );
                    },
                    child: const Text('下一步'),
                  ),
                if (state is YesodAddSecondState)
                  ElevatedButton(
                    onPressed: state.loadState == LoadState.loading
                        ? null
                        : () {
                            context.read<YesodAddBloc>().add(
                                  YesodFeedConfigEvent(
                                    url: state.url,
                                    name: state.name,
                                    refreshInterval: state.refreshInterval,
                                    category: state.category,
                                    enabled: state.enabled,
                                  ),
                                );
                          },
                    child: state.loadState == LoadState.failure
                        ? const Text('重试')
                        : const Text('确定'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    AppRoutes.yesodConfigAdd().pop(context);
                  },
                  child: const Text('取消'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
