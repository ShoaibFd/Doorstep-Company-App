class SocialPlatformModel {
  int? status;
  List<SocialPlatformData>? data;

  SocialPlatformModel({this.status, this.data});

  SocialPlatformModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SocialPlatformData>[];
      json['data'].forEach((v) {
        data!.add(SocialPlatformData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialPlatformData {
  String? name;
  String? iconImage;

  SocialPlatformData({this.name, this.iconImage});

  SocialPlatformData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconImage = json['icon_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['icon_image'] = this.iconImage;
    return data;
  }
}
