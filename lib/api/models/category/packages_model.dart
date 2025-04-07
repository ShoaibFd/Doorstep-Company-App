class ProjectsModel {
  bool? success;
  Data? data;
  String? message;

  ProjectsModel({this.success, this.data, this.message});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
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
  List<NewHomeProjects>? newHomeProjects;

  Data({this.newHomeProjects});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['New Home Projects'] != null) {
      newHomeProjects = <NewHomeProjects>[];
      json['New Home Projects'].forEach((v) {
        newHomeProjects!.add(NewHomeProjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newHomeProjects != null) {
      data['New Home Projects'] = newHomeProjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewHomeProjects {
  int? id;
  String? title;
  String? image;

  NewHomeProjects({this.id, this.title, this.image});

  NewHomeProjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
