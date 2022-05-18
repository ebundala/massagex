import 'record_status.dart';
import 'attachment_type.dart';
import 'user.dart';
import 'comment.dart';
import 'payment_method.dart';
import 'service.dart';
import 'order.dart';
import 'business.dart';
import 'help_step.dart';
import 'review.dart';
import 'category.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class Attachment extends Equatable {
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
  final List<User>? users;
  final Comment? comment;
  final String? commentId;
  final List<PaymentMethod>? paymentMethods;
  final List<Service>? services;
  final List<Order>? orders;
  final List<Business>? businesses;
  final HelpStep? helpStep;
  final String? helpStepId;
  final Review? reviews;
  final String? reviewId;
  final String? userId;
  final Business? business;
  final String? businessId;
  final List<Category>? categories;
  Attachment(
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
      this.users,
      this.comment,
      this.commentId,
      this.paymentMethods,
      this.services,
      this.orders,
      this.businesses,
      this.helpStep,
      this.helpStepId,
      this.reviews,
      this.reviewId,
      this.userId,
      this.business,
      this.businessId,
      this.categories});

  static Attachment fromJson(Map<dynamic, dynamic> json) {
    return Attachment(
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
      users: json['users'] != null
          ? List.generate(json['users'].length,
              (index) => User.fromJson(json['users'][index]))
          : null,
      comment:
          json['comment'] != null ? Comment.fromJson(json['comment']) : null,
      commentId: json['commentId'],
      paymentMethods: json['paymentMethods'] != null
          ? List.generate(json['paymentMethods'].length,
              (index) => PaymentMethod.fromJson(json['paymentMethods'][index]))
          : null,
      services: json['services'] != null
          ? List.generate(json['services'].length,
              (index) => Service.fromJson(json['services'][index]))
          : null,
      orders: json['orders'] != null
          ? List.generate(json['orders'].length,
              (index) => Order.fromJson(json['orders'][index]))
          : null,
      businesses: json['businesses'] != null
          ? List.generate(json['businesses'].length,
              (index) => Business.fromJson(json['businesses'][index]))
          : null,
      helpStep:
          json['helpStep'] != null ? HelpStep.fromJson(json['helpStep']) : null,
      helpStepId: json['helpStepId'],
      reviews:
          json['reviews'] != null ? Review.fromJson(json['reviews']) : null,
      reviewId: json['reviewId'],
      userId: json['userId'],
      business:
          json['business'] != null ? Business.fromJson(json['business']) : null,
      businessId: json['businessId'],
      categories: json['categories'] != null
          ? List.generate(json['categories'].length,
              (index) => Category.fromJson(json['categories'][index]))
          : null,
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
    if (users != null)
      _data['users'] =
          List.generate(users?.length ?? 0, (index) => users![index].toJson());
    if (comment != null) _data['comment'] = comment!.toJson();
    if (commentId != null) _data['commentId'] = commentId;
    if (paymentMethods != null)
      _data['paymentMethods'] = List.generate(paymentMethods?.length ?? 0,
          (index) => paymentMethods![index].toJson());
    if (services != null)
      _data['services'] = List.generate(
          services?.length ?? 0, (index) => services![index].toJson());
    if (orders != null)
      _data['orders'] = List.generate(
          orders?.length ?? 0, (index) => orders![index].toJson());
    if (businesses != null)
      _data['businesses'] = List.generate(
          businesses?.length ?? 0, (index) => businesses![index].toJson());
    if (helpStep != null) _data['helpStep'] = helpStep!.toJson();
    if (helpStepId != null) _data['helpStepId'] = helpStepId;
    if (reviews != null) _data['reviews'] = reviews!.toJson();
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (userId != null) _data['userId'] = userId;
    if (business != null) _data['business'] = business!.toJson();
    if (businessId != null) _data['businessId'] = businessId;
    if (categories != null)
      _data['categories'] = List.generate(
          categories?.length ?? 0, (index) => categories![index].toJson());
    return _data;
  }

  Attachment copyWith(
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
      List<User>? users,
      Comment? comment,
      String? commentId,
      List<PaymentMethod>? paymentMethods,
      List<Service>? services,
      List<Order>? orders,
      List<Business>? businesses,
      HelpStep? helpStep,
      String? helpStepId,
      Review? reviews,
      String? reviewId,
      String? userId,
      Business? business,
      String? businessId,
      List<Category>? categories}) {
    return Attachment(
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
        users: users ?? this.users,
        comment: comment ?? this.comment,
        commentId: commentId ?? this.commentId,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        services: services ?? this.services,
        orders: orders ?? this.orders,
        businesses: businesses ?? this.businesses,
        helpStep: helpStep ?? this.helpStep,
        helpStepId: helpStepId ?? this.helpStepId,
        reviews: reviews ?? this.reviews,
        reviewId: reviewId ?? this.reviewId,
        userId: userId ?? this.userId,
        business: business ?? this.business,
        businessId: businessId ?? this.businessId,
        categories: categories ?? this.categories);
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
        List.from(users ?? []),
        comment,
        commentId,
        List.from(paymentMethods ?? []),
        List.from(services ?? []),
        List.from(orders ?? []),
        List.from(businesses ?? []),
        helpStep,
        helpStepId,
        reviews,
        reviewId,
        userId,
        business,
        businessId,
        List.from(categories ?? [])
      ];
}

extension AttachmentExt on Attachment {
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

class AttachmentController extends ValueNotifier<Attachment> {
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

  final Map<String, User> updatedUsers = {};
  final Map<String, User> deletedUsers = {};
  void Function(User value)? usersChanged;
  void Function(User value)? usersRemoved;
  // User controllers
  final Map<String, UserController> usersController = {};

  CommentController? commentController;
  void Function(Comment value)? commentChanged;

  TextEditingController? commentIdController;

  final Map<String, PaymentMethod> updatedPaymentMethods = {};
  final Map<String, PaymentMethod> deletedPaymentMethods = {};
  void Function(PaymentMethod value)? paymentMethodsChanged;
  void Function(PaymentMethod value)? paymentMethodsRemoved;
  // PaymentMethod controllers
  final Map<String, PaymentMethodController> paymentMethodsController = {};

  final Map<String, Service> updatedServices = {};
  final Map<String, Service> deletedServices = {};
  void Function(Service value)? servicesChanged;
  void Function(Service value)? servicesRemoved;
  // Service controllers
  final Map<String, ServiceController> servicesController = {};

  final Map<String, Order> updatedOrders = {};
  final Map<String, Order> deletedOrders = {};
  void Function(Order value)? ordersChanged;
  void Function(Order value)? ordersRemoved;
  // Order controllers
  final Map<String, OrderController> ordersController = {};

  final Map<String, Business> updatedBusinesses = {};
  final Map<String, Business> deletedBusinesses = {};
  void Function(Business value)? businessesChanged;
  void Function(Business value)? businessesRemoved;
  // Business controllers
  final Map<String, BusinessController> businessesController = {};

  HelpStepController? helpStepController;
  void Function(HelpStep value)? helpStepChanged;

  TextEditingController? helpStepIdController;

  ReviewController? reviewsController;
  void Function(Review value)? reviewsChanged;

  TextEditingController? reviewIdController;

  TextEditingController? userIdController;

  BusinessController? businessController;
  void Function(Business value)? businessChanged;

  TextEditingController? businessIdController;

  final Map<String, Category> updatedCategories = {};
  final Map<String, Category> deletedCategories = {};
  void Function(Category value)? categoriesChanged;
  void Function(Category value)? categoriesRemoved;
  // Category controllers
  final Map<String, CategoryController> categoriesController = {};

  final Attachment initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  AttachmentController({
    required this.initialValue,
    required this.selectionSet,
    this.recordStatusChanged,
    this.attachmentTypeChanged,
    this.usersChanged,
    this.usersRemoved,
    this.commentChanged,
    this.paymentMethodsChanged,
    this.paymentMethodsRemoved,
    this.servicesChanged,
    this.servicesRemoved,
    this.ordersChanged,
    this.ordersRemoved,
    this.businessesChanged,
    this.businessesRemoved,
    this.helpStepChanged,
    this.reviewsChanged,
    this.businessChanged,
    this.categoriesChanged,
    this.categoriesRemoved,
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
    if (isInSelectionSet('users')) {
      if (initialValue.users?.isNotEmpty == true) {
        var selection = getSelectionNodeData('users')?.selectionSet;
        usersController.clear();
        var values =
            initialValue.users?.map<MapEntry<String, UserController>>((e) {
          var controller =
              UserController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onUsersChanged(controller.value);
          });
          return MapEntry<String, UserController>(e.id!, controller);
        });
        usersController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('commentId')) {
      commentIdController =
          TextEditingController(text: "${initialValue.commentId ?? ''}")
            ..addListener(() {
              value = value.copyWith(commentId: commentIdController?.text);
            });
    }
    if (isInSelectionSet('paymentMethods')) {
      if (initialValue.paymentMethods?.isNotEmpty == true) {
        var selection = getSelectionNodeData('paymentMethods')?.selectionSet;
        paymentMethodsController.clear();
        var values = initialValue.paymentMethods
            ?.map<MapEntry<String, PaymentMethodController>>((e) {
          var controller = PaymentMethodController(
              initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onPaymentMethodsChanged(controller.value);
          });
          return MapEntry<String, PaymentMethodController>(e.id!, controller);
        });
        paymentMethodsController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('services')) {
      if (initialValue.services?.isNotEmpty == true) {
        var selection = getSelectionNodeData('services')?.selectionSet;
        servicesController.clear();
        var values = initialValue.services
            ?.map<MapEntry<String, ServiceController>>((e) {
          var controller =
              ServiceController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onServicesChanged(controller.value);
          });
          return MapEntry<String, ServiceController>(e.id!, controller);
        });
        servicesController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('orders')) {
      if (initialValue.orders?.isNotEmpty == true) {
        var selection = getSelectionNodeData('orders')?.selectionSet;
        ordersController.clear();
        var values =
            initialValue.orders?.map<MapEntry<String, OrderController>>((e) {
          var controller =
              OrderController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onOrdersChanged(controller.value);
          });
          return MapEntry<String, OrderController>(e.id!, controller);
        });
        ordersController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('businesses')) {
      if (initialValue.businesses?.isNotEmpty == true) {
        var selection = getSelectionNodeData('businesses')?.selectionSet;
        businessesController.clear();
        var values = initialValue.businesses
            ?.map<MapEntry<String, BusinessController>>((e) {
          var controller =
              BusinessController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onBusinessesChanged(controller.value);
          });
          return MapEntry<String, BusinessController>(e.id!, controller);
        });
        businessesController.addEntries(values ?? Iterable.empty());
      }
    }
    if (isInSelectionSet('helpStep')) {
      var selected = getSelectionNodeData('helpStep')?.selectionSet;
      helpStepController = HelpStepController(
          initialValue: initialValue.helpStep ?? HelpStep(),
          selectionSet: selected!);
      helpStepController?.addListener(() {
        var v = helpStepController?.value;
        onHelpStepChanged(v!);
      });
    }
    if (isInSelectionSet('helpStepId')) {
      helpStepIdController =
          TextEditingController(text: "${initialValue.helpStepId ?? ''}")
            ..addListener(() {
              value = value.copyWith(helpStepId: helpStepIdController?.text);
            });
    }
    if (isInSelectionSet('reviews')) {
      var selected = getSelectionNodeData('reviews')?.selectionSet;
      reviewsController = ReviewController(
          initialValue: initialValue.reviews ?? Review(),
          selectionSet: selected!);
      reviewsController?.addListener(() {
        var v = reviewsController?.value;
        onReviewsChanged(v!);
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
    if (isInSelectionSet('businessId')) {
      businessIdController =
          TextEditingController(text: "${initialValue.businessId ?? ''}")
            ..addListener(() {
              value = value.copyWith(businessId: businessIdController?.text);
            });
    }
    if (isInSelectionSet('categories')) {
      if (initialValue.categories?.isNotEmpty == true) {
        var selection = getSelectionNodeData('categories')?.selectionSet;
        categoriesController.clear();
        var values = initialValue.categories
            ?.map<MapEntry<String, CategoryController>>((e) {
          var controller =
              CategoryController(initialValue: e, selectionSet: selection!);
          controller.addListener(() {
            onCategoriesChanged(controller.value);
          });
          return MapEntry<String, CategoryController>(e.id!, controller);
        });
        categoriesController.addEntries(values ?? Iterable.empty());
      }
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
    if (isInSelectionSet('users')) {
      usersController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('comment')) {
      commentController?.dispose();
    }
    if (isInSelectionSet('commentId')) {
      commentIdController?.dispose();
    }
    if (isInSelectionSet('paymentMethods')) {
      paymentMethodsController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('services')) {
      servicesController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('orders')) {
      ordersController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('businesses')) {
      businessesController.values.map((v) => v.dispose()).toList();
    }
    if (isInSelectionSet('helpStep')) {
      helpStepController?.dispose();
    }
    if (isInSelectionSet('helpStepId')) {
      helpStepIdController?.dispose();
    }
    if (isInSelectionSet('reviews')) {
      reviewsController?.dispose();
    }
    if (isInSelectionSet('reviewId')) {
      reviewIdController?.dispose();
    }
    if (isInSelectionSet('userId')) {
      userIdController?.dispose();
    }
    if (isInSelectionSet('business')) {
      businessController?.dispose();
    }
    if (isInSelectionSet('businessId')) {
      businessIdController?.dispose();
    }
    if (isInSelectionSet('categories')) {
      categoriesController.values.map((v) => v.dispose()).toList();
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

  void onUsersChanged(User v) {
    updatedUsers[v.id!] = v;
    var i = value.users?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<User>.from(value.users ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("users")?.selectionSet;
      usersController[v.id!] =
          UserController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(users: list);

    usersChanged?.call(v);
  }

  void onUsersRemoved(User v) {
    if (!v.isNew) {
      deletedUsers[v.id!] = v;
    }
    updatedUsers.remove(v.id!);
    usersController.remove(v.id!);
    value = value.copyWith(
        users: value.users?.where((e) => e.id != v.id).toList() ?? []);

    usersRemoved?.call(v);
  }

  void onCommentChanged(Comment v) {
    if (value.comment != v) {
      value = value.copyWith(comment: v);
      commentChanged?.call(v);
    }
  }

  void onPaymentMethodsChanged(PaymentMethod v) {
    updatedPaymentMethods[v.id!] = v;
    var i = value.paymentMethods?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<PaymentMethod>.from(value.paymentMethods ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("paymentMethods")?.selectionSet;
      paymentMethodsController[v.id!] =
          PaymentMethodController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(paymentMethods: list);

    paymentMethodsChanged?.call(v);
  }

  void onPaymentMethodsRemoved(PaymentMethod v) {
    if (!v.isNew) {
      deletedPaymentMethods[v.id!] = v;
    }
    updatedPaymentMethods.remove(v.id!);
    paymentMethodsController.remove(v.id!);
    value = value.copyWith(
        paymentMethods:
            value.paymentMethods?.where((e) => e.id != v.id).toList() ?? []);

    paymentMethodsRemoved?.call(v);
  }

  void onServicesChanged(Service v) {
    updatedServices[v.id!] = v;
    var i = value.services?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Service>.from(value.services ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("services")?.selectionSet;
      servicesController[v.id!] =
          ServiceController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(services: list);

    servicesChanged?.call(v);
  }

  void onServicesRemoved(Service v) {
    if (!v.isNew) {
      deletedServices[v.id!] = v;
    }
    updatedServices.remove(v.id!);
    servicesController.remove(v.id!);
    value = value.copyWith(
        services: value.services?.where((e) => e.id != v.id).toList() ?? []);

    servicesRemoved?.call(v);
  }

  void onOrdersChanged(Order v) {
    updatedOrders[v.id!] = v;
    var i = value.orders?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Order>.from(value.orders ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("orders")?.selectionSet;
      ordersController[v.id!] =
          OrderController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(orders: list);

    ordersChanged?.call(v);
  }

  void onOrdersRemoved(Order v) {
    if (!v.isNew) {
      deletedOrders[v.id!] = v;
    }
    updatedOrders.remove(v.id!);
    ordersController.remove(v.id!);
    value = value.copyWith(
        orders: value.orders?.where((e) => e.id != v.id).toList() ?? []);

    ordersRemoved?.call(v);
  }

  void onBusinessesChanged(Business v) {
    updatedBusinesses[v.id!] = v;
    var i = value.businesses?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Business>.from(value.businesses ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("businesses")?.selectionSet;
      businessesController[v.id!] =
          BusinessController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(businesses: list);

    businessesChanged?.call(v);
  }

  void onBusinessesRemoved(Business v) {
    if (!v.isNew) {
      deletedBusinesses[v.id!] = v;
    }
    updatedBusinesses.remove(v.id!);
    businessesController.remove(v.id!);
    value = value.copyWith(
        businesses:
            value.businesses?.where((e) => e.id != v.id).toList() ?? []);

    businessesRemoved?.call(v);
  }

  void onHelpStepChanged(HelpStep v) {
    if (value.helpStep != v) {
      value = value.copyWith(helpStep: v);
      helpStepChanged?.call(v);
    }
  }

  void onReviewsChanged(Review v) {
    if (value.reviews != v) {
      value = value.copyWith(reviews: v);
      reviewsChanged?.call(v);
    }
  }

  void onBusinessChanged(Business v) {
    if (value.business != v) {
      value = value.copyWith(business: v);
      businessChanged?.call(v);
    }
  }

  void onCategoriesChanged(Category v) {
    updatedCategories[v.id!] = v;
    var i = value.categories?.indexWhere((e) => e.id == v.id) ?? -1;
    var list = List<Category>.from(value.categories ?? []);
    if (i >= 0) {
      list[i] = v;
    } else {
      list.add(v);
      var selection = getSelectionNodeData("categories")?.selectionSet;
      categoriesController[v.id!] =
          CategoryController(initialValue: v, selectionSet: selection!);
    }
    value = value.copyWith(categories: list);

    categoriesChanged?.call(v);
  }

  void onCategoriesRemoved(Category v) {
    if (!v.isNew) {
      deletedCategories[v.id!] = v;
    }
    updatedCategories.remove(v.id!);
    categoriesController.remove(v.id!);
    value = value.copyWith(
        categories:
            value.categories?.where((e) => e.id != v.id).toList() ?? []);

    categoriesRemoved?.call(v);
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
