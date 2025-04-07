class ProductFiltersModel {
  bool? success;
  Data? data;
  String? message;

  ProductFiltersModel({this.success, this.data, this.message});

  ProductFiltersModel.fromJson(Map<String, dynamic> json) {
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
  String? productTypeName;
  List<Categories>? categories;

  Data({this.productTypeName, this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    productTypeName = json['product_type_name'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_type_name'] = productTypeName;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? categoryName;
  int? productTypeId;
  String? createdAt;
  String? updatedAt;
  ProductType? productType;

  Categories({this.id, this.categoryName, this.productTypeId, this.createdAt, this.updatedAt, this.productType});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    productTypeId = json['product_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productType = json['product_type'] != null ? ProductType.fromJson(json['product_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    data['product_type_id'] = productTypeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productType != null) {
      data['product_type'] = productType!.toJson();
    }
    return data;
  }
}

class ProductType {
  int? id;
  String? productTitle;
  String? productImage;
  String? createdAt;
  String? updatedAt;

  ProductType({this.id, this.productTitle, this.productImage, this.createdAt, this.updatedAt});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    productImage = json['product_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_title'] = productTitle;
    data['product_image'] = productImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
