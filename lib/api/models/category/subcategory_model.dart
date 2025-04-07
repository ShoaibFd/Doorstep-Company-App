class SubcategoryModel {
  bool? success;
  Data? data;
  String? message;

  SubcategoryModel({this.success, this.data, this.message});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? categoryname;
  List<Subcategories>? subcategories;

  Data({this.categoryname, this.subcategories});

  Data.fromJson(Map<String, dynamic> json) {
    categoryname = json['categoryname'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryname'] = categoryname;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int? id;
  int? templateSettingId;
  int? categoryId;
  String? subCategoryName;
  String? subCategoryImage;
  String? createdAt;
  String? updatedAt;
  String? templateName;
  int? templateId;
  TemplateSetting? templateSetting;

  Subcategories(
      {this.id,
      this.templateSettingId,
      this.categoryId,
      this.subCategoryName,
      this.subCategoryImage,
      this.createdAt,
      this.updatedAt,
      this.templateName,
      this.templateId,
      this.templateSetting});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateSettingId = json['template_setting_id'];
    categoryId = json['category_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryImage = json['sub_category_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    templateName = json['template_name'];
    templateId = json['template_id'];
    templateSetting = json['template_setting'] != null ? TemplateSetting.fromJson(json['template_setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['template_setting_id'] = templateSettingId;
    data['category_id'] = categoryId;
    data['sub_category_name'] = subCategoryName;
    data['sub_category_image'] = subCategoryImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['template_name'] = templateName;
    data['template_id'] = templateId;
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
