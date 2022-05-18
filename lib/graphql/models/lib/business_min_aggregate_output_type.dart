import 'business_mode.dart';
import 'business_status.dart';
import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class BusinessMinAggregateOutputType extends Equatable {
  final String? id;
  final String? ownerId;
  final BusinessMode? mode;
  final String? coverId;
  final String? about;
  final String? businessName;
  final BusinessStatus? status;
  final RecordStatus? recordStatus;
  final String? locationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  BusinessMinAggregateOutputType(
      {this.id,
      this.ownerId,
      this.mode,
      this.coverId,
      this.about,
      this.businessName,
      this.status,
      this.recordStatus,
      this.locationId,
      this.createdAt,
      this.updatedAt});

  static BusinessMinAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return BusinessMinAggregateOutputType(
      id: json['id'],
      ownerId: json['ownerId'],
      mode:
          json['mode'] != null ? BusinessModeExt.fromJson(json['mode']) : null,
      coverId: json['coverId'],
      about: json['about'],
      businessName: json['businessName'],
      status: json['status'] != null
          ? BusinessStatusExt.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      locationId: json['locationId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (ownerId != null) _data['ownerId'] = ownerId;
    if (mode != null) _data['mode'] = mode!.toJson();
    if (coverId != null) _data['coverId'] = coverId;
    if (about != null) _data['about'] = about;
    if (businessName != null) _data['businessName'] = businessName;
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (locationId != null) _data['locationId'] = locationId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  BusinessMinAggregateOutputType copyWith(
      {String? id,
      String? ownerId,
      BusinessMode? mode,
      String? coverId,
      String? about,
      String? businessName,
      BusinessStatus? status,
      RecordStatus? recordStatus,
      String? locationId,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return BusinessMinAggregateOutputType(
        id: id ?? this.id,
        ownerId: ownerId ?? this.ownerId,
        mode: mode ?? this.mode,
        coverId: coverId ?? this.coverId,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        locationId: locationId ?? this.locationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        ownerId,
        mode,
        coverId,
        about,
        businessName,
        status,
        recordStatus,
        locationId,
        createdAt,
        updatedAt
      ];
}

extension BusinessMinAggregateOutputTypeExt on BusinessMinAggregateOutputType {
  bool get isInitialized {
    return isNew || isSaved;
  }

  bool get isSaved {
    return id?.isNotEmpty == true && id?.contains("new") != true;
  }

  bool get isNew {
    return id?.isNotEmpty == true && id?.contains("new") == true;
  }
}

class BusinessMinAggregateOutputTypeController
    extends ValueNotifier<BusinessMinAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? ownerIdController;

  void Function(BusinessMode value)? modeChanged;
  TextEditingController? coverIdController;

  TextEditingController? aboutController;

  TextEditingController? businessNameController;

  void Function(BusinessStatus value)? statusChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? locationIdController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final BusinessMinAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  BusinessMinAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.modeChanged,
    this.statusChanged,
    this.recordStatusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('ownerId')) {
      ownerIdController =
          TextEditingController(text: "${initialValue.ownerId ?? ''}")
            ..addListener(() {
              value = value.copyWith(ownerId: ownerIdController?.text);
            });
    }
    if (isInSelectionSet('coverId')) {
      coverIdController =
          TextEditingController(text: "${initialValue.coverId ?? ''}")
            ..addListener(() {
              value = value.copyWith(coverId: coverIdController?.text);
            });
    }
    if (isInSelectionSet('about')) {
      aboutController =
          TextEditingController(text: "${initialValue.about ?? ''}")
            ..addListener(() {
              value = value.copyWith(about: aboutController?.text);
            });
    }
    if (isInSelectionSet('businessName')) {
      businessNameController =
          TextEditingController(text: "${initialValue.businessName ?? ''}")
            ..addListener(() {
              value =
                  value.copyWith(businessName: businessNameController?.text);
            });
    }
    if (isInSelectionSet('locationId')) {
      locationIdController =
          TextEditingController(text: "${initialValue.locationId ?? ''}")
            ..addListener(() {
              value = value.copyWith(locationId: locationIdController?.text);
            });
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController = TextEditingController(
          text: "${initialValue.createdAt ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              createdAt: DateTime.tryParse(createdAtController?.text ?? ''));
        });
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController = TextEditingController(
          text: "${initialValue.updatedAt ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              updatedAt: DateTime.tryParse(updatedAtController?.text ?? ''));
        });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('ownerId')) {
      ownerIdController?.dispose();
    }
    if (isInSelectionSet('coverId')) {
      coverIdController?.dispose();
    }
    if (isInSelectionSet('about')) {
      aboutController?.dispose();
    }
    if (isInSelectionSet('businessName')) {
      businessNameController?.dispose();
    }
    if (isInSelectionSet('locationId')) {
      locationIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onModeChanged(BusinessMode v) {
    if (value.mode != v) {
      value = value.copyWith(mode: v);
      modeChanged?.call(v);
    }
  }

  void onStatusChanged(BusinessStatus v) {
    if (value.status != v) {
      value = value.copyWith(status: v);
      statusChanged?.call(v);
    }
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  bool isInSelectionSet(String field) {
    return selections.containsKey(field);
  }

  SelectionNodeData? getSelectionNodeData(String field) {
    return selections[field];
  }

  Map<String, SelectionNodeData> initSelectionData() {
    var sel = selectionSet.selections;
    sel.forEach((el) {
      var e = el as FieldNode;
      selections[e.name.value] =
          SelectionNodeData(selected: true, selectionSet: e.selectionSet);
    });
    return selections;
  }
}
