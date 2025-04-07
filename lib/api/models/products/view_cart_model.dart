// ignore_for_file: prefer_typing_uninitialized_variables

class ViewCartModel {
  bool? success;
  List<Data>? data;
  String? message;

  ViewCartModel({this.success, this.data, this.message});

  ViewCartModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? productDetailId;
  String? createdAt;
  String? updatedAt;
  User? user;
  ProductDetail? productDetail;

  Data({this.id, this.userId, this.productDetailId, this.createdAt, this.updatedAt, this.user, this.productDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productDetailId = json['product_detail_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    productDetail = json['product_detail'] != null ? ProductDetail.fromJson(json['product_detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_detail_id'] = productDetailId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (productDetail != null) {
      data['product_detail'] = productDetail!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  var firstName;
  var lastName;
  var email;
  var gender;
  var dateOfBirth;
  String? countryCode;
  String? phoneNumber;
  var location;
  var city;
  var area;
  var street;
  var apartment;
  var address;
  var profileImage;
  String? otpExpiresAt;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.countryCode,
      this.phoneNumber,
      this.location,
      this.city,
      this.area,
      this.street,
      this.apartment,
      this.address,
      this.profileImage,
      this.otpExpiresAt,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    city = json['city'];
    area = json['area'];
    street = json['street'];
    apartment = json['apartment'];
    address = json['address'];
    profileImage = json['profile_image'];
    otpExpiresAt = json['otp_expires_at'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['city'] = city;
    data['area'] = area;
    data['street'] = street;
    data['apartment'] = apartment;
    data['address'] = address;
    data['profile_image'] = profileImage;
    data['otp_expires_at'] = otpExpiresAt;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProductDetail {
  int? id;
  int? productCategoryId;
  int? productTypeId;
  String? productName;
  String? productCondition;
  String? shortDescription;
  var price;
  var deliveryCharges;
  String? shippingDays;
  String? productHighlights;
  String? productDescription;
  String? previewImage;
  String? bannerImages;
  String? descriptionImages;
  String? productStatus;
  String? productModel;
  String? capacity;
  int? productQuantity;
  var ratingId;
  var soldItemsId;
  int? discount;
  var authenticProduct;
  var shippingText;
  var policyText;
  var policyRequirements;
  String? createdAt;
  String? updatedAt;

  ProductDetail(
      {this.id,
      this.productCategoryId,
      this.productTypeId,
      this.productName,
      this.productCondition,
      this.shortDescription,
      this.price,
      this.deliveryCharges,
      this.shippingDays,
      this.productHighlights,
      this.productDescription,
      this.previewImage,
      this.bannerImages,
      this.descriptionImages,
      this.productStatus,
      this.productModel,
      this.capacity,
      this.productQuantity,
      this.ratingId,
      this.soldItemsId,
      this.discount,
      this.authenticProduct,
      this.shippingText,
      this.policyText,
      this.policyRequirements,
      this.createdAt,
      this.updatedAt});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCategoryId = json['product_category_id'];
    productTypeId = json['product_type_id'];
    productName = json['product_name'];
    productCondition = json['product_condition'];
    shortDescription = json['short_description'];
    price = json['price'];
    deliveryCharges = json['delivery_charges'];
    shippingDays = json['shipping_days'];
    productHighlights = json['product_highlights'];
    productDescription = json['product_description'];
    previewImage = json['preview_image'];
    bannerImages = json['banner_images'];
    descriptionImages = json['description_images'];
    productStatus = json['product_status'];
    productModel = json['product_model'];
    capacity = json['capacity'];
    productQuantity = json['product_quantity'];
    ratingId = json['rating_id'];
    soldItemsId = json['sold_items_id'];
    discount = json['discount'];
    authenticProduct = json['authentic_product'];
    shippingText = json['shipping_text'];
    policyText = json['policy_text'];
    policyRequirements = json['policy_requirements'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_category_id'] = productCategoryId;
    data['product_type_id'] = productTypeId;
    data['product_name'] = productName;
    data['product_condition'] = productCondition;
    data['short_description'] = shortDescription;
    data['price'] = price;
    data['delivery_charges'] = deliveryCharges;
    data['shipping_days'] = shippingDays;
    data['product_highlights'] = productHighlights;
    data['product_description'] = productDescription;
    data['preview_image'] = previewImage;
    data['banner_images'] = bannerImages;
    data['description_images'] = descriptionImages;
    data['product_status'] = productStatus;
    data['product_model'] = productModel;
    data['capacity'] = capacity;
    data['product_quantity'] = productQuantity;
    data['rating_id'] = ratingId;
    data['sold_items_id'] = soldItemsId;
    data['discount'] = discount;
    data['authentic_product'] = authenticProduct;
    data['shipping_text'] = shippingText;
    data['policy_text'] = policyText;
    data['policy_requirements'] = policyRequirements;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
