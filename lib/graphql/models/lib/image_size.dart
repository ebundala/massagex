enum ImageSize { smallest, small, medium, large, largest }

extension ImageSizeExt on ImageSize {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case ImageSize.smallest:
        return "smallest";
      case ImageSize.small:
        return "small";
      case ImageSize.medium:
        return "medium";
      case ImageSize.large:
        return "large";
      case ImageSize.largest:
        return "largest";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static ImageSize fromJson(String json) {
    switch (json) {
      case "smallest":
        return ImageSize.smallest;
      case "small":
        return ImageSize.small;
      case "medium":
        return ImageSize.medium;
      case "large":
        return ImageSize.large;
      case "largest":
        return ImageSize.largest;
      default:
        return ImageSize.smallest;
    }
    //return ImageSize.values.firstWhere((e) => e.toJson() == json);
  }
}
