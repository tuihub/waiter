import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/common_model.dart';
import '../../../form/form_field.dart';
import '../../../form/input_formatters.dart';
import '../yesod_preview_card.dart';
import 'bloc/yesod_add_bloc.dart';

part 'first_stage.dart';
part 'second_stage.dart';

class YesodAdd extends StatelessWidget {
  const YesodAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YesodAddBloc(),
      child:
          BlocBuilder<YesodAddBloc, YesodAddState>(builder: (context, state) {
        return AlertDialog(
          title: const Text('添加订阅'),
          content: state is! YesodAddSecondState
              ? YesodAddFirstStage()
              : const YesodAddSecondStage(),
          actions: [
            if (state is YesodAddSecondState)
              TextButton(
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
              TextButton(
                  onPressed: state.loadState == LoadState.loading
                      ? null
                      : () {
                          context.read<YesodAddBloc>().add(
                                YesodUrlValidateEvent(),
                              );
                        },
                  child: const Text('验证')),
            if (state is YesodAddFirstState)
              TextButton(
                onPressed: state.loadState == LoadState.loading
                    ? null
                    : () {
                        context.read<YesodAddBloc>().add(
                              YesodAddSecondStageEvent(
                                state.example?.subscription.title ?? '',
                                state.url,
                              ),
                            );
                      },
                child: const Text('下一步'),
              ),
            if (state is YesodAddSecondState)
              TextButton(
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
            TextButton(
              onPressed: () {
                Navigator.pop(context, false); //close Dialog
              },
              child: const Text('取消'),
            )
          ],
        );
      }),
    );
  }
}
