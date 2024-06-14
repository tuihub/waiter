import 'package:tuihub_protos/librarian/sephirah/v1/netzach.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

class NotifyFlowSourceModel {
  NotifyFlowSourceModel({
    required this.feedConfigId,
    required this.filter,
  });

  InternalID feedConfigId;
  NotifyFilterModel filter;

  static NotifyFlowSourceModel fromProto(NotifyFlowSource proto) {
    return NotifyFlowSourceModel(
      feedConfigId: proto.feedConfigId,
      filter: NotifyFilterModel.fromProto(proto.filter),
    );
  }

  NotifyFlowSource toProto() {
    return NotifyFlowSource(
      feedConfigId: feedConfigId,
      filter: filter.toProto(),
    );
  }
}

class NotifyFlowTargetModel {
  NotifyFlowTargetModel({
    required this.targetId,
    required this.channelId,
    required this.filter,
  });

  InternalID targetId;
  String channelId;
  NotifyFilterModel filter;

  static NotifyFlowTargetModel fromProto(NotifyFlowTarget proto) {
    return NotifyFlowTargetModel(
      targetId: proto.targetId,
      channelId: proto.channelId,
      filter: NotifyFilterModel.fromProto(proto.filter),
    );
  }

  NotifyFlowTarget toProto() {
    return NotifyFlowTarget(
      targetId: targetId,
      channelId: channelId,
      filter: filter.toProto(),
    );
  }
}

class NotifyFilterModel {
  NotifyFilterModel({
    required this.excludeKeywords,
    required this.includeKeywords,
    this.extraExcludeKeywords,
    this.extraIncludeKeywords,
  });

  List<String> excludeKeywords;
  List<String>? extraExcludeKeywords;
  List<String> includeKeywords;
  List<String>? extraIncludeKeywords;

  static NotifyFilterModel fromProto(NotifyFilter proto) {
    return NotifyFilterModel(
      excludeKeywords: proto.excludeKeywords,
      includeKeywords: proto.includeKeywords,
    );
  }

  NotifyFilter toProto() {
    return NotifyFilter(
      excludeKeywords: excludeKeywords + (extraExcludeKeywords ?? []),
      includeKeywords: includeKeywords + (extraIncludeKeywords ?? []),
    );
  }
}
