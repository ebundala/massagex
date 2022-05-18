import 'user.dart';
import 'abuse_record_type.dart';
import 'review.dart';
import 'comment.dart';
import 'business.dart';
import 'service.dart';
import 'order.dart';
import 'record_status.dart';
import 'abuse_report_status.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class AbuseReport extends Equatable {
  final String? id;
  final int? number;
  final String? report;
  final User? author;
  final String? authorId;
  final AbuseRecordType? type;
  final String? typeId;
  final User? user;
  final Review? review;
  final Comment? comment;
  final Business? business;
  final Service? service;
  final Order? order;
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
  AbuseReport(
      {this.id,
      this.number,
      this.report,
      this.author,
      this.authorId,
      this.type,
      this.typeId,
      this.user,
      this.review,
      this.comment,
      this.business,
      this.service,
      this.order,
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

  static AbuseReport fromJson(Map<dynamic, dynamic> json) {
    return AbuseReport(
      id: json['id'],
      number: json['number'],
      report: json['report'],
      author: json['author'] != null ? User.fromJson(json['author']) : null,
      authorId: json['authorId'],
      type:
          json['type'] != null ? AbuseRecordType.fromJson(json['type']) : null,
      typeId: json['typeId'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      review: json['review'] != null ? Review.fromJson(json['review']) : null,
      comment:
          json['comment'] != null ? Comment.fromJson(json['comment']) : null,
      business:
          json['business'] != null ? Business.fromJson(json['business']) : null,
      service:
          json['service'] != null ? Service.fromJson(json['service']) : null,
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
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
    if (author != null) _data['author'] = author!.toJson();
    if (authorId != null) _data['authorId'] = authorId;
    if (type != null) _data['type'] = type!.toJson();
    if (typeId != null) _data['typeId'] = typeId;
    if (user != null) _data['user'] = user!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (order != null) _data['order'] = order!.toJson();
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

  AbuseReport copyWith(
      {String? id,
      int? number,
      String? report,
      User? author,
      String? authorId,
      AbuseRecordType? type,
      String? typeId,
      User? user,
      Review? review,
      Comment? comment,
      Business? business,
      Service? service,
      Order? order,
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
    return AbuseReport(
        id: id ?? this.id,
        number: number ?? this.number,
        report: report ?? this.report,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        type: type ?? this.type,
        typeId: typeId ?? this.typeId,
        user: user ?? this.user,
        review: review ?? this.review,
        comment: comment ?? this.comment,
        business: business ?? this.business,
        service: service ?? this.service,
        order: order ?? this.order,
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
        author,
        authorId,
        type,
        typeId,
        user,
        review,
        comment,
        business,
        service,
        order,
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

extension AbuseReportExt on AbuseReport {
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

class AbuseReportController extends ValueNotifier<AbuseReport> {
  TextEditingController? idController;

  TextEditingController? numberController;

  TextEditingController? reportController;

  UserController? authorController;
  void Function(User value)? authorChanged;

  TextEditingController? authorIdController;

  AbuseRecordTypeController? typeController;
  void Function(AbuseRecordType value)? typeChanged;

  TextEditingController? typeIdController;

  UserController? userController;
  void Function(User value)? userChanged;

  ReviewController? reviewController;
  void Function(Review value)? reviewChanged;

  CommentController? commentController;
  void Function(Comment value)? commentChanged;

  BusinessController? businessController;
  void Function(Business value)? businessChanged;

  ServiceController? serviceController;
  void Function(Service value)? serviceChanged;

  OrderController? orderController;
  void Function(Order value)? orderChanged;

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

  final AbuseReport initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  AbuseReportController({
    required this.initialValue,
    required this.selectionSet,
    this.authorChanged,
    this.typeChanged,
    this.userChanged,
    this.reviewChanged,
    this.commentChanged,
    this.businessChanged,
    this.serviceChanged,
    this.orderChanged,
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
    if (isInSelectionSet('author')) {
      var selected = getSelectionNodeData('author')?.selectionSet;
      authorController = UserController(
          initialValue: initialValue.author ?? User(), selectionSet: selected!);
      authorController?.addListener(() {
        var v = authorController?.value;
        onAuthorChanged(v!);
      });
    }
    if (isInSelectionSet('authorId')) {
      authorIdController =
          TextEditingController(text: "${initialValue.authorId ?? ''}")
            ..addListener(() {
              value = value.copyWith(authorId: authorIdController?.text);
            });
    }
    if (isInSelectionSet('type')) {
      var selected = getSelectionNodeData('type')?.selectionSet;
      typeController = AbuseRecordTypeController(
          initialValue: initialValue.type ?? AbuseRecordType(),
          selectionSet: selected!);
      typeController?.addListener(() {
        var v = typeController?.value;
        onTypeChanged(v!);
      });
    }
    if (isInSelectionSet('typeId')) {
      typeIdController =
          TextEditingController(text: "${initialValue.typeId ?? ''}")
            ..addListener(() {
              value = value.copyWith(typeId: typeIdController?.text);
            });
    }
    if (isInSelectionSet('user')) {
      var selected = getSelectionNodeData('user')?.selectionSet;
      userController = UserController(
          initialValue: initialValue.user ?? User(), selectionSet: selected!);
      userController?.addListener(() {
        var v = userController?.value;
        onUserChanged(v!);
      });
    }
    if (isInSelectionSet('review')) {
      var selected = getSelectionNodeData('review')?.selectionSet;
      reviewController = ReviewController(
          initialValue: initialValue.review ?? Review(),
          selectionSet: selected!);
      reviewController?.addListener(() {
        var v = reviewController?.value;
        onReviewChanged(v!);
      });
    }
    if (isInSelectionSet('comment')) {
      var selected = getSelectionNodeData('comment')?.selectionSet;
      commentController = CommentController(
          initialValue: initialValue.comment ?? Comment(),
          selectionSet: selected!);
      commentController?.addListener(() {
        var v = commentController?.value;
        onCommentChanged(v!);
      });
    }
    if (isInSelectionSet('business')) {
      var selected = getSelectionNodeData('business')?.selectionSet;
      businessController = BusinessController(
          initialValue: initialValue.business ?? Business(),
          selectionSet: selected!);
      businessController?.addListener(() {
        var v = businessController?.value;
        onBusinessChanged(v!);
      });
    }
    if (isInSelectionSet('service')) {
      var selected = getSelectionNodeData('service')?.selectionSet;
      serviceController = ServiceController(
          initialValue: initialValue.service ?? Service(),
          selectionSet: selected!);
      serviceController?.addListener(() {
        var v = serviceController?.value;
        onServiceChanged(v!);
      });
    }
    if (isInSelectionSet('order')) {
      var selected = getSelectionNodeData('order')?.selectionSet;
      orderController = OrderController(
          initialValue: initialValue.order ?? Order(), selectionSet: selected!);
      orderController?.addListener(() {
        var v = orderController?.value;
        onOrderChanged(v!);
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
    if (isInSelectionSet('author')) {
      authorController?.dispose();
    }
    if (isInSelectionSet('authorId')) {
      authorIdController?.dispose();
    }
    if (isInSelectionSet('type')) {
      typeController?.dispose();
    }
    if (isInSelectionSet('typeId')) {
      typeIdController?.dispose();
    }
    if (isInSelectionSet('user')) {
      userController?.dispose();
    }
    if (isInSelectionSet('review')) {
      reviewController?.dispose();
    }
    if (isInSelectionSet('comment')) {
      commentController?.dispose();
    }
    if (isInSelectionSet('business')) {
      businessController?.dispose();
    }
    if (isInSelectionSet('service')) {
      serviceController?.dispose();
    }
    if (isInSelectionSet('order')) {
      orderController?.dispose();
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

  void onAuthorChanged(User v) {
    if (value.author != v) {
      value = value.copyWith(author: v);
      authorChanged?.call(v);
    }
  }

  void onTypeChanged(AbuseRecordType v) {
    if (value.type != v) {
      value = value.copyWith(type: v);
      typeChanged?.call(v);
    }
  }

  void onUserChanged(User v) {
    if (value.user != v) {
      value = value.copyWith(user: v);
      userChanged?.call(v);
    }
  }

  void onReviewChanged(Review v) {
    if (value.review != v) {
      value = value.copyWith(review: v);
      reviewChanged?.call(v);
    }
  }

  void onCommentChanged(Comment v) {
    if (value.comment != v) {
      value = value.copyWith(comment: v);
      commentChanged?.call(v);
    }
  }

  void onBusinessChanged(Business v) {
    if (value.business != v) {
      value = value.copyWith(business: v);
      businessChanged?.call(v);
    }
  }

  void onServiceChanged(Service v) {
    if (value.service != v) {
      value = value.copyWith(service: v);
      serviceChanged?.call(v);
    }
  }

  void onOrderChanged(Order v) {
    if (value.order != v) {
      value = value.copyWith(order: v);
      orderChanged?.call(v);
    }
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
