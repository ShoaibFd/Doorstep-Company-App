class SocialPlatformModel {
  final bool success;
  final List<PlatformData>? data;
  final String message;

  SocialPlatformModel({required this.success, this.data, required this.message});

  factory SocialPlatformModel.fromJson(Map<String, dynamic> json) {
    return SocialPlatformModel(
      success: json['success'],
      data: json['data'] is List ? (json['data'] as List).map((i) => PlatformData.fromJson(i)).toList() : null,
      message: json['message'],
    );
  }
}

class PlatformData {
  final int id;
  final String name;
  final String icon;
  final String url;
  final String createdAt;
  final String updatedAt;

  PlatformData({
    required this.id,
    required this.name,
    required this.icon,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlatformData.fromJson(Map<String, dynamic> json) {
    return PlatformData(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      url: json['url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
