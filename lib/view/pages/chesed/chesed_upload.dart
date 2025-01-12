import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/chesed/chesed_bloc.dart';
import '../../../common/platform.dart';

class ChesedUpload extends StatefulWidget {
  final void Function() callback;

  const ChesedUpload({super.key, required this.callback});

  @override
  ChesedUploadState createState() => ChesedUploadState();
}

class ChesedUploadState extends State<ChesedUpload> {
  late String rssUrl;
  late int refreshInterval;
  late bool enabled;
  late File file;
  late String name;
  late String extension;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChesedBloc, ChesedState>(builder: (context, state) {
      return UniversalDialog(
        title: const Text('上传图片'),
        content: state is ChesedUploadImageState && state.msg != null
            ? Text(state.msg!)
            : null,
        actions: [
          UniversalDialogAction(
            onPressed: () {
              context
                  .read<ChesedBloc>()
                  .add(ChesedUploadImageEvent(ChesedUploadImageType.pick));
            },
            child: state is ChesedUploadImageState && state.processing
                ? const CircularProgressIndicator()
                : const Text('选择文件'),
          ),
          if (PlatformHelper.isWindowsApp())
            UniversalDialogAction(
              onPressed: () {
                context
                    .read<ChesedBloc>()
                    .add(ChesedUploadImageEvent(ChesedUploadImageType.capture));
              },
              child: state is ChesedUploadImageState && state.processing
                  ? const CircularProgressIndicator()
                  : const Text('截取屏幕'),
            ),
          UniversalDialogAction(
            onPressed: () {
              Navigator.pop(context); //close Dialog
            },
            child: const Text('取消'),
          )
        ],
      );
    });
  }
}
