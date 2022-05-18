import "package:equatable/equatable.dart";

class DeviceCountAggregateOutputType extends Equatable {
  final int? id;
  final int? fcm$id;
  final int? type;
  final int? userId;
  final int? recordStatus;
  final int? $all;
  DeviceCountAggregateOutputType(
      {this.id,
      this.fcm$id,
      this.type,
      this.userId,
      this.recordStatus,
      this.$all});

  static DeviceCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return DeviceCountAggregateOutputType(
      id: json['id'],
      fcm$id: json['fcm_id'],
      type: json['type'],
      userId: json['userId'],
      recordStatus: json['recordStatus'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (fcm$id != null) _data['fcm_id'] = fcm$id;
    if (type != null) _data['type'] = type;
    if (userId != null) _data['userId'] = userId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  DeviceCountAggregateOutputType copyWith(
      {int? id,
      int? fcm$id,
      int? type,
      int? userId,
      int? recordStatus,
      int? $all}) {
    return DeviceCountAggregateOutputType(
        id: id ?? this.id,
        fcm$id: fcm$id ?? this.fcm$id,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        recordStatus: recordStatus ?? this.recordStatus,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [id, fcm$id, type, userId, recordStatus, $all];
}
