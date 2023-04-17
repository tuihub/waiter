import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

import '../client/api_helper.dart';

mixin SingleRequestMixin<M extends StatefulWidget, T> on State<M> {
  bool loading = false;

  ApiResponse<T>? _response;

  ApiResponse<T> get response => _response!;

  bool get isSuccess => _response?.status == ApiStatus.success;

  bool get isError => _response?.status == ApiStatus.error;

  Future<T> request(LibrarianSephirahServiceClient client, CallOptions option) {
    throw UnimplementedError();
  }

  void callback() {}

  Future<void> doRequest(
      {Future<T> Function(
              LibrarianSephirahServiceClient client, CallOptions option)?
          request}) async {
    if (loading == true) return;
    setState(() {
      loading = true;
    });
    _response = await ApiHelper.instance.doRequest(request ?? this.request);
    callback();
    setState(() {
      loading = false;
    });
  }
}
