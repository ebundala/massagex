import 'attachment.dart';
import 'role.dart';
import 'record_status.dart';
import 'account_status.dart';
import 'gender.dart';
import 'business.dart';
import 'scalars/json_object.dart';
import 'device.dart';
import 'order.dart';
import 'review.dart';
import 'comment.dart';
import 'location.dart';
import 'abuse_report.dart';
import 'favorite.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class User extends Equatable {
  final DateTime? lastSeen;
  final String? id;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final bool? emailVerified;
  final bool? disabled;
  final Attachment? avator;
  final String? avatorId;
  final Role? role;
  final RecordStatus? recordStatus;
  final AccountStatus? state;
  final Gender? gender;
  final Business? businessProfile;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Device? device;
  final List<Order>? ordered;
  final List<Review>? reviews;
  final List<Review>? reviewed;
  final List<Comment>? comments;
  final Location? location;
  final String? locationId;
  final List<AbuseReport>? abuseReports;
  final List<Favorite>? favorites;
  final List<AbuseReport>? abuseReported;
  final List<Favorite>? favorited;
  User(
      {this.lastSeen,
      this.id,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.dateOfBirth,
      this.emailVerified,
      this.disabled,
      this.avator,
      this.avatorId,
      this.role,
      this.recordStatus,
      this.state,
      this.gender,
      this.businessProfile,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.device,
      this.ordered,
      this.reviews,
      this.reviewed,
      this.comments,
      this.location,
      this.locationId,
      this.abuseReports,
      this.favorites,
      this.abuseReported,
      this.favorited});

  static User fromJson(Map<dynamic, dynamic> json) {
    return User(
      lastSeen:
          json['lastSeen'] != null ? DateTime.parse(json['lastSeen']) : null,
      id: json['id'],
      email: json['email'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'],
      disabled: json['disabled'],
      avator:
          json['avator'] != null ? Attachment.fromJson(json['avator']) : null,
      avatorId: json['avatorId'],
      role: json['role'] != null ? RoleExt.fromJson(json['role']) : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      state: json['state'] != null
          ? AccountStatusExt.fromJson(json['state'])
          : null,
      gender:
          json['gender'] != null ? GenderExt.fromJson(json['gender']) : null,
      businessProfile: json['businessProfile'] != null
          ? Business.fromJson(json['businessProfile'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      device: json['device'] != null ? Device.fromJson(json['device']) : null,
      ordered: json['ordered'] != null
          ? List.generate(json['ordered'].length,
              (index) => Order.fromJson(json['ordered'][index]))
          : null,
      reviews: json['reviews'] != null
          ? List.generate(json['reviews'].length,
              (index) => Review.fromJson(json['reviews'][index]))
          : null,
      reviewed: json['reviewed'] != null
          ? List.generate(json['reviewed'].length,
              (index) => Review.fromJson(json['reviewed'][index]))
          : null,
      comments: json['comments'] != null
          ? List.generate(json['comments'].length,
              (index) => Comment.fromJson(json['comments'][index]))
          : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      locationId: json['locationId'],
      abuseReports: json['abuseReports'] != null
          ? List.generate(json['abuseReports'].length,
              (index) => AbuseReport.fromJson(json['abuseReports'][index]))
          : null,
      favorites: json['favorites'] != null
          ? List.generate(json['favorites'].length,
              (index) => Favorite.fromJson(json['favorites'][index]))
          : null,
      abuseReported: json['abuseReported'] != null
          ? List.generate(json['abuseReported'].length,
              (index) => AbuseReport.fromJson(json['abuseReported'][index]))
          : null,
      favorited: json['favorited'] != null
          ? List.generate(json['favorited'].length,
              (index) => Favorite.fromJson(json['favorited'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (lastSeen != null) _data['lastSeen'] = lastSeen!.toString();
    if (id != null) _data['id'] = id;
    if (email != null) _data['email'] = email;
    if (displayName != null) _data['displayName'] = displayName;
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber;
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toString();
    if (emailVerified != null) _data['emailVerified'] = emailVerified;
    if (disabled != null) _data['disabled'] = disabled;
    if (avator != null) _data['avator'] = avator!.toJson();
    if (avatorId != null) _data['avatorId'] = avatorId;
    if (role != null) _data['role'] = role!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (businessProfile != null)
      _data['businessProfile'] = businessProfile!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (device != null) _data['device'] = device!.toJson();
    if (ordered != null)
      _data['ordered'] = List.generate(
          ordered?.length ?? 0, (index) => ordered![index].toJson());
    if (reviews != null)
      _data['reviews'] = List.generate(
          reviews?.length ?? 0, (index) => reviews![index].toJson());
    if (reviewed != null)
      _data['reviewed'] = List.generate(
          reviewed?.length ?? 0, (index) => reviewed![index].toJson());
    if (comments != null)
      _data['comments'] = List.generate(
          comments?.length ?? 0, (index) => comments![index].toJson());
    if (location != null) _data['location'] = location!.toJson();
    if (locationId != null) _data['locationId'] = locationId;
    if (abuseReports != null)
      _data['abuseReports'] = List.generate(
          abuseReports?.length ?? 0, (index) => abuseReports![index].toJson());
    if (favorites != null)
      _data['favorites'] = List.generate(
          favorites?.length ?? 0, (index) => favorites![index].toJson());
    if (abuseReported != null)
      _data['abuseReported'] = List.generate(abuseReported?.length ?? 0,
          (index) => abuseReported![index].toJson());
    if (favorited != null)
      _data['favorited'] = List.generate(
          favorited?.length ?? 0, (index) => favorited![index].toJson());
    return _data;
  }

  User copyWith(
      {DateTime? lastSeen,
      String? id,
      String? email,
      String? displayName,
      String? phoneNumber,
      DateTime? dateOfBirth,
      bool? emailVerified,
      bool? disabled,
      Attachment? avator,
      String? avatorId,
      Role? role,
      RecordStatus? recordStatus,
      AccountStatus? state,
      Gender? gender,
      Business? businessProfile,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      Device? device,
      List<Order>? ordered,
      List<Review>? reviews,
      List<Review>? reviewed,
      List<Comment>? comments,
      Location? location,
      String? locationId,
      List<AbuseReport>? abuseReports,
      List<Favorite>? favorites,
      List<AbuseReport>? abuseReported,
      List<Favorite>? favorited}) {
    return User(
        lastSeen: lastSeen ?? this.lastSeen,
        id: id ?? this.id,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerified: emailVerified ?? this.emailVerified,
        disabled: disabled ?? this.disabled,
        avator: avator ?? this.avator,
        avatorId: avatorId ?? this.avatorId,
        role: role ?? this.role,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        gender: gender ?? this.gender,
        businessProfile: businessProfile ?? this.businessProfile,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        device: device ?? this.device,
        ordered: ordered ?? this.ordered,
        reviews: reviews ?? this.reviews,
        reviewed: reviewed ?? this.reviewed,
        comments: comments ?? this.comments,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites,
        abuseReported: abuseReported ?? this.abuseReported,
        favorited: favorited ?? this.favorited);
  }

  List<Object?> get props => [
        lastSeen,
        id,
        email,
        displayName,
        phoneNumber,
        dateOfBirth,
        emailVerified,
        disabled,
        avator,
        avatorId,
        role,
        recordStatus,
        state,
        gender,
        businessProfile,
        metadata,
        createdAt,
        updatedAt,
        device,
        List.from(ordered ?? []),
        List.from(reviews ?? []),
        List.from(reviewed ?? []),
        List.from(comments ?? []),
        location,
        locationId,
        List.from(abuseReports ?? []),
        List.from(favorites ?? []),
        List.from(abuseReported ?? []),
        List.from(favorited ?? [])
      ];
}

extension UserExt on User {
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

class UserController extends ValueNotifier<User> {
  TextEditingController? lastSeenController;

  TextEditingController? idController;

  TextEditingController? emailController;

  TextEditingController? displayNameController;

  TextEditingController? phoneNumberController;

  TextEditingController? dateOfBirthController;

  TextEditingController? emailVerifiedController;

  TextEditingController? disabledController;

  AttachmentController? avatorController;
  void Function(Attachment value)? avatorChanged;

  TextEditingController? avatorIdController;

  void Function(Role value)? roleChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  void Function(AccountStatus value)? stateChanged;
  void Function(Gender value)? genderChanged;
  BusinessController? businessProfileController;
  void Function(Business value)? businessProfileChanged;

  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  DeviceController? deviceController;
  void Function(Device value)? deviceChanged;

  final Map<String, Order> updatedOrdered = {};
  final Map<String, Order> deletedOrdered = {};
  void Function(Order value)? orderedChanged;
  void Function(Order value)? orderedRemoved;
  // Order controllers
  final Map<String, OrderController> orderedController = {};

  final Map<String, Review> updatedReviews = {};
  final Map<String, Review> deletedReviews = {};
  void Function(Review value)? reviewsChanged;
  void Function(Review value)? reviewsRemoved;
  // Review controllers
  final Map<String, ReviewController> reviewsController = {};

  final Map<String, Review> updatedReviewed = {};
  final Map<String, Review> deletedReviewed = {};
  void Function(Review value)? reviewedChanged;
  void Function(Review value)? reviewedRemoved;
  // Review controllers
  final Map<String, ReviewController> reviewedController = {};

  final Map<String, Comment> updatedComments = {};
  final Map<String, Comment> deletedComments = {};
  void Function(Comment value)? commentsChanged;
  void Function(Comment value)? commentsRemoved;
  // Comment controllers
  final Map<String, CommentController> commentsController = {};

  LocationController? locationController;
  void Function(Location value)? locationChanged;

  TextEditingController? locationIdController;

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

  final Map<String, AbuseReport> updatedAbuseReported = {};
  final Map<String, AbuseReport> deletedAbuseReported = {};
  void Function(AbuseReport value)? abuseReportedChanged;
  void Function(AbuseReport value)? abuseReportedRemoved;
  // AbuseReport controllers
  final Map<String, AbuseReportController> abuseReportedController = {};

  final Map<String, Favorite> updatedFavorited = {};
  final Map<String, Favorite> deletedFavorited = {};
  void Function(Favorite value)? favoritedChanged;
  void Function(Favorite value)? favoritedRemoved;
  // Favorite controllers
  final Map<String, FavoriteController> favoritedController = {};

  final User initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  UserController({
    required this.initialValue,
    required this.selectionSet,
    this.avatorChanged,
    this.roleChanged,
    this.recordStatusChanged,
    this.stateChanged,
    this.genderChanged,
    this.businessProfileChanged,
    this.deviceChanged,
    this.orderedChanged,
    this.orderedRemoved,
    this.reviewsChanged,
    this.reviewsRemoved,
    this.reviewedChanged,
    this.reviewedRemoved,
    this.commentsChanged,
    this.commentsRemoved,
    this.locationChanged,
    this.abuseReportsChanged,
    this.abuseReportsRemoved,
    this.favoritesChanged,
    this.favoritesRemoved,
    this.abuseReportedChanged,
    this.abuseReportedRemoved,
    this.favoritedChanged,
    this.favoritedRemoved,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('lastSeen')) {
      lastSeenController =
          TextEditingController(text: "${initialValue.lastSeen ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  lastSeen: DateTime.tryParse(lastSeenController?.text ?? ''));
            });
    }
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('email')) {
      emailController =
          TextEditingController(text: "${initialValue.email ?? ''}")
            ..addListener(() {
              value = value.copyWith(email: emailController?.text);
            });
    }
    if (isInSelectionSet('displayName')) {
      displayNameController =
          TextEditingController(text: "${initialValue.displayName ?? ''}")
            ..addListener(() {
              value = value.copyWith(displayName: displayNameController?.text);
            });
    }
    if (isInSelectionSet('phoneNumber')) {
      phoneNumberController =
          TextEditingController(text: "${initialValue.phoneNumber ?? ''}")
            ..addListener(() {
              value = value.copyWith(phoneNumber: phoneNumberController?.text);
            });
    }
    if (isInSelectionSet('dateOfBirth')) {
      dateOfBirthController =
          TextEditingController(text: "${initialValue.dateOfBirth ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  dateOfBirth:
                      DateTime.tryParse(dateOfBirthController?.text ?? ''));
            });
    }
    if (isInSelectionSet('avator')) {
      var selected = getSelectionNodeData('avator')?.selectionSet;
      avatorController = AttachmentController(
          initialValue: initialValue.avator ?? Attachment(),
          selectionSet: selected!);
      avatorController?.addListener(() {
        var v = avatorController?.value;
        onAvatorChanged(v!);
      });
    }
    if (isInSelectionSet('avatorId')) {
      avatorIdController =
          TextEditingController(text: "${initialValue.avatorId ?? ''}")
            ..addListener(() {
              value = value.copyWith(avatorId: avatorIdController?.text);
            });
    }
    if (isInSelectionSet('businessProfile')) {
      var selected = getSelectionNodeData('businessProfile')?.selectionSet;
      businessProfileController = BusinessController(
          initialValue: initialValue.businessProfile ?? Business(),
          selectionSet: selected!);
      businessProfileController?.addListener(() {
        var v = businessProfileController?.value;
        onBusinessProfileChanged(v!);
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
    if (isInSelectionSet('device')) {
      var selected = getSelectionNodeData('device')?.selectionSet;
      deviceController = DeviceController(
          initialValue: initialValue.device ?? Device(),
          selectionSet: selected!);
      deviceController?.addListener(() {
        var v = deviceController?.value;
        onDeviceChanged(v!);
      });
    }
    if (isInSelectionSet('ordered')) {
      if (initialValue.ordered?.isNotEmpty == true) {
        var selection = getSelectionNodeData('ordered')?.selectionSet;
        orderedController.clear();
        var values =
            initialValue.ordered?.map<MapEntry<String, OrderController>>((e) {
          var controller =
              OrderController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onOrderedChanged(controller.value);
          });
          return MapEntry<String, OrderController>(e.id!, controller);
        });
        orderedController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('reviews')) {
      if (initialValue.reviews?.isNotEmpty == true) {
        var selection = getSelectionNodeData('reviews')?.selectionSet;
        reviewsController.clear();
        var values =
            initialValue.reviews?.map<MapEntry<String, ReviewController>>((e) {
          var controller =
              ReviewController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onReviewsChanged(controller.value);
          });
          return MapEntry<String, ReviewController>(e.id!, controller);
        });
        reviewsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('reviewed')) {
      if (initialValue.reviewed?.isNotEmpty == true) {
        var selection = getSelectionNodeData('reviewed')?.selectionSet;
        reviewedController.clear();
        var values =
            initialValue.reviewed?.map<MapEntry<String, ReviewController>>((e) {
          var controller =
              ReviewController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onReviewedChanged(controller.value);
          });
          return MapEntry<String, ReviewController>(e.id!, controller);
        });
        reviewedController.addEntries(values ?? Iterable.empty());
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
    if (isInSelectionSet('location')) {
      var selected = getSelectionNodeData('location')?.selectionSet;
      locationController = LocationController(
          initialValue: initialValue.location ?? Location(),
          selectionSet: selected!);
      locationController?.addListener(() {
        var v = locationController?.value;
        onLocationChanged(v!);
      });
    }
    if (isInSelectionSet('locationId')) {
      locationIdController =
          TextEditingController(text: "${initialValue.locationId ?? ''}")
            ..addListener(() {
              value = value.copyWith(locationId: locationIdController?.text);
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
    if (isInSelectionSet('abuseReported')) {
      if (initialValue.abuseReported?.isNotEmpty == true) {
        var selection = getSelectionNodeData('abuseReported')?.selectionSet;
        abuseReportedController.clear();
        var values = initialValue.abuseReported
            ?.map<MapEntry<String, AbuseReportController>>((e) {
          var controller =
              AbuseReportController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onAbuseReportedChanged(controller.value);
          });
          return MapEntry<String, AbuseReportController>(e.id!, controller);
        });
        abuseReportedController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('favorited')) {
      if (initialValue.favorited?.isNotEmpty == true) {
        var selection = getSelectionNodeData('favorited')?.selectionSet;
        favoritedController.clear();
        var values = initialValue.favorited
            ?.map<MapEntry<String, FavoriteController>>((e) {
          var controller =
              FavoriteController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onFavoritedChanged(controller.value);
          });
          return MapEntry<String, FavoriteController>(e.id!, controller);
        });
        favoritedController.addEntries(values ?? Iterable.empty());
      }
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('lastSeen')) {
      lastSeenController?.dispose();
    }
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('email')) {
      emailController?.dispose();
    }
    if (isInSelectionSet('displayName')) {
      displayNameController?.dispose();
    }
    if (isInSelectionSet('phoneNumber')) {
      phoneNumberController?.dispose();
    }
    if (isInSelectionSet('dateOfBirth')) {
      dateOfBirthController?.dispose();
    }
    if (isInSelectionSet('avator')) {
      avatorController?.dispose();
    }
    if (isInSelectionSet('avatorId')) {
      avatorIdController?.dispose();
    }
    if (isInSelectionSet('businessProfile')) {
      businessProfileController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('device')) {
      deviceController?.dispose();
    }
    if (isInSelectionSet('ordered')) {
      orderedController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('reviews')) {
      reviewsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('reviewed')) {
      reviewedController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('comments')) {
      commentsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('location')) {
      locationController?.dispose();
    }
    if (isInSelectionSet('locationId')) {
      locationIdController?.dispose();
    }
    if (isInSelectionSet('abuseReports')) {
      abuseReportsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('favorites')) {
      favoritesController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('abuseReported')) {
      abuseReportedController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('favorited')) {
      favoritedController.values.map((v) => v.dispose()).toList();
    }

    super.dispose();
  }

  void onAvatorChanged(Attachment v) {
    if (value.avator != v) {
      value = value.copyWith(avator: v);
      avatorChanged?.call(v);
    }
  }

  void onRoleChanged(Role v) {
    if (value.role != v) {
      value = value.copyWith(role: v);
      roleChanged?.call(v);
    }
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onStateChanged(AccountStatus v) {
    if (value.state != v) {
      value = value.copyWith(state: v);
      stateChanged?.call(v);
    }
  }

  void onGenderChanged(Gender v) {
    if (value.gender != v) {
      value = value.copyWith(gender: v);
      genderChanged?.call(v);
    }
  }

  void onBusinessProfileChanged(Business v) {
    if (value.businessProfile != v) {
      value = value.copyWith(businessProfile: v);
      businessProfileChanged?.call(v);
    }
  }

  void onDeviceChanged(Device v) {
    if (value.device != v) {
      value = value.copyWith(device: v);
      deviceChanged?.call(v);
    }
  }

  void onOrderedChanged(Order v) {
    updatedOrdered[v.id!] = v;
    var i = value.ordered?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Order>.from(value.ordered ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("ordered")?.selectionSet;
      orderedController[v.id!] =
          OrderController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(ordered: list);

    orderedChanged?.call(v);
  }

  void onOrderedRemoved(Order v) {
    if (!v.isNew) {
      deletedOrdered[v.id!] = v;
    }
    updatedOrdered.remove(v.id!);
    orderedController.remove(v.id!);
    value = value.copyWith(
        ordered: value.ordered?.where((e) => e.id != v.id).toList() ?? []);

    orderedRemoved?.call(v);
  }

  void onReviewsChanged(Review v) {
    updatedReviews[v.id!] = v;
    var i = value.reviews?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Review>.from(value.reviews ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("reviews")?.selectionSet;
      reviewsController[v.id!] =
          ReviewController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(reviews: list);

    reviewsChanged?.call(v);
  }

  void onReviewsRemoved(Review v) {
    if (!v.isNew) {
      deletedReviews[v.id!] = v;
    }
    updatedReviews.remove(v.id!);
    reviewsController.remove(v.id!);
    value = value.copyWith(
        reviews: value.reviews?.where((e) => e.id != v.id).toList() ?? []);

    reviewsRemoved?.call(v);
  }

  void onReviewedChanged(Review v) {
    updatedReviewed[v.id!] = v;
    var i = value.reviewed?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Review>.from(value.reviewed ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("reviewed")?.selectionSet;
      reviewedController[v.id!] =
          ReviewController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(reviewed: list);

    reviewedChanged?.call(v);
  }

  void onReviewedRemoved(Review v) {
    if (!v.isNew) {
      deletedReviewed[v.id!] = v;
    }
    updatedReviewed.remove(v.id!);
    reviewedController.remove(v.id!);
    value = value.copyWith(
        reviewed: value.reviewed?.where((e) => e.id != v.id).toList() ?? []);

    reviewedRemoved?.call(v);
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

  void onLocationChanged(Location v) {
    if (value.location != v) {
      value = value.copyWith(location: v);
      locationChanged?.call(v);
    }
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

  void onAbuseReportedChanged(AbuseReport v) {
    updatedAbuseReported[v.id!] = v;
    var i = value.abuseReported?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<AbuseReport>.from(value.abuseReported ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("abuseReported")?.selectionSet;
      abuseReportedController[v.id!] =
          AbuseReportController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(abuseReported: list);

    abuseReportedChanged?.call(v);
  }

  void onAbuseReportedRemoved(AbuseReport v) {
    if (!v.isNew) {
      deletedAbuseReported[v.id!] = v;
    }
    updatedAbuseReported.remove(v.id!);
    abuseReportedController.remove(v.id!);
    value = value.copyWith(
        abuseReported:
            value.abuseReported?.where((e) => e.id != v.id).toList() ?? []);

    abuseReportedRemoved?.call(v);
  }

  void onFavoritedChanged(Favorite v) {
    updatedFavorited[v.id!] = v;
    var i = value.favorited?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Favorite>.from(value.favorited ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("favorited")?.selectionSet;
      favoritedController[v.id!] =
          FavoriteController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(favorited: list);

    favoritedChanged?.call(v);
  }

  void onFavoritedRemoved(Favorite v) {
    if (!v.isNew) {
      deletedFavorited[v.id!] = v;
    }
    updatedFavorited.remove(v.id!);
    favoritedController.remove(v.id!);
    value = value.copyWith(
        favorited: value.favorited?.where((e) => e.id != v.id).toList() ?? []);

    favoritedRemoved?.call(v);
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
