// ignore_for_file: prefer_typing_uninitialized_variables

class ProductsSummaryModel {
  List<Data>? data;

  ProductsSummaryModel({this.data});

  ProductsSummaryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  var productTypeName;
  var productCategoryName;
  String? productName;
  int? price;
  var ratingId;
  var soldItemsId;
  int? deliveryCharges;
  var discount;
  String? productStatus;
  String? createdAt;
  String? updatedAt;
  var capacity;
  var model;
  String? previewImage;

  Data(
      {this.id,
      this.productTypeName,
      this.productCategoryName,
      this.productName,
      this.price,
      this.ratingId,
      this.soldItemsId,
      this.deliveryCharges,
      this.discount,
      this.productStatus,
      this.createdAt,
      this.updatedAt,
      this.capacity,
      this.model,
      this.previewImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTypeName = json['product_type_name'];
    productCategoryName = json['product_category_name'];
    productName = json['product_name'];
    price = json['price'];
    ratingId = json['rating_id'];
    soldItemsId = json['sold_items_id'];
    deliveryCharges = json['delivery_charges'];
    discount = json['discount'];
    productStatus = json['product_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    capacity = json['capacity'];
    model = json['model'];
    previewImage = json['preview_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type_name'] = productTypeName;
    data['product_category_name'] = productCategoryName;
    data['product_name'] = productName;
    data['price'] = price;
    data['rating_id'] = ratingId;
    data['sold_items_id'] = soldItemsId;
    data['delivery_charges'] = deliveryCharges;
    data['discount'] = discount;
    data['product_status'] = productStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['capacity'] = capacity;
    data['model'] = model;
    data['preview_image'] = previewImage;
    return data;
  }
}
