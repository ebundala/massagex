enum SelcomDisbursementScalarFieldEnum {
  id,
  amount,
  reference,
  resultCode,
  status,
  transId,
  userId,
  utilitycode,
  utilityref,
  validation,
  state,
  recordStatus,
  metadata,
  createdAt,
  updatedAt
}

extension SelcomDisbursementScalarFieldEnumExt
    on SelcomDisbursementScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case SelcomDisbursementScalarFieldEnum.id:
        return "id";
      case SelcomDisbursementScalarFieldEnum.amount:
        return "amount";
      case SelcomDisbursementScalarFieldEnum.reference:
        return "reference";
      case SelcomDisbursementScalarFieldEnum.resultCode:
        return "resultCode";
      case SelcomDisbursementScalarFieldEnum.status:
        return "status";
      case SelcomDisbursementScalarFieldEnum.transId:
        return "transId";
      case SelcomDisbursementScalarFieldEnum.userId:
        return "userId";
      case SelcomDisbursementScalarFieldEnum.utilitycode:
        return "utilitycode";
      case SelcomDisbursementScalarFieldEnum.utilityref:
        return "utilityref";
      case SelcomDisbursementScalarFieldEnum.validation:
        return "validation";
      case SelcomDisbursementScalarFieldEnum.state:
        return "state";
      case SelcomDisbursementScalarFieldEnum.recordStatus:
        return "recordStatus";
      case SelcomDisbursementScalarFieldEnum.metadata:
        return "metadata";
      case SelcomDisbursementScalarFieldEnum.createdAt:
        return "createdAt";
      case SelcomDisbursementScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static SelcomDisbursementScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return SelcomDisbursementScalarFieldEnum.id;
      case "amount":
        return SelcomDisbursementScalarFieldEnum.amount;
      case "reference":
        return SelcomDisbursementScalarFieldEnum.reference;
      case "resultCode":
        return SelcomDisbursementScalarFieldEnum.resultCode;
      case "status":
        return SelcomDisbursementScalarFieldEnum.status;
      case "transId":
        return SelcomDisbursementScalarFieldEnum.transId;
      case "userId":
        return SelcomDisbursementScalarFieldEnum.userId;
      case "utilitycode":
        return SelcomDisbursementScalarFieldEnum.utilitycode;
      case "utilityref":
        return SelcomDisbursementScalarFieldEnum.utilityref;
      case "validation":
        return SelcomDisbursementScalarFieldEnum.validation;
      case "state":
        return SelcomDisbursementScalarFieldEnum.state;
      case "recordStatus":
        return SelcomDisbursementScalarFieldEnum.recordStatus;
      case "metadata":
        return SelcomDisbursementScalarFieldEnum.metadata;
      case "createdAt":
        return SelcomDisbursementScalarFieldEnum.createdAt;
      case "updatedAt":
        return SelcomDisbursementScalarFieldEnum.updatedAt;
      default:
        return SelcomDisbursementScalarFieldEnum.id;
    }
    //return SelcomDisbursementScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
