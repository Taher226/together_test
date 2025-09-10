class HomeProgramsModel {
  List<Program>? data;

  HomeProgramsModel({this.data});

  HomeProgramsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Program>[];
      json['data'].forEach((v) {
        data!.add(Program.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Program {
  int? id;
  String? name;
  String? type;
  String? language;
  String? photoUrl;
  String? bannerUrl;
  FileInfo? photoInfo;
  FileInfo? bannerInfo;

  Program({
    this.id,
    this.name,
    this.type,
    this.language,
    this.photoUrl,
    this.bannerUrl,
    this.photoInfo,
    this.bannerInfo,
  });

  Program.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    language = json['language'];
    photoUrl = json['photo_url'];
    bannerUrl = json['banner_url'];
    photoInfo =
        json['photo_info'] != null
            ? FileInfo.fromJson(json['photo_info'])
            : null;
    bannerInfo =
        json['banner_info'] != null
            ? FileInfo.fromJson(json['banner_info'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['language'] = language;
    data['photo_url'] = photoUrl;
    data['banner_url'] = bannerUrl;
    if (photoInfo != null) {
      data['photo_info'] = photoInfo!.toJson();
    }
    if (bannerInfo != null) {
      data['banner_info'] = bannerInfo!.toJson();
    }
    return data;
  }
}

class FileInfo {
  String? key;
  String? name;

  FileInfo({this.key, this.name});

  FileInfo.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key'] = key;
    data['name'] = name;
    return data;
  }
}
