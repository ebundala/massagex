enum AttachmentType { AUDIO, VIDEO, DOCUMENT, IMAGE }

extension AttachmentTypeExt on AttachmentType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AttachmentType.AUDIO:
        return "AUDIO";
      case AttachmentType.VIDEO:
        return "VIDEO";
      case AttachmentType.DOCUMENT:
        return "DOCUMENT";
      case AttachmentType.IMAGE:
        return "IMAGE";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AttachmentType fromJson(String json) {
    switch (json) {
      case "AUDIO":
        return AttachmentType.AUDIO;
      case "VIDEO":
        return AttachmentType.VIDEO;
      case "DOCUMENT":
        return AttachmentType.DOCUMENT;
      case "IMAGE":
        return AttachmentType.IMAGE;
      default:
        return AttachmentType.AUDIO;
    }
    //return AttachmentType.values.firstWhere((e) => e.toJson() == json);
  }
}
