import 'user.dart';
import 'attachment.dart';
import 'record_status.dart';
import 'comment.dart';
import 'abuse_report.dart';
import 'favorite.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Review extends Equatable {
  final bool? isFavorited;
  final String? id;
  final User? author;
  final String? authorId;
  final User? reviewee;
  final String? revieweeId;
  final int? value;
  final String? content;
  final List<Attachment>? attachments;
  final RecordStatus? recordStatus;
  final List<Comment>? comments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<AbuseReport>? abuseReports;
  final List<Favorite>? favorites;
  Review(
      {this.isFavorited,
      this.id,
      this.author,
      this.authorId,
      this.reviewee,
      this.revieweeId,
      this.value,
      this.content,
      this.attachments,
      this.recordStatus,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.abuseReports,
      this.favorites});

  static Review fromJson(Map<dynamic, dynamic> json) {
    return Review(
      isFavorited: json['isFavorited'],
      id: json['id'],
      author: json['author'] != null ? User.fromJson(json['author']) : null,
      authorId: json['authorId'],
      reviewee:
          json['reviewee'] != null ? User.fromJson(json['reviewee']) : null,
      revieweeId: json['revieweeId'],
      value: json['value'],
      content: json['content'],
      attachments: json['attachments'] != null
          ? List.generate(json['attachments'].length,
              (index) => Attachment.fromJson(json['attachments'][index]))
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      comments: json['comments'] != null
          ? List.generate(json['comments'].length,
              (index) => Comment.fromJson(json['comments'][index]))
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      abuseReports: json['abuseReports'] != null
          ? List.generate(json['abuseReports'].length,
              (index) => AbuseReport.fromJson(json['abuseReports'][index]))
          : null,
      favorites: json['favorites'] != null
          ? List.generate(json['favorites'].length,
              (index) => Favorite.fromJson(json['favorites'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (isFavorited != null) _data['isFavorited'] = isFavorited;
    if (id != null) _data['id'] = id;
    if (author != null) _data['author'] = author!.toJson();
    if (authorId != null) _data['authorId'] = authorId;
    if (reviewee != null) _data['reviewee'] = reviewee!.toJson();
    if (revieweeId != null) _data['revieweeId'] = revieweeId;
    if (value != null) _data['value'] = value;
    if (content != null) _data['content'] = content;
    if (attachments != null)
      _data['attachments'] = List.generate(
          attachments?.length ?? 0, (index) => attachments![index].toJson());
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (comments != null)
      _data['comments'] = List.generate(
          comments?.length ?? 0, (index) => comments![index].toJson());
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (abuseReports != null)
      _data['abuseReports'] = List.generate(
          abuseReports?.length ?? 0, (index) => abuseReports![index].toJson());
    if (favorites != null)
      _data['favorites'] = List.generate(
          favorites?.length ?? 0, (index) => favorites![index].toJson());
    return _data;
  }

  Review copyWith(
      {bool? isFavorited,
      String? id,
      User? author,
      String? authorId,
      User? reviewee,
      String? revieweeId,
      int? value,
      String? content,
      List<Attachment>? attachments,
      RecordStatus? recordStatus,
      List<Comment>? comments,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<AbuseReport>? abuseReports,
      List<Favorite>? favorites}) {
    return Review(
        isFavorited: isFavorited ?? this.isFavorited,
        id: id ?? this.id,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        reviewee: reviewee ?? this.reviewee,
        revieweeId: revieweeId ?? this.revieweeId,
        value: value ?? this.value,
        content: content ?? this.content,
        attachments: attachments ?? this.attachments,
        recordStatus: recordStatus ?? this.recordStatus,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        isFavorited,
        id,
        author,
        authorId,
        reviewee,
        revieweeId,
        value,
        content,
        List.from(attachments ?? []),
        recordStatus,
        List.from(comments ?? []),
        createdAt,
        updatedAt,
        List.from(abuseReports ?? []),
        List.from(favorites ?? [])
      ];
}

extension ReviewExt on Review {
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

class ReviewController extends ValueNotifier<Review> {
  TextEditingController? isFavoritedController;

  TextEditingController? idController;

  UserController? authorController;
  void Function(User value)? authorChanged;

  TextEditingController? authorIdController;

  UserController? revieweeController;
  void Function(User value)? revieweeChanged;

  TextEditingController? revieweeIdController;

  TextEditingController? valueController;

  TextEditingController? contentController;

  final Map<String, Attachment> updatedAttachments = {};
  final Map<String, Attachment> deletedAttachments = {};
  void Function(Attachment value)? attachmentsChanged;
  void Function(Attachment value)? attachmentsRemoved;
  // Attachment controllers
  final Map<String, AttachmentController> attachmentsController = {};

  void Function(RecordStatus value)? recordStatusChanged;
  final Map<String, Comment> updatedComments = {};
  final Map<String, Comment> deletedComments = {};
  void Function(Comment value)? commentsChanged;
  void Function(Comment value)? commentsRemoved;
  // Comment controllers
  final Map<String, CommentController> commentsController = {};

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final Map<String, AbuseReport> updatedAbuseReports = {};
  final Map<String, AbuseReport> deletedAbuseReports = {};
  void Function(AbuseReport value)? abuseReportsChanged;
  void Function(AbuseReport value)? abuseReportsRemoved;
  // AbuseReport controllers
  final Map<String, AbuseReportController> abuseReportsController = {};

  final Map<String, Favorite> updatedFavorites = {};
  final Map<String, Favorite> deletedFavorites = {};
  void Function(Favorite value)? favoritesChanged;
  void Function(Favorite value)? favoritesRemoved;
  // Favorite controllers
  final Map<String, FavoriteController> favoritesController = {};

  final Review initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  ReviewController({
    required this.initialValue,
    required this.selectionSet,
    this.authorChanged,
    this.revieweeChanged,
    this.attachmentsChanged,
    this.attachmentsRemoved,
    this.recordStatusChanged,
    this.commentsChanged,
    this.commentsRemoved,
    this.abuseReportsChanged,
    this.abuseReportsRemoved,
    this.favoritesChanged,
    this.favoritesRemoved,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
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
    if (isInSelectionSet('reviewee')) {
      var selected = getSelectionNodeData('reviewee')?.selectionSet;
      revieweeController = UserController(
          initialValue: initialValue.reviewee ?? User(),
          selectionSet: selected!);
      revieweeController?.addListener(() {
        var v = revieweeController?.value;
        onRevieweeChanged(v!);
      });
    }
    if (isInSelectionSet('revieweeId')) {
      revieweeIdController =
          TextEditingController(text: "${initialValue.revieweeId ?? ''}")
            ..addListener(() {
              value = value.copyWith(revieweeId: revieweeIdController?.text);
            });
    }
    if (isInSelectionSet('value')) {
      valueController = TextEditingController(
          text: "${initialValue.value ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(value: int.tryParse(valueController?.text ?? ''));
        });
    }
    if (isInSelectionSet('content')) {
      contentController =
          TextEditingController(text: "${initialValue.content ?? ''}")
            ..addListener(() {
              value = value.copyWith(content: contentController?.text);
            });
    }
    if (isInSelectionSet('attachments')) {
      if (initialValue.attachments?.isNotEmpty == true) {
        var selection = getSelectionNodeData('attachments')?.selectionSet;
        attachmentsController.clear();
        var values = initialValue.attachments
            ?.map<MapEntry<String, AttachmentController>>((e) {
          var controller =
              AttachmentController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onAttachmentsChanged(controller.value);
          });
          return MapEntry<String, AttachmentController>(e.id!, controller);
        });
        attachmentsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('comments')) {
      if (initialValue.comments?.isNotEmpty == true) {
        var selection = getSelectionNodeData('comments')?.selectionSet;
        commentsController.clear();
        var values = initialValue.comments
            ?.map<MapEntry<String, CommentController>>((e) {
          var controller =
              CommentController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onCommentsChanged(controller.value);
          });
          return MapEntry<String, CommentController>(e.id!, controller);
        });
        commentsController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('abuseReports')) {
      if (initialValue.abuseReports?.isNotEmpty == true) {
        var selection = getSelectionNodeData('abuseReports')?.selectionSet;
        abuseReportsController.clear();
        var values = initialValue.abuseReports
            ?.map<MapEntry<String, AbuseReportController>>((e) {
          var controller =
              AbuseReportController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onAbuseReportsChanged(controller.value);
          });
          return MapEntry<String, AbuseReportController>(e.id!, controller);
        });
        abuseReportsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('favorites')) {
      if (initialValue.favorites?.isNotEmpty == true) {
        var selection = getSelectionNodeData('favorites')?.selectionSet;
        favoritesController.clear();
        var values = initialValue.favorites
            ?.map<MapEntry<String, FavoriteController>>((e) {
          var controller =
              FavoriteController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onFavoritesChanged(controller.value);
          });
          return MapEntry<String, FavoriteController>(e.id!, controller);
        });
        favoritesController.addEntries(values ?? Iterable.empty());
      }
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('author')) {
      authorController?.dispose();
    }
    if (isInSelectionSet('authorId')) {
      authorIdController?.dispose();
    }
    if (isInSelectionSet('reviewee')) {
      revieweeController?.dispose();
    }
    if (isInSelectionSet('revieweeId')) {
      revieweeIdController?.dispose();
    }
    if (isInSelectionSet('value')) {
      valueController?.dispose();
    }
    if (isInSelectionSet('content')) {
      contentController?.dispose();
    }
    if (isInSelectionSet('attachments')) {
      attachmentsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('comments')) {
      commentsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('abuseReports')) {
      abuseReportsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('favorites')) {
      favoritesController.values.map((v) => v.dispose()).toList();
    }

    super.dispose();
  }

  void onAuthorChanged(User v) {
    if (value.author != v) {
      value = value.copyWith(author: v);
      authorChanged?.call(v);
    }
  }

  void onRevieweeChanged(User v) {
    if (value.reviewee != v) {
      value = value.copyWith(reviewee: v);
      revieweeChanged?.call(v);
    }
  }

  void onAttachmentsChanged(Attachment v) {
    updatedAttachments[v.id!] = v;
    var i = value.attachments?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Attachment>.from(value.attachments ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("attachments")?.selectionSet;
      attachmentsController[v.id!] =
          AttachmentController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(attachments: list);

    attachmentsChanged?.call(v);
  }

  void onAttachmentsRemoved(Attachment v) {
    if (!v.isNew) {
      deletedAttachments[v.id!] = v;
    }
    updatedAttachments.remove(v.id!);
    attachmentsController.remove(v.id!);
    value = value.copyWith(
        attachments:
            value.attachments?.where((e) => e.id != v.id).toList() ?? []);

    attachmentsRemoved?.call(v);
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onCommentsChanged(Comment v) {
    updatedComments[v.id!] = v;
    var i = value.comments?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Comment>.from(value.comments ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("comments")?.selectionSet;
      commentsController[v.id!] =
          CommentController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(comments: list);

    commentsChanged?.call(v);
  }

  void onCommentsRemoved(Comment v) {
    if (!v.isNew) {
      deletedComments[v.id!] = v;
    }
    updatedComments.remove(v.id!);
    commentsController.remove(v.id!);
    value = value.copyWith(
        comments: value.comments?.where((e) => e.id != v.id).toList() ?? []);

    commentsRemoved?.call(v);
  }

  void onAbuseReportsChanged(AbuseReport v) {
    updatedAbuseReports[v.id!] = v;
    var i = value.abuseReports?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<AbuseReport>.from(value.abuseReports ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("abuseReports")?.selectionSet;
      abuseReportsController[v.id!] =
          AbuseReportController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(abuseReports: list);

    abuseReportsChanged?.call(v);
  }

  void onAbuseReportsRemoved(AbuseReport v) {
    if (!v.isNew) {
      deletedAbuseReports[v.id!] = v;
    }
    updatedAbuseReports.remove(v.id!);
    abuseReportsController.remove(v.id!);
    value = value.copyWith(
        abuseReports:
            value.abuseReports?.where((e) => e.id != v.id).toList() ?? []);

    abuseReportsRemoved?.call(v);
  }

  void onFavoritesChanged(Favorite v) {
    updatedFavorites[v.id!] = v;
    var i = value.favorites?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Favorite>.from(value.favorites ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("favorites")?.selectionSet;
      favoritesController[v.id!] =
          FavoriteController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(favorites: list);

    favoritesChanged?.call(v);
  }

  void onFavoritesRemoved(Favorite v) {
    if (!v.isNew) {
      deletedFavorites[v.id!] = v;
    }
    updatedFavorites.remove(v.id!);
    favoritesController.remove(v.id!);
    value = value.copyWith(
        favorites: value.favorites?.where((e) => e.id != v.id).toList() ?? []);

    favoritesRemoved?.call(v);
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
