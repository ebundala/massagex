import 'record_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class LocationMaxAggregateOutputType extends Equatable {
  final String? id;
  final String? name;
  final double? lat;
  final double? lon;
  final double? heading;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  LocationMaxAggregateOutputType(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.heading,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static LocationMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return LocationMaxAggregateOutputType(
      id: json['id'],
      name: json['name'],
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
      heading: json['heading']?.toDouble(),
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (lat != null) _data['lat'] = lat;
    if (lon != null) _data['lon'] = lon;
    if (heading != null) _data['heading'] = heading;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  LocationMaxAggregateOutputType copyWith(
      {String? id,
      String? name,
      double? lat,
      double? lon,
      double? heading,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return LocationMaxAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        heading: heading ?? this.heading,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, name, lat, lon, heading, recordStatus, createdAt, updatedAt];
}

extension LocationMaxAggregateOutputTypeExt on LocationMaxAggregateOutputType {
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

class LocationMaxAggregateOutputTypeController
    extends ValueNotifier<LocationMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? nameController;

  TextEditingController? latController;

  TextEditingController? lonController;

  TextEditingController? headingController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final LocationMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  LocationMaxAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('name')) {
      nameController = TextEditingController(text: "${initialValue.name ?? ''}")
        ..addListener(() {
          value = value.copyWith(name: nameController?.text);
        });
    }
    if (isInSelectionSet('lat')) {
      latController = TextEditingController(text: "${initialValue.lat ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(lat: double.tryParse(latController?.text ?? ''));
        });
    }
    if (isInSelectionSet('lon')) {
      lonController = TextEditingController(text: "${initialValue.lon ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(lon: double.tryParse(lonController?.text ?? ''));
        });
    }
    if (isInSelectionSet('heading')) {
      headingController =
          TextEditingController(text: "${initialValue.heading ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  heading: double.tryParse(headingController?.text ?? ''));
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
    if (isInSelectionSet('name')) {
      nameController?.dispose();
    }
    if (isInSelectionSet('lat')) {
      latController?.dispose();
    }
    if (isInSelectionSet('lon')) {
      lonController?.dispose();
    }
    if (isInSelectionSet('heading')) {
      headingController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
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
