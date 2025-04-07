enum BannerType {home, footer, offers }

// enum extension
extension BannerTypeExtension on BannerType {
  String get value {
    switch (this) {
      case BannerType.home:
        return "home";
      case BannerType.footer:
        return "footer";
      case BannerType.offers:
        return "offers";
    }
  }
}
