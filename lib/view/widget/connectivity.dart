import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/client/client.dart';

class ServerConnectivityWidget extends StatefulWidget {
  final String url;
  final VoidCallback callback;

  const ServerConnectivityWidget(
      {super.key, required this.url, required this.callback});
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

  void pingUrl() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }

    final client = clientFactory(host: widget.url);
    try {
      await client.generateToken(GenerateTokenRequest());
      status = true;
    } catch (e) {
      if (e is GrpcError && e.code == 16) {
        status = true;
      }
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
                  Text(widget.url),
                  Expanded(
                    child: SizedBox(),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: loading
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
