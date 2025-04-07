class ApiEndpoints {
  static const String baseUrl = 'https://doorstep.motionwing.pk/api';

  static const String categories = '$baseUrl/category';
  static const String subCategories = '$baseUrl/subcategory';
  static const String categoryHeading = '$baseUrl/category_heading';
  static const String subscriptionPackage = '$baseUrl/subscription_package';
  static const String banners = '$baseUrl/banners';
  static const String bannerAreas = '$baseUrl/banner_areas';
  static const String services = '$baseUrl/services/4';
  static const String sendOtp = '$baseUrl/send-otp';
  static const String verifyOtp = '$baseUrl/verify-otp';
  static const String createAccount = '$baseUrl/profile/update';
  static const String updateProfile = '$baseUrl/update-profile';
  static const String userLocation = '$baseUrl/user-location/store';
  static const String suggestion = '$baseUrl/user-suggestions';
  static const String template = '$baseUrl/templates';
  static const String projects = '$baseUrl/new_home_projects';
  static const String reels = '$baseUrl/reels';
  static const String subCategory = '$baseUrl/subcategory';
  static const String categorySubtitle = '$baseUrl/category_subtitles';
  static const String socialPlatforms = '$baseUrl/social_platforms';
  static const String productsType = '$baseUrl/products_types';
  static const String productsDetails = '$baseUrl/product_details';
  static const String productsFilters = '$baseUrl/product_filters';
  static const String productsSummary = '$baseUrl/product_summary';
  static const String productsFaqs = '$baseUrl/faqs_product';
  static const String addToCart = '$baseUrl/cart/store';
  static const String viewCart = '$baseUrl/cart/view';
  static const String postCheckout = '$baseUrl/checkout/store';
  static const String checkoutAddress = '$baseUrl/checkouts/shipping_details';
}
