mixin EventStatusMixin {
  EventStatus? get statusCode;
  String? get msg;

  bool get processing => statusCode == EventStatus.processing;
  bool get success => statusCode == EventStatus.success;
  bool get failed => statusCode == EventStatus.failed;
}

enum EventStatus {
  processing,
  success,
  failed,
}
