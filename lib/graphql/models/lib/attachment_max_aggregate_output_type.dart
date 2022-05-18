import 'record_status.dart';
import 'attachment_type.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class AttachmentMaxAggregateOutputType extends Equatable {
  final String? id;
  final String? path;
  final String? filename;
  final String? mimetype;
  final String? encoding;
  final RecordStatus? recordStatus;
  final int? duration;
  final int? size;
  final AttachmentType? attachmentType;
  final bool? downloadable;
  final String? placement;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? commentId;
  final String? helpStepId;
  final String? reviewId;
  final String? userId;
  final String? businessId;
  AttachmentMaxAggregateOutputType(
      {this.id,
      this.path,
      this.filename,
      this.mimetype,
      this.encoding,
      this.recordStatus,
      this.duration,
      this.size,
      this.attachmentType,
      this.downloadable,
      this.placement,
      this.createdAt,
      this.updatedAt,
      this.commentId,
      this.helpStepId,
      this.reviewId,
      this.userId,
      this.businessId});

  static AttachmentMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return AttachmentMaxAggregateOutputType(
      id: json['id'],
      path: json['path'],
      filename: json['filename'],
      mimetype: json['mimetype'],
      encoding: json['encoding'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      duration: json['duration'],
      size: json['size'],
      attachmentType: json['attachmentType'] != null
          ? AttachmentTypeExt.fromJson(json['attachmentType'])
          : null,
      downloadable: json['downloadable'],
      placement: json['placement'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      commentId: json['commentId'],
      helpStepId: json['helpStepId'],
      reviewId: json['reviewId'],
      userId: json['userId'],
      businessId: json['businessId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (path != null) _data['path'] = path;
    if (filename != null) _data['filename'] = filename;
    if (mimetype != null) _data['mimetype'] = mimetype;
    if (encoding != null) _data['encoding'] = encoding;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (duration != null) _data['duration'] = duration;
    if (size != null) _data['size'] = size;
    if (attachmentType != null)
      _data['attachmentType'] = attachmentType!.toJson();
    if (downloadable != null) _data['downloadable'] = downloadable;
    if (placement != null) _data['placement'] = placement;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (commentId != null) _data['commentId'] = commentId;
    if (helpStepId != null) _data['helpStepId'] = helpStepId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (userId != null) _data['userId'] = userId;
    if (businessId != null) _data['businessId'] = businessId;
    return _data;
  }

  AttachmentMaxAggregateOutputType copyWith(
      {String? id,
      String? path,
      String? filename,
      String? mimetype,
      String? encoding,
      RecordStatus? recordStatus,
      int? duration,
      int? size,
      AttachmentType? attachmentType,
      bool? downloadable,
      String? placement,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? commentId,
      String? helpStepId,
      String? reviewId,
      String? userId,
      String? businessId}) {
    return AttachmentMaxAggregateOutputType(
        id: id ?? this.id,
        path: path ?? this.path,
        filename: filename ?? this.filename,
        mimetype: mimetype ?? this.mimetype,
        encoding: encoding ?? this.encoding,
        recordStatus: recordStatus ?? this.recordStatus,
        duration: duration ?? this.duration,
        size: size ?? this.size,
        attachmentType: attachmentType ?? this.attachmentType,
        downloadable: downloadable ?? this.downloadable,
        placement: placement ?? this.placement,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId,
        helpStepId: helpStepId ?? this.helpStepId,
        reviewId: reviewId ?? this.reviewId,
        userId: userId ?? this.userId,
        businessId: businessId ?? this.businessId);
  }

  List<Object?> get props => [
        id,
        path,
        filename,
        mimetype,
        encoding,
        recordStatus,
        duration,
        size,
        attachmentType,
        downloadable,
        placement,
        createdAt,
        updatedAt,
        commentId,
        helpStepId,
        reviewId,
        userId,
        businessId
      ];
}

extension AttachmentMaxAggregateOutputTypeExt
    on AttachmentMaxAggregateOutputType {
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

class AttachmentMaxAggregateOutputTypeController
    extends ValueNotifier<AttachmentMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? pathController;

  TextEditingController? filenameController;

  TextEditingController? mimetypeController;

  TextEditingController? encodingController;

  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? durationController;

  TextEditingController? sizeController;

  void Function(AttachmentType value)? attachmentTypeChanged;
  TextEditingController? downloadableController;

  TextEditingController? placementController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? commentIdController;

  TextEditingController? helpStepIdController;

  TextEditingController? reviewIdController;

  TextEditingController? userIdController;

  TextEditingController? businessIdController;

  final AttachmentMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  AttachmentMaxAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.attachmentTypeChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('path')) {
      pathController = TextEditingController(text: "${initialValue.path ?? ''}")
        ..addListener(() {
          value = value.copyWith(path: pathController?.text);
        });
    }
    if (isInSelectionSet('filename')) {
      filenameController =
          TextEditingController(text: "${initialValue.filename ?? ''}")
            ..addListener(() {
              value = value.copyWith(filename: filenameController?.text);
            });
    }
    if (isInSelectionSet('mimetype')) {
      mimetypeController =
          TextEditingController(text: "${initialValue.mimetype ?? ''}")
            ..addListener(() {
              value = value.copyWith(mimetype: mimetypeController?.text);
            });
    }
    if (isInSelectionSet('encoding')) {
      encodingController =
          TextEditingController(text: "${initialValue.encoding ?? ''}")
            ..addListener(() {
              value = value.copyWith(encoding: encodingController?.text);
            });
    }
    if (isInSelectionSet('duration')) {
      durationController =
          TextEditingController(text: "${initialValue.duration ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  duration: int.tryParse(durationController?.text ?? ''));
            });
    }
    if (isInSelectionSet('size')) {
      sizeController = TextEditingController(text: "${initialValue.size ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(size: int.tryParse(sizeController?.text ?? ''));
        });
    }
    if (isInSelectionSet('placement')) {
      placementController =
          TextEditingController(text: "${initialValue.placement ?? ''}")
            ..addListener(() {
              value = value.copyWith(placement: placementController?.text);
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
    if (isInSelectionSet('commentId')) {
      commentIdController =
          TextEditingController(text: "${initialValue.commentId ?? ''}")
            ..addListener(() {
              value = value.copyWith(commentId: commentIdController?.text);
            });
    }
    if (isInSelectionSet('helpStepId')) {
      helpStepIdController =
          TextEditingController(text: "${initialValue.helpStepId ?? ''}")
            ..addListener(() {
              value = value.copyWith(helpStepId: helpStepIdController?.text);
            });
    }
    if (isInSelectionSet('reviewId')) {
      reviewIdController =
          TextEditingController(text: "${initialValue.reviewId ?? ''}")
            ..addListener(() {
              value = value.copyWith(reviewId: reviewIdController?.text);
            });
    }
    if (isInSelectionSet('userId')) {
      userIdController =
          TextEditingController(text: "${initialValue.userId ?? ''}")
            ..addListener(() {
              value = value.copyWith(userId: userIdController?.text);
            });
    }
    if (isInSelectionSet('businessId')) {
      businessIdController =
          TextEditingController(text: "${initialValue.businessId ?? ''}")
            ..addListener(() {
              value = value.copyWith(businessId: businessIdController?.text);
            });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('path')) {
      pathController?.dispose();
    }
    if (isInSelectionSet('filename')) {
      filenameController?.dispose();
    }
    if (isInSelectionSet('mimetype')) {
      mimetypeController?.dispose();
    }
    if (isInSelectionSet('encoding')) {
      encodingController?.dispose();
    }
    if (isInSelectionSet('duration')) {
      durationController?.dispose();
    }
    if (isInSelectionSet('size')) {
      sizeController?.dispose();
    }
    if (isInSelectionSet('placement')) {
      placementController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('commentId')) {
      commentIdController?.dispose();
    }
    if (isInSelectionSet('helpStepId')) {
      helpStepIdController?.dispose();
    }
    if (isInSelectionSet('reviewId')) {
      reviewIdController?.dispose();
    }
    if (isInSelectionSet('userId')) {
      userIdController?.dispose();
    }
    if (isInSelectionSet('businessId')) {
      businessIdController?.dispose();
    }

    super.dispose();
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onAttachmentTypeChanged(AttachmentType v) {
    if (value.attachmentType != v) {
      value = value.copyWith(attachmentType: v);
      attachmentTypeChanged?.call(v);
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
