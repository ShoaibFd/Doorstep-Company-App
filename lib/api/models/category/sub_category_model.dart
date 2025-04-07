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
  int? categorySubTitleId;
  String? subCategoryName;
  String? subCategoryImage;
  String? createdAt;
  String? updatedAt;
  String? categorySubTitleName;
  CategorySubtitle? categorySubtitle;

  Subcategories(
      {this.id,
      this.templateSettingId,
      this.categoryId,
      this.categorySubTitleId,
      this.subCategoryName,
      this.subCategoryImage,
      this.createdAt,
      this.updatedAt,
      this.categorySubTitleName,
      this.categorySubtitle});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    templateSettingId = json['template_setting_id'];
    categoryId = json['category_id'];
    categorySubTitleId = json['category_sub_title_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryImage = json['sub_category_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categorySubTitleName = json['category_sub_title_name'];
    categorySubtitle = json['category_subtitle'] != null ? CategorySubtitle.fromJson(json['category_subtitle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['template_setting_id'] = templateSettingId;
    data['category_id'] = categoryId;
    data['category_sub_title_id'] = categorySubTitleId;
    data['sub_category_name'] = subCategoryName;
    data['sub_category_image'] = subCategoryImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['category_sub_title_name'] = categorySubTitleName;
    if (categorySubtitle != null) {
      data['category_subtitle'] = categorySubtitle!.toJson();
    }
    return data;
  }
}

class CategorySubtitle {
  int? id;
  int? categoryId;
  String? subTitle;
  String? createdAt;
  String? updatedAt;

  CategorySubtitle({this.id, this.categoryId, this.subTitle, this.createdAt, this.updatedAt});

  CategorySubtitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subTitle = json['sub_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_title'] = subTitle;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
