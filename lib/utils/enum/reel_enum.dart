enum ReelType { home, offers }

// enum extension
extension ReelTypeExtension on ReelType {
  String get value {
    switch (this) {
      case ReelType.home:
        return "home";
      case ReelType.offers:
        return "offers";
    }
  }
}
