import 'transaction.dart';
import 'payment_status.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class MpesaPayment extends Equatable {
  final String? id;
  final String? input$Amount;
  final String? input$Country;
  final String? input$Currency;
  final String? input$CustomerMSISDN;
  final String? input$ServiceProviderCode;
  final String? input$ThirdPartyConversationID;
  final String? input$TransactionReference;
  final String? input$PurchasedItemsDesc;
  final String? output$ConversationID;
  final String? output$ResponseCode;
  final String? output$ResponseDesc;
  final String? output$ThirdPartyConversationID;
  final String? output$TransactionID;
  final Transaction? transaction;
  final PaymentStatus? status;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  MpesaPayment(
      {this.id,
      this.input$Amount,
      this.input$Country,
      this.input$Currency,
      this.input$CustomerMSISDN,
      this.input$ServiceProviderCode,
      this.input$ThirdPartyConversationID,
      this.input$TransactionReference,
      this.input$PurchasedItemsDesc,
      this.output$ConversationID,
      this.output$ResponseCode,
      this.output$ResponseDesc,
      this.output$ThirdPartyConversationID,
      this.output$TransactionID,
      this.transaction,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static MpesaPayment fromJson(Map<dynamic, dynamic> json) {
    return MpesaPayment(
      id: json['id'],
      input$Amount: json['input_Amount'],
      input$Country: json['input_Country'],
      input$Currency: json['input_Currency'],
      input$CustomerMSISDN: json['input_CustomerMSISDN'],
      input$ServiceProviderCode: json['input_ServiceProviderCode'],
      input$ThirdPartyConversationID: json['input_ThirdPartyConversationID'],
      input$TransactionReference: json['input_TransactionReference'],
      input$PurchasedItemsDesc: json['input_PurchasedItemsDesc'],
      output$ConversationID: json['output_ConversationID'],
      output$ResponseCode: json['output_ResponseCode'],
      output$ResponseDesc: json['output_ResponseDesc'],
      output$ThirdPartyConversationID: json['output_ThirdPartyConversationID'],
      output$TransactionID: json['output_TransactionID'],
      transaction: json['transaction'] != null
          ? Transaction.fromJson(json['transaction'])
          : null,
      status: json['status'] != null
          ? PaymentStatusExt.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
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
    if (input$Amount != null) _data['input_Amount'] = input$Amount;
    if (input$Country != null) _data['input_Country'] = input$Country;
    if (input$Currency != null) _data['input_Currency'] = input$Currency;
    if (input$CustomerMSISDN != null)
      _data['input_CustomerMSISDN'] = input$CustomerMSISDN;
    if (input$ServiceProviderCode != null)
      _data['input_ServiceProviderCode'] = input$ServiceProviderCode;
    if (input$ThirdPartyConversationID != null)
      _data['input_ThirdPartyConversationID'] = input$ThirdPartyConversationID;
    if (input$TransactionReference != null)
      _data['input_TransactionReference'] = input$TransactionReference;
    if (input$PurchasedItemsDesc != null)
      _data['input_PurchasedItemsDesc'] = input$PurchasedItemsDesc;
    if (output$ConversationID != null)
      _data['output_ConversationID'] = output$ConversationID;
    if (output$ResponseCode != null)
      _data['output_ResponseCode'] = output$ResponseCode;
    if (output$ResponseDesc != null)
      _data['output_ResponseDesc'] = output$ResponseDesc;
    if (output$ThirdPartyConversationID != null)
      _data['output_ThirdPartyConversationID'] =
          output$ThirdPartyConversationID;
    if (output$TransactionID != null)
      _data['output_TransactionID'] = output$TransactionID;
    if (transaction != null) _data['transaction'] = transaction!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  MpesaPayment copyWith(
      {String? id,
      String? input$Amount,
      String? input$Country,
      String? input$Currency,
      String? input$CustomerMSISDN,
      String? input$ServiceProviderCode,
      String? input$ThirdPartyConversationID,
      String? input$TransactionReference,
      String? input$PurchasedItemsDesc,
      String? output$ConversationID,
      String? output$ResponseCode,
      String? output$ResponseDesc,
      String? output$ThirdPartyConversationID,
      String? output$TransactionID,
      Transaction? transaction,
      PaymentStatus? status,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return MpesaPayment(
        id: id ?? this.id,
        input$Amount: input$Amount ?? this.input$Amount,
        input$Country: input$Country ?? this.input$Country,
        input$Currency: input$Currency ?? this.input$Currency,
        input$CustomerMSISDN: input$CustomerMSISDN ?? this.input$CustomerMSISDN,
        input$ServiceProviderCode:
            input$ServiceProviderCode ?? this.input$ServiceProviderCode,
        input$ThirdPartyConversationID: input$ThirdPartyConversationID ??
            this.input$ThirdPartyConversationID,
        input$TransactionReference:
            input$TransactionReference ?? this.input$TransactionReference,
        input$PurchasedItemsDesc:
            input$PurchasedItemsDesc ?? this.input$PurchasedItemsDesc,
        output$ConversationID:
            output$ConversationID ?? this.output$ConversationID,
        output$ResponseCode: output$ResponseCode ?? this.output$ResponseCode,
        output$ResponseDesc: output$ResponseDesc ?? this.output$ResponseDesc,
        output$ThirdPartyConversationID: output$ThirdPartyConversationID ??
            this.output$ThirdPartyConversationID,
        output$TransactionID: output$TransactionID ?? this.output$TransactionID,
        transaction: transaction ?? this.transaction,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        input$Amount,
        input$Country,
        input$Currency,
        input$CustomerMSISDN,
        input$ServiceProviderCode,
        input$ThirdPartyConversationID,
        input$TransactionReference,
        input$PurchasedItemsDesc,
        output$ConversationID,
        output$ResponseCode,
        output$ResponseDesc,
        output$ThirdPartyConversationID,
        output$TransactionID,
        transaction,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}

extension MpesaPaymentExt on MpesaPayment {
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

class MpesaPaymentController extends ValueNotifier<MpesaPayment> {
  TextEditingController? idController;

  TextEditingController? input$AmountController;

  TextEditingController? input$CountryController;

  TextEditingController? input$CurrencyController;

  TextEditingController? input$CustomerMSISDNController;

  TextEditingController? input$ServiceProviderCodeController;

  TextEditingController? input$ThirdPartyConversationIDController;

  TextEditingController? input$TransactionReferenceController;

  TextEditingController? input$PurchasedItemsDescController;

  TextEditingController? output$ConversationIDController;

  TextEditingController? output$ResponseCodeController;

  TextEditingController? output$ResponseDescController;

  TextEditingController? output$ThirdPartyConversationIDController;

  TextEditingController? output$TransactionIDController;

  TransactionController? transactionController;
  void Function(Transaction value)? transactionChanged;

  void Function(PaymentStatus value)? statusChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  TextEditingController? metadataController;

  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  final MpesaPayment initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  MpesaPaymentController({
    required this.initialValue,
    required this.selectionSet,
    this.transactionChanged,
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
    if (isInSelectionSet('input_Amount')) {
      input$AmountController =
          TextEditingController(text: "${initialValue.input$Amount ?? ''}")
            ..addListener(() {
              value =
                  value.copyWith(input$Amount: input$AmountController?.text);
            });
    }
    if (isInSelectionSet('input_Country')) {
      input$CountryController =
          TextEditingController(text: "${initialValue.input$Country ?? ''}")
            ..addListener(() {
              value =
                  value.copyWith(input$Country: input$CountryController?.text);
            });
    }
    if (isInSelectionSet('input_Currency')) {
      input$CurrencyController = TextEditingController(
          text: "${initialValue.input$Currency ?? ''}")
        ..addListener(() {
          value =
              value.copyWith(input$Currency: input$CurrencyController?.text);
        });
    }
    if (isInSelectionSet('input_CustomerMSISDN')) {
      input$CustomerMSISDNController = TextEditingController(
          text: "${initialValue.input$CustomerMSISDN ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              input$CustomerMSISDN: input$CustomerMSISDNController?.text);
        });
    }
    if (isInSelectionSet('input_ServiceProviderCode')) {
      input$ServiceProviderCodeController = TextEditingController(
          text: "${initialValue.input$ServiceProviderCode ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              input$ServiceProviderCode:
                  input$ServiceProviderCodeController?.text);
        });
    }
    if (isInSelectionSet('input_ThirdPartyConversationID')) {
      input$ThirdPartyConversationIDController = TextEditingController(
          text: "${initialValue.input$ThirdPartyConversationID ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              input$ThirdPartyConversationID:
                  input$ThirdPartyConversationIDController?.text);
        });
    }
    if (isInSelectionSet('input_TransactionReference')) {
      input$TransactionReferenceController = TextEditingController(
          text: "${initialValue.input$TransactionReference ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              input$TransactionReference:
                  input$TransactionReferenceController?.text);
        });
    }
    if (isInSelectionSet('input_PurchasedItemsDesc')) {
      input$PurchasedItemsDescController = TextEditingController(
          text: "${initialValue.input$PurchasedItemsDesc ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              input$PurchasedItemsDesc:
                  input$PurchasedItemsDescController?.text);
        });
    }
    if (isInSelectionSet('output_ConversationID')) {
      output$ConversationIDController = TextEditingController(
          text: "${initialValue.output$ConversationID ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              output$ConversationID: output$ConversationIDController?.text);
        });
    }
    if (isInSelectionSet('output_ResponseCode')) {
      output$ResponseCodeController = TextEditingController(
          text: "${initialValue.output$ResponseCode ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              output$ResponseCode: output$ResponseCodeController?.text);
        });
    }
    if (isInSelectionSet('output_ResponseDesc')) {
      output$ResponseDescController = TextEditingController(
          text: "${initialValue.output$ResponseDesc ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              output$ResponseDesc: output$ResponseDescController?.text);
        });
    }
    if (isInSelectionSet('output_ThirdPartyConversationID')) {
      output$ThirdPartyConversationIDController = TextEditingController(
          text: "${initialValue.output$ThirdPartyConversationID ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              output$ThirdPartyConversationID:
                  output$ThirdPartyConversationIDController?.text);
        });
    }
    if (isInSelectionSet('output_TransactionID')) {
      output$TransactionIDController = TextEditingController(
          text: "${initialValue.output$TransactionID ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              output$TransactionID: output$TransactionIDController?.text);
        });
    }
    if (isInSelectionSet('transaction')) {
      var selected = getSelectionNodeData('transaction')?.selectionSet;
      transactionController = TransactionController(
          initialValue: initialValue.transaction ?? Transaction(),
          selectionSet: selected!);
      transactionController?.addListener(() {
        var v = transactionController?.value;
        onTransactionChanged(v!);
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
    if (isInSelectionSet('input_Amount')) {
      input$AmountController?.dispose();
    }
    if (isInSelectionSet('input_Country')) {
      input$CountryController?.dispose();
    }
    if (isInSelectionSet('input_Currency')) {
      input$CurrencyController?.dispose();
    }
    if (isInSelectionSet('input_CustomerMSISDN')) {
      input$CustomerMSISDNController?.dispose();
    }
    if (isInSelectionSet('input_ServiceProviderCode')) {
      input$ServiceProviderCodeController?.dispose();
    }
    if (isInSelectionSet('input_ThirdPartyConversationID')) {
      input$ThirdPartyConversationIDController?.dispose();
    }
    if (isInSelectionSet('input_TransactionReference')) {
      input$TransactionReferenceController?.dispose();
    }
    if (isInSelectionSet('input_PurchasedItemsDesc')) {
      input$PurchasedItemsDescController?.dispose();
    }
    if (isInSelectionSet('output_ConversationID')) {
      output$ConversationIDController?.dispose();
    }
    if (isInSelectionSet('output_ResponseCode')) {
      output$ResponseCodeController?.dispose();
    }
    if (isInSelectionSet('output_ResponseDesc')) {
      output$ResponseDescController?.dispose();
    }
    if (isInSelectionSet('output_ThirdPartyConversationID')) {
      output$ThirdPartyConversationIDController?.dispose();
    }
    if (isInSelectionSet('output_TransactionID')) {
      output$TransactionIDController?.dispose();
    }
    if (isInSelectionSet('transaction')) {
      transactionController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }

    super.dispose();
  }

  void onTransactionChanged(Transaction v) {
    if (value.transaction != v) {
      value = value.copyWith(transaction: v);
      transactionChanged?.call(v);
    }
  }

  void onStatusChanged(PaymentStatus v) {
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
