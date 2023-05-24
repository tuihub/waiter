import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/client/client.dart';

import '../../common/const/string.dart';

class ServerConnectivityWidget extends StatefulWidget {
  final ServerConfig config;
  final VoidCallback callback;

  const ServerConnectivityWidget(
      {super.key, required this.config, required this.callback});
  @override
  State<ServerConnectivityWidget> createState() =>
      _ServerConnectivityWidgetState();
}

class _ServerConnectivityWidgetState extends State<ServerConnectivityWidget> {
  @override
  void initState() {
    pingUrl();
    super.initState();
  }

  bool loading = true;
  bool status = false;
  bool check = false;
  int deTime = 0;
  int reTime = 0;

  void pingUrl() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }

    final client = clientFactory(config: widget.config);
    try {
      final startTime = DateTime.now();
      final response =
          await client.getServerInformation(GetServerInformationRequest());
      final endTime = DateTime.now();
      status = true;
      final arriveTime = response.currentTime.toDateTime();
      debugPrint("startTime: $startTime, arriveTime: $arriveTime, endTime: $endTime");
      deTime =  arriveTime.difference(startTime).inMilliseconds;
      reTime = endTime.difference(arriveTime).inMilliseconds;
    } catch (e) {
      debugPrint(e.toString());
      status = false;
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  Color getStatusColor() {
    if (status) {
      return Colors.green;
    }
    if (loading) {
      return Colors.grey;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 40,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              widget.callback();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(widget.config.host),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    status ? "↑ ${deTime}ms  ↓ ${reTime}ms" : "",
                    style: TextStyle(
                      color: getStatusColor(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  loading
                      ? SizedBox(
                          height: 14,
                          width: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: getStatusColor(),
                          ),
                          height: 14,
                          width: 14,
                          child: loading
                              ? const CircularProgressIndicator()
                              : Center(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(28),
                                    onTap: () => pingUrl(),
                                  ),
                                ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
