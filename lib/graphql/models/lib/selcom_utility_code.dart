enum SelcomUtilityCode {
  VMCASHIN,
  AMCASHIN,
  TPCASHIN,
  EZCASHIN,
  SPCASHIN,
  HPCASHIN,
  TTCASHIN
}

extension SelcomUtilityCodeExt on SelcomUtilityCode {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case SelcomUtilityCode.VMCASHIN:
        return "VMCASHIN";
      case SelcomUtilityCode.AMCASHIN:
        return "AMCASHIN";
      case SelcomUtilityCode.TPCASHIN:
        return "TPCASHIN";
      case SelcomUtilityCode.EZCASHIN:
        return "EZCASHIN";
      case SelcomUtilityCode.SPCASHIN:
        return "SPCASHIN";
      case SelcomUtilityCode.HPCASHIN:
        return "HPCASHIN";
      case SelcomUtilityCode.TTCASHIN:
        return "TTCASHIN";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static SelcomUtilityCode fromJson(String json) {
    switch (json) {
      case "VMCASHIN":
        return SelcomUtilityCode.VMCASHIN;
      case "AMCASHIN":
        return SelcomUtilityCode.AMCASHIN;
      case "TPCASHIN":
        return SelcomUtilityCode.TPCASHIN;
      case "EZCASHIN":
        return SelcomUtilityCode.EZCASHIN;
      case "SPCASHIN":
        return SelcomUtilityCode.SPCASHIN;
      case "HPCASHIN":
        return SelcomUtilityCode.HPCASHIN;
      case "TTCASHIN":
        return SelcomUtilityCode.TTCASHIN;
      default:
        return SelcomUtilityCode.VMCASHIN;
    }
    //return SelcomUtilityCode.values.firstWhere((e) => e.toJson() == json);
  }
}
