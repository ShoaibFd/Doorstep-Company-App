class CategoryModel {
  bool? success;
  List<Data>? data;
  String? message;

  CategoryModel({this.success, this.data, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  int? templateSettingId;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? templateName;
  TemplateSetting? templateSetting;

  Data(
      {this.id,
      this.templateSettingId,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.templateName,
      this.templateSetting});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateSettingId = json['template_setting_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    templateName = json['template_name'];
    templateSetting = json['template_setting'] != null ? TemplateSetting.fromJson(json['template_setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['template_setting_id'] = templateSettingId;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['template_name'] = templateName;
    if (templateSetting != null) {
      data['template_setting'] = templateSetting!.toJson();
    }
    return data;
  }
}

class TemplateSetting {
  int? id;
  String? templateName;
  String? tempImage;
  String? createdAt;
  String? updatedAt;

  TemplateSetting({this.id, this.templateName, this.tempImage, this.createdAt, this.updatedAt});

  TemplateSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateName = json['template_name'];
    tempImage = json['temp_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['template_name'] = templateName;
    data['temp_image'] = tempImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
