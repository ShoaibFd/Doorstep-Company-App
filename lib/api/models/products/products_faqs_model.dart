class ProductsFAQsModel {
  bool? success;
  Data? data;
  String? message;

  ProductsFAQsModel({this.success, this.data, this.message});

  ProductsFAQsModel.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  List<Faqs>? faqs;

  Data({this.productName, this.faqs});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faqs {
  int? id;
  int? productDetailId;
  String? question;
  String? answer;
  String? status;
  String? createdAt;
  String? updatedAt;

  Faqs({this.id, this.productDetailId, this.question, this.answer, this.status, this.createdAt, this.updatedAt});

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productDetailId = json['product_detail_id'];
    question = json['question'];
    answer = json['answer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_detail_id'] = productDetailId;
    data['question'] = question;
    data['answer'] = answer;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
