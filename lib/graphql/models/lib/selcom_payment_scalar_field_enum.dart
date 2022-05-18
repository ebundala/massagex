enum SelcomPaymentScalarFieldEnum {
  id,
  transId,
  amount,
  msisdn,
  operator$,
  reference,
  resultCode,
  status,
  utilityref,
  validation,
  state,
  recordStatus,
  metadata,
  createdAt,
  updatedAt
}

extension SelcomPaymentScalarFieldEnumExt on SelcomPaymentScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case SelcomPaymentScalarFieldEnum.id:
        return "id";
      case SelcomPaymentScalarFieldEnum.transId:
        return "transId";
      case SelcomPaymentScalarFieldEnum.amount:
        return "amount";
      case SelcomPaymentScalarFieldEnum.msisdn:
        return "msisdn";
      case SelcomPaymentScalarFieldEnum.operator$:
        return "operator";
      case SelcomPaymentScalarFieldEnum.reference:
        return "reference";
      case SelcomPaymentScalarFieldEnum.resultCode:
        return "resultCode";
      case SelcomPaymentScalarFieldEnum.status:
        return "status";
      case SelcomPaymentScalarFieldEnum.utilityref:
        return "utilityref";
      case SelcomPaymentScalarFieldEnum.validation:
        return "validation";
      case SelcomPaymentScalarFieldEnum.state:
        return "state";
      case SelcomPaymentScalarFieldEnum.recordStatus:
        return "recordStatus";
      case SelcomPaymentScalarFieldEnum.metadata:
        return "metadata";
      case SelcomPaymentScalarFieldEnum.createdAt:
        return "createdAt";
      case SelcomPaymentScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static SelcomPaymentScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return SelcomPaymentScalarFieldEnum.id;
      case "transId":
        return SelcomPaymentScalarFieldEnum.transId;
      case "amount":
        return SelcomPaymentScalarFieldEnum.amount;
      case "msisdn":
        return SelcomPaymentScalarFieldEnum.msisdn;
      case "operator":
        return SelcomPaymentScalarFieldEnum.operator$;
      case "reference":
        return SelcomPaymentScalarFieldEnum.reference;
      case "resultCode":
        return SelcomPaymentScalarFieldEnum.resultCode;
      case "status":
        return SelcomPaymentScalarFieldEnum.status;
      case "utilityref":
        return SelcomPaymentScalarFieldEnum.utilityref;
      case "validation":
        return SelcomPaymentScalarFieldEnum.validation;
      case "state":
        return SelcomPaymentScalarFieldEnum.state;
      case "recordStatus":
        return SelcomPaymentScalarFieldEnum.recordStatus;
      case "metadata":
        return SelcomPaymentScalarFieldEnum.metadata;
      case "createdAt":
        return SelcomPaymentScalarFieldEnum.createdAt;
      case "updatedAt":
        return SelcomPaymentScalarFieldEnum.updatedAt;
      default:
        return SelcomPaymentScalarFieldEnum.id;
    }
    //return SelcomPaymentScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
