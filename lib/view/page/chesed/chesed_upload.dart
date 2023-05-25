import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:screen_capturer/screen_capturer.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/base.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/binah.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/chesed.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as $duration;

class ChesedUpload extends StatefulWidget {
  final void Function() callback;

  const ChesedUpload({super.key, required this.callback});

  @override
  ChesedUploadState createState() => ChesedUploadState();
}

class ChesedUploadState extends State<ChesedUpload>
    with SingleRequestMixin<ChesedUpload, PresignedUploadFileStatusResponse> {
  late String rssUrl;
  late int refreshInterval;
  late bool enabled;
  late File file;
  late String name;
  late String extension;

  void pickSubmit() async {
    final pickResult = await file_picker.FilePicker.platform
        .pickFiles(type: file_picker.FileType.image);
    if (pickResult != null) {
      final pick = pickResult.files.first;
      file = File(pick.path!); // TODO not compatible with web
      name = pick.name;
      extension = pick.extension!;
      doRequest().then((value) {
        if (isSuccess) {
          widget.callback();
          Navigator.pop(context);
        }
      });
    }
  }

  void captureSubmit() async {
    // TODO linux platform rely on gnome-screenshot
    if (!await ScreenCapturer.instance.isAccessAllowed()) {
      return;
    }
    Directory directory = await getTemporaryDirectory();
    String imageName =
        'Screenshot-${DateTime.now().millisecondsSinceEpoch}.png';
    String imagePath = '${directory.path}/$imageName';
    debugPrint('imagePath: $imagePath');
    final capturedData = await ScreenCapturer.instance.capture(
      mode: CaptureMode.region,
      imagePath: imagePath,
      silent: true,
    );
    if (capturedData != null) {
      file = File(capturedData.imagePath!);
      name = imageName;
      extension = 'png';
      doRequest().then((value) {
        if (isSuccess) {
          widget.callback();
          Navigator.pop(context);
        }
      });
      // ignore: avoid_print
      // print(_lastCapturedData!.toJson());
    } else {
      // ignore: avoid_print
      print('User canceled capture');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('上传图片'),
      actions: <Widget>[
        TextButton(
          onPressed: pickSubmit,
          child:
              loading ? const CircularProgressIndicator() : const Text('选择文件'),
        ),
        TextButton(
          onPressed: captureSubmit,
          child:
              loading ? const CircularProgressIndicator() : const Text('截取屏幕'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('取消'),
        )
      ],
    );
  }

  @override
  Future<PresignedUploadFileStatusResponse> request(client, option) async {
    final token = await client.uploadImage(
        UploadImageRequest(
          fileMetadata: FileMetadata(
            name: name,
            size: $fixnum.Int64(file.lengthSync()),
            type: FileType.FILE_TYPE_CHESED_IMAGE,
          ),
          name: name,
        ),
        options: option);
    final uploadOption =
        CallOptions(metadata: {'Authorization': 'Bearer ${token.uploadToken}'});
    final url = await client.presignedUploadFile(PresignedUploadFileRequest(),
        options: uploadOption);
    final uploadResponse = await http.put(
      Uri.parse(url.uploadUrl),
      headers: {'Content-Type': 'image/$extension'},
      body: await file.readAsBytes(),
    );
    if (uploadResponse.statusCode != 200) {
      throw '文件上传失败： ${uploadResponse.reasonPhrase}';
    }
    final resp = await client.presignedUploadFileStatus(
        PresignedUploadFileStatusRequest(
          status: FileTransferStatus.FILE_TRANSFER_STATUS_SUCCESS,
        ),
        options: uploadOption);
    return resp;
  }
}
