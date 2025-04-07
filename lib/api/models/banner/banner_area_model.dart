class BannerAreaModel {
  List<BannerAreas>? bannerAreas;

  BannerAreaModel({this.bannerAreas});

  BannerAreaModel.fromJson(Map<String, dynamic> json) {
    if (json['banner_areas'] != null) {
      bannerAreas = <BannerAreas>[];
      json['banner_areas'].forEach((v) {
        bannerAreas!.add(BannerAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bannerAreas != null) {
      data['banner_areas'] = bannerAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerAreas {
  int? id;
  String? bannerArea;
  String? createdAt;
  String? updatedAt;

  BannerAreas({this.id, this.bannerArea, this.createdAt, this.updatedAt});

  BannerAreas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerArea = json['banner_area'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner_area'] = bannerArea;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
