// ignore_for_file: prefer_typing_uninitialized_variables

class ProductsDetailsModel {
  int? productTypeId;
  int? productDetailId;
  int? productCategoryId;
  String? productName;
  String? productCondition;
  int? price;
  String? shortDescription;
  var ratingId;
  var soldItemsId;
  int? deliveryCharges;
  int? discount;
  var authenticProduct;
  String? shippingDays;
  String? productStatus;
  String? createdAt;
  String? updatedAt;
  List<String>? productHighlights;
  List<String>? productDescription;
  List<String>? bannerImages;
  List<String>? descriptionImages;
  String? previewImage;
  String? capacity;
  String? productModel;

  ProductsDetailsModel(
      {this.productTypeId,
      this.productDetailId,
      this.productCategoryId,
      this.productName,
      this.productCondition,
      this.price,
      this.shortDescription,
      this.ratingId,
      this.soldItemsId,
      this.deliveryCharges,
      this.discount,
      this.authenticProduct,
      this.shippingDays,
      this.productStatus,
      this.createdAt,
      this.updatedAt,
      this.productHighlights,
      this.productDescription,
      this.bannerImages,
      this.descriptionImages,
      this.previewImage,
      this.capacity,
      this.productModel});

  ProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    productTypeId = json['product_type_id'];
    productDetailId = json['product_detail_id'];
    productCategoryId = json['product_category_id'];
    productName = json['product_name'];
    productCondition = json['product_condition'];
    price = json['price'];
    shortDescription = json['short_description'];
    ratingId = json['rating_id'];
    soldItemsId = json['sold_items_id'];
    deliveryCharges = json['delivery_charges'];
    discount = json['discount'];
    authenticProduct = json['authentic_product'];
    shippingDays = json['shipping_days'];
    productStatus = json['product_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productHighlights = json['product_highlights'].cast<String>();
    productDescription = json['product_description'].cast<String>();
    bannerImages = json['banner_images'].cast<String>();
    descriptionImages = json['description_images'].cast<String>();
    previewImage = json['preview_image'];
    capacity = json['capacity'];
    productModel = json['product_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_type_id'] = productTypeId;
    data['product_detail_id'] = productDetailId;
    data['product_category_id'] = productCategoryId;
    data['product_name'] = productName;
    data['product_condition'] = productCondition;
    data['price'] = price;
    data['short_description'] = shortDescription;
    data['rating_id'] = ratingId;
    data['sold_items_id'] = soldItemsId;
    data['delivery_charges'] = deliveryCharges;
    data['discount'] = discount;
    data['authentic_product'] = authenticProduct;
    data['shipping_days'] = shippingDays;
    data['product_status'] = productStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['product_highlights'] = productHighlights;
    data['product_description'] = productDescription;
    data['banner_images'] = bannerImages;
    data['description_images'] = descriptionImages;
    data['preview_image'] = previewImage;
    data['capacity'] = capacity;
    data['product_model'] = productModel;
    return data;
  }
}
