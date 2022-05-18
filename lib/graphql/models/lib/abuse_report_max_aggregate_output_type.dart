import 'record_status.dart';
import 'abuse_report_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class AbuseReportMaxAggregateOutputType extends Equatable {
  final String? id;
  final int? number;
  final String? report;
  final String? authorId;
  final String? typeId;
  final RecordStatus? recordStatus;
  final AbuseReportStatus? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;
  final String? reviewId;
  final String? commentId;
  final String? businessId;
  final String? serviceId;
  final String? orderId;
  AbuseReportMaxAggregateOutputType(
      {this.id,
      this.number,
      this.report,
      this.authorId,
      this.typeId,
      this.recordStatus,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId});

  static AbuseReportMaxAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportMaxAggregateOutputType(
      id: json['id'],
      number: json['number'],
      report: json['report'],
      authorId: json['authorId'],
      typeId: json['typeId'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      state: json['state'] != null
          ? AbuseReportStatusExt.fromJson(json['state'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      userId: json['userId'],
      reviewId: json['reviewId'],
      commentId: json['commentId'],
      businessId: json['businessId'],
      serviceId: json['serviceId'],
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (number != null) _data['number'] = number;
    if (report != null) _data['report'] = report;
    if (authorId != null) _data['authorId'] = authorId;
    if (typeId != null) _data['typeId'] = typeId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (userId != null) _data['userId'] = userId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (commentId != null) _data['commentId'] = commentId;
    if (businessId != null) _data['businessId'] = businessId;
    if (serviceId != null) _data['serviceId'] = serviceId;
    if (orderId != null) _data['orderId'] = orderId;
    return _data;
  }

  AbuseReportMaxAggregateOutputType copyWith(
      {String? id,
      int? number,
      String? report,
      String? authorId,
      String? typeId,
      RecordStatus? recordStatus,
      AbuseReportStatus? state,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? userId,
      String? reviewId,
      String? commentId,
      String? businessId,
      String? serviceId,
      String? orderId}) {
    return AbuseReportMaxAggregateOutputType(
        id: id ?? this.id,
        number: number ?? this.number,
        report: report ?? this.report,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        reviewId: reviewId ?? this.reviewId,
        commentId: commentId ?? this.commentId,
        businessId: businessId ?? this.businessId,
        serviceId: serviceId ?? this.serviceId,
        orderId: orderId ?? this.orderId);
  }

  List<Object?> get props => [
        id,
        number,
        report,
        authorId,
        typeId,
        recordStatus,
        state,
        createdAt,
        updatedAt,
        userId,
        reviewId,
        commentId,
        businessId,
        serviceId,
        orderId
      ];
}

extension AbuseReportMaxAggregateOutputTypeExt
    on AbuseReportMaxAggregateOutputType {
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

class AbuseReportMaxAggregateOutputTypeController
    extends ValueNotifier<AbuseReportMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? numberController;

  TextEditingController? reportController;

  TextEditingController? authorIdController;

  TextEditingController? typeIdController;

  void Function(RecordStatus value)? recordStatusChanged;
  void Function(AbuseReportStatus value)? stateChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? userIdController;

  TextEditingController? reviewIdController;

  TextEditingController? commentIdController;

  TextEditingController? businessIdController;

  TextEditingController? serviceIdController;

  TextEditingController? orderIdController;

  final AbuseReportMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  AbuseReportMaxAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.stateChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('number')) {
      numberController =
          TextEditingController(text: "${initialValue.number ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  number: int.tryParse(numberController?.text ?? ''));
            });
    }
    if (isInSelectionSet('report')) {
      reportController =
          TextEditingController(text: "${initialValue.report ?? ''}")
            ..addListener(() {
              value = value.copyWith(report: reportController?.text);
            });
    }
    if (isInSelectionSet('authorId')) {
      authorIdController =
          TextEditingController(text: "${initialValue.authorId ?? ''}")
            ..addListener(() {
              value = value.copyWith(authorId: authorIdController?.text);
            });
    }
    if (isInSelectionSet('typeId')) {
      typeIdController =
          TextEditingController(text: "${initialValue.typeId ?? ''}")
            ..addListener(() {
              value = value.copyWith(typeId: typeIdController?.text);
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
    if (isInSelectionSet('userId')) {
      userIdController =
          TextEditingController(text: "${initialValue.userId ?? ''}")
            ..addListener(() {
              value = value.copyWith(userId: userIdController?.text);
            });
    }
    if (isInSelectionSet('reviewId')) {
      reviewIdController =
          TextEditingController(text: "${initialValue.reviewId ?? ''}")
            ..addListener(() {
              value = value.copyWith(reviewId: reviewIdController?.text);
            });
    }
    if (isInSelectionSet('commentId')) {
      commentIdController =
          TextEditingController(text: "${initialValue.commentId ?? ''}")
            ..addListener(() {
              value = value.copyWith(commentId: commentIdController?.text);
            });
    }
    if (isInSelectionSet('businessId')) {
      businessIdController =
          TextEditingController(text: "${initialValue.businessId ?? ''}")
            ..addListener(() {
              value = value.copyWith(businessId: businessIdController?.text);
            });
    }
    if (isInSelectionSet('serviceId')) {
      serviceIdController =
          TextEditingController(text: "${initialValue.serviceId ?? ''}")
            ..addListener(() {
              value = value.copyWith(serviceId: serviceIdController?.text);
            });
    }
    if (isInSelectionSet('orderId')) {
      orderIdController =
          TextEditingController(text: "${initialValue.orderId ?? ''}")
            ..addListener(() {
              value = value.copyWith(orderId: orderIdController?.text);
            });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('number')) {
      numberController?.dispose();
    }
    if (isInSelectionSet('report')) {
      reportController?.dispose();
    }
    if (isInSelectionSet('authorId')) {
      authorIdController?.dispose();
    }
    if (isInSelectionSet('typeId')) {
      typeIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('userId')) {
      userIdController?.dispose();
    }
    if (isInSelectionSet('reviewId')) {
      reviewIdController?.dispose();
    }
    if (isInSelectionSet('commentId')) {
      commentIdController?.dispose();
    }
    if (isInSelectionSet('businessId')) {
      businessIdController?.dispose();
    }
    if (isInSelectionSet('serviceId')) {
      serviceIdController?.dispose();
    }
    if (isInSelectionSet('orderId')) {
      orderIdController?.dispose();
    }

    super.dispose();
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onStateChanged(AbuseReportStatus v) {
    if (value.state != v) {
      value = value.copyWith(state: v);
      stateChanged?.call(v);
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
