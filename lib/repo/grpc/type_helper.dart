import 'package:fixnum/fixnum.dart';
import 'package:tuihub_protos/google/protobuf/duration.pb.dart' as duration_pb;
import 'package:tuihub_protos/google/protobuf/timestamp.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

duration_pb.Duration toPBDuration(Duration duration) {
  return duration_pb.Duration(seconds: Int64(duration.inSeconds));
}

TimeRange toPBTimeRange(DateTime start, DateTime end) {
  return TimeRange()
    ..startTime = Timestamp.fromDateTime(start)
    ..duration = toPBDuration(end.difference(start));
}

Duration fromPBDuration(duration_pb.Duration duration) {
  return Duration(seconds: duration.seconds.toInt());
}
