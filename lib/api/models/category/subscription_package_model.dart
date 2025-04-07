class SubscriptionPackagesModel {
  bool? success;
  Data? data;
  String? message;

  SubscriptionPackagesModel({this.success, this.data, this.message});

  SubscriptionPackagesModel.fromJson(Map<String, dynamic> json) {
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
  List<SubscriptionPackages>? subscriptionPackages;

  Data({this.subscriptionPackages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Subscription Packages'] != null) {
      subscriptionPackages = <SubscriptionPackages>[];
      json['Subscription Packages'].forEach((v) {
        subscriptionPackages!.add(SubscriptionPackages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subscriptionPackages != null) {
      data['Subscription Packages'] = subscriptionPackages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubscriptionPackages {
  int? id;
  int? categoryId;
  String? categoryName;
  String? image;

  SubscriptionPackages({this.id, this.categoryId, this.categoryName, this.image});

  SubscriptionPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['image'] = image;
    return data;
  }
}
