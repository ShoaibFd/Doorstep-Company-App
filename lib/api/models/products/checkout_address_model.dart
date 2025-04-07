class CheckoutAddressModel {
  bool? success;
  String? message;
  List<Data>? data;

  CheckoutAddressModel({this.success, this.message, this.data});

  CheckoutAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? fullName;
  String? phoneNumber;
  String? shippingAddress;
  String? shippingAddress2;
  String? addressType;
  String? area;
  String? streetName;
  String? apartmentOrVilla;
  String? city;
  String? secondaryCity;

  Data(
      {this.userId,
      this.fullName,
      this.phoneNumber,
      this.shippingAddress,
      this.shippingAddress2,
      this.addressType,
      this.area,
      this.streetName,
      this.apartmentOrVilla,
      this.city,
      this.secondaryCity});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    shippingAddress = json['shipping_address'];
    shippingAddress2 = json['shipping_address_2'];
    addressType = json['address_type'];
    area = json['area'];
    streetName = json['street_name'];
    apartmentOrVilla = json['apartment_or_villa'];
    city = json['city'];
    secondaryCity = json['secondary_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['phone_number'] = phoneNumber;
    data['shipping_address'] = shippingAddress;
    data['shipping_address_2'] = shippingAddress2;
    data['address_type'] = addressType;
    data['area'] = area;
    data['street_name'] = streetName;
    data['apartment_or_villa'] = apartmentOrVilla;
    data['city'] = city;
    data['secondary_city'] = secondaryCity;
    return data;
  }
}
