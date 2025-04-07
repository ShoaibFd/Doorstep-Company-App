class TemplateSettingsModel {
  bool? success;
  List<Data>? data;
  String? message;

  TemplateSettingsModel({this.success, this.data, this.message});

  TemplateSettingsModel.fromJson(Map<String, dynamic> json) {
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
  String? templateName;
  String? tempImage;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.templateName, this.tempImage, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
