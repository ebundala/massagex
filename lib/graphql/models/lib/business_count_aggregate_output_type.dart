import "package:equatable/equatable.dart";

class BusinessCountAggregateOutputType extends Equatable {
  final int? id;
  final int? ownerId;
  final int? mode;
  final int? coverId;
  final int? about;
  final int? businessName;
  final int? metadata;
  final int? status;
  final int? recordStatus;
  final int? locationId;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  BusinessCountAggregateOutputType(
      {this.id,
      this.ownerId,
      this.mode,
      this.coverId,
      this.about,
      this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.locationId,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static BusinessCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return BusinessCountAggregateOutputType(
      id: json['id'],
      ownerId: json['ownerId'],
      mode: json['mode'],
      coverId: json['coverId'],
      about: json['about'],
      businessName: json['businessName'],
      metadata: json['metadata'],
      status: json['status'],
      recordStatus: json['recordStatus'],
      locationId: json['locationId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (ownerId != null) _data['ownerId'] = ownerId;
    if (mode != null) _data['mode'] = mode;
    if (coverId != null) _data['coverId'] = coverId;
    if (about != null) _data['about'] = about;
    if (businessName != null) _data['businessName'] = businessName;
    if (metadata != null) _data['metadata'] = metadata;
    if (status != null) _data['status'] = status;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (locationId != null) _data['locationId'] = locationId;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  BusinessCountAggregateOutputType copyWith(
      {int? id,
      int? ownerId,
      int? mode,
      int? coverId,
      int? about,
      int? businessName,
      int? metadata,
      int? status,
      int? recordStatus,
      int? locationId,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return BusinessCountAggregateOutputType(
        id: id ?? this.id,
        ownerId: ownerId ?? this.ownerId,
        mode: mode ?? this.mode,
        coverId: coverId ?? this.coverId,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        locationId: locationId ?? this.locationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        ownerId,
        mode,
        coverId,
        about,
        businessName,
        metadata,
        status,
        recordStatus,
        locationId,
        createdAt,
        updatedAt,
        $all
      ];
}
