import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:http/http.dart' as http;
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;
import 'package:waitress/common/util/input_formatters.dart';
import 'package:waitress/view/page/yesod/yesod_add/bloc/yesod_add_bloc.dart';
import 'package:waitress/view/widget/form_field.dart';
import 'package:webfeed_revised/webfeed_revised.dart';

part 'first_stage.dart';
part 'second_stage.dart';

class YesodeAdd extends StatelessWidget {
  final void Function() callback;

  YesodeAdd({super.key, required this.callback});

  final _firstFormKey = GlobalKey<FormState>();
  final _secondFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YesodAddBloc(),
      child:
          BlocBuilder<YesodAddBloc, YesodAddState>(builder: ((context, state) {
        return AlertDialog(
          title: const Text('添加RSS订阅'),
          content: state.stage.isUrlCheck
              ? YesodAddFirstStage(
                  formKey: _firstFormKey,
                )
              : YesodAddSecondStage(),
          actions: [
            if (state.stage.isUrlCheck)
              TextButton(
                onPressed: () {
                  if (state is YesodAddInitial) {
                    if (_firstFormKey.currentState!.validate()) {
                      _firstFormKey.currentState!.save();
                    }
                  }
                },
                child: state is YesodAddInitial
                    ? state is YesodUrlCheckLoading
                        ? const CircularProgressIndicator()
                        : const Text('验证')
                    : const Text('下一步'),
              ),
            if (state.stage.isFeedConfig)
              TextButton(
                onPressed: () {
                  if (state is YesodAddSecondState) {
                    context.read<YesodAddBloc>().add(YesodFeedConfigEvent(
                        name: state.name,
                        iconUrl: state.iconUrl,
                        refreshInterval: state.refreshInterval,
                        enabled: state.enabled));
                  }
                },
                child: state is YesodFeedConfigLoading
                    ? const CircularProgressIndicator()
                    : const Text('确定'),
              ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); //close Dialog
              },
              child: const Text('取消'),
            )
          ],
        );
      })),
    );
  }
}
