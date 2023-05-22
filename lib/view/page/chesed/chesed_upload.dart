import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/base.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/binah.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/chesed.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:http/http.dart' as http;

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

  void submit() {
    doRequest().then((value) {
      if (isSuccess) {
        widget.callback();
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('上传图片'),
      actions: <Widget>[
        TextButton(
          onPressed: submit,
          child: loading ? const CircularProgressIndicator() : const Text('选择文件'),
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
    final pickResult = await file_picker.FilePicker.platform.pickFiles(type: file_picker.FileType.image);
    late PresignedUploadFileStatusResponse res;
    if (pickResult != null) {
      final pick = pickResult.files.first;
      final token = await client.uploadImage(UploadImageRequest(
        fileMetadata: FileMetadata(
          name: pick.name,
          size: $fixnum.Int64(pick.size),
          type: FileType.FILE_TYPE_CHESED_IMAGE,
        ),
        name: pick.name,
      ), options: option);
      final uploadOption = CallOptions(metadata: {
        'Authorization': 'Bearer ${token.uploadToken}'
      });
      final file = File(pick.path!); // TODO not compatible with web
      final url = await client.presignedUploadFile(PresignedUploadFileRequest(), options: uploadOption);
      final uploadResponse = await http.put(
          Uri.parse(url.uploadUrl),
          headers: {'Content-Type': 'image/${pick.extension}'},
          body: await file.readAsBytes(),
      );
      if (uploadResponse.statusCode != 200) {
        throw '文件上传失败： ${uploadResponse.reasonPhrase}';
      }
      final resp = await client.presignedUploadFileStatus(PresignedUploadFileStatusRequest(
        status: FileTransferStatus.FILE_TRANSFER_STATUS_SUCCESS,
      ), options: uploadOption);
      res = resp;
    }
    return res;
  }
}
