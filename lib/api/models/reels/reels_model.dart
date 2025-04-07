// reels_model.dart

class ReelsResponse {
  bool? success;
  List<ReelModel>? data;
  String? message;

  ReelsResponse({this.success, this.data, this.message});

  ReelsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ReelModel>[];
      json['data'].forEach((v) {
        data!.add(ReelModel.fromJson(v));
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

class ReelModel {
  int? id;
  int? positionId;
  String? title;
  String? description;
  String? video;
  String? createdAt;
  String? updatedAt;
  ReelsPosition? reelsPosition;

  ReelModel({
    this.id,
    this.positionId,
    this.title,
    this.description,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.reelsPosition,
  });

  ReelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    positionId = json['position_id'];
    title = json['title'];
    description = json['description'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reelsPosition = json['reels_position'] != null
        ? ReelsPosition.fromJson(json['reels_position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position_id'] = positionId;
    data['title'] = title;
    data['description'] = description;
    data['video'] = video;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (reelsPosition != null) {
      data['reels_position'] = reelsPosition!.toJson();
    }
    return data;
  }
}

class ReelsPosition {
  int? id;
  String? position;
  String? createdAt;
  String? updatedAt;

  ReelsPosition({this.id, this.position, this.createdAt, this.updatedAt});

  ReelsPosition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}