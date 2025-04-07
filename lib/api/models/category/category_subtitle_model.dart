class CategorySubtitleModel {
  bool? success;
  List<Data>? data;
  String? message;

  CategorySubtitleModel({this.success, this.data, this.message});

  CategorySubtitleModel.fromJson(Map<String, dynamic> json) {
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
  int? categoryId;
  String? subTitle;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Data({this.id, this.categoryId, this.subTitle, this.createdAt, this.updatedAt, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subTitle = json['sub_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_title'] = subTitle;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  int? templateSettingId;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.templateSettingId, this.name, this.image, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateSettingId = json['template_setting_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['template_setting_id'] = templateSettingId;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
