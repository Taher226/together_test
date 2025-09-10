class ProgramDetailsModel {
  final ProgramDetails? data;

  ProgramDetailsModel({this.data});

  factory ProgramDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProgramDetailsModel(
      data: json['data'] != null ? ProgramDetails.fromJson(json['data']) : null,
    );
  }
}

class ProgramDetails {
  final int? id;
  final String? name;
  final String? type;
  final String? description;
  final String? about;
  final String? status;
  final String? language;
  final String? languageName;
  final String? photoUrl;
  final String? bannerUrl;
  final PhotoInfo? photoInfo;
  final BannerInfo? bannerInfo;
  final List<Media>? media;
  final List<Project>? projects;
  final int? order;
  final String? createdAt;

  ProgramDetails({
    this.id,
    this.name,
    this.type,
    this.description,
    this.about,
    this.status,
    this.language,
    this.languageName,
    this.photoUrl,
    this.bannerUrl,
    this.photoInfo,
    this.bannerInfo,
    this.media,
    this.projects,
    this.order,
    this.createdAt,
  });

  factory ProgramDetails.fromJson(Map<String, dynamic> json) {
    return ProgramDetails(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      about: json['about'],
      status: json['status'],
      language: json['language'],
      languageName: json['language_name'],
      photoUrl: json['photo_url'],
      bannerUrl: json['banner_url'],
      photoInfo:
          json['photo_info'] != null
              ? PhotoInfo.fromJson(json['photo_info'])
              : null,
      bannerInfo:
          json['banner_info'] != null
              ? BannerInfo.fromJson(json['banner_info'])
              : null,
      media:
          json['media'] != null
              ? List<Media>.from(json['media'].map((x) => Media.fromJson(x)))
              : [],
      projects:
          json['projects'] != null
              ? List<Project>.from(
                json['projects'].map((x) => Project.fromJson(x)),
              )
              : [],
      order: json['order'],
      createdAt: json['created_at'],
    );
  }
}

class PhotoInfo {
  final String? key;
  final String? name;

  PhotoInfo({this.key, this.name});

  factory PhotoInfo.fromJson(Map<String, dynamic> json) {
    return PhotoInfo(key: json['key'], name: json['name']);
  }
}

class BannerInfo {
  final String? key;
  final String? name;

  BannerInfo({this.key, this.name});

  factory BannerInfo.fromJson(Map<String, dynamic> json) {
    return BannerInfo(key: json['key'], name: json['name']);
  }
}

class Media {
  final int? id;
  final String? mediaUrl;
  final MediaInfo? mediaInfo;
  final int? order;

  Media({this.id, this.mediaUrl, this.mediaInfo, this.order});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      mediaUrl: json['media_url'],
      mediaInfo:
          json['media_info'] != null
              ? MediaInfo.fromJson(json['media_info'])
              : null,
      order: json['order'],
    );
  }
}

class MediaInfo {
  final String? key;
  final String? name;

  MediaInfo({this.key, this.name});

  factory MediaInfo.fromJson(Map<String, dynamic> json) {
    return MediaInfo(key: json['key'], name: json['name']);
  }
}

class Project {
  final int? id;
  final String? name;
  final String? description;
  final List<Plan>? plans;

  Project({this.id, this.name, this.description, this.plans});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      plans:
          json['plans'] != null
              ? List<Plan>.from(json['plans'].map((x) => Plan.fromJson(x)))
              : [],
    );
  }
}

class Plan {
  final int? id;
  final String? name;
  final int? countryId;
  final String? country;
  final String? singleAmount;
  final String? dailyAmount;
  final String? weeklyAmount;
  final String? monthlyAmount;
  final String? yearlyAmount;
  final String? defaultSelected;

  Plan({
    this.id,
    this.name,
    this.countryId,
    this.country,
    this.singleAmount,
    this.dailyAmount,
    this.weeklyAmount,
    this.monthlyAmount,
    this.yearlyAmount,
    this.defaultSelected,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
      countryId: json['country_id'],
      country: json['country'],
      singleAmount: json['single_amount'],
      dailyAmount: json['daily_amount'],
      weeklyAmount: json['weekly_amount'],
      monthlyAmount: json['monthly_amount'],
      yearlyAmount: json['yearly_amount'],
      defaultSelected: json['default_selected'],
    );
  }
}
