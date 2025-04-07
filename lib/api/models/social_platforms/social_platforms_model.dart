class SocialPlatformsModel {
  bool? success;
  List<Data>? data;
  String? message;

  SocialPlatformsModel({this.success, this.data, this.message});

  SocialPlatformsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? icon;
  String? url;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.icon, this.url, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['url'] = url;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
