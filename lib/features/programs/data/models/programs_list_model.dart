class ProgramsListModel {
  final List<Program> data;

  ProgramsListModel({required this.data});

  factory ProgramsListModel.fromJson(Map<String, dynamic> json) {
    return ProgramsListModel(
      data:
          (json['data'] as List?)?.map((e) => Program.fromJson(e)).toList() ??
          [],
    );
  }
}

class Program {
  final int id;
  final String name;
  final String type;
  final String? description;
  final String? about;
  final String status;
  final int? languageId;
  final String? languageName;
  final String? languageCode;
  final String? photoUrl;
  final String? bannerUrl;
  final Info? photoInfo;
  final Info? bannerInfo;
  final List<Media> media;
  final List<Project> projects;
  final int? order;
  final String createdAt;

  Program({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.about,
    required this.status,
    this.languageId,
    this.languageName,
    this.languageCode,
    this.photoUrl,
    this.bannerUrl,
    this.photoInfo,
    this.bannerInfo,
    required this.media,
    required this.projects,
    this.order,
    required this.createdAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      about: json['about'],
      status: json['status'],
      languageId: json['language_id'],
      languageName: json['language_name'],
      languageCode: json['language_code'],
      photoUrl: json['photo_url'],
      bannerUrl: json['banner_url'],
      photoInfo:
          json['photo_info'] != null ? Info.fromJson(json['photo_info']) : null,
      bannerInfo:
          json['banner_info'] != null
              ? Info.fromJson(json['banner_info'])
              : null,
      media:
          (json['media'] as List?)?.map((e) => Media.fromJson(e)).toList() ??
          [],
      projects:
          (json['projects'] as List?)
              ?.map((e) => Project.fromJson(e))
              .toList() ??
          [],
      order: json['order'],
      createdAt: json['created_at'],
    );
  }
}

class Info {
  final String key;
  final String name;

  Info({required this.key, required this.name});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(key: json['key'], name: json['name']);
  }
}

class Media {
  final int id;
  final String mediaUrl;
  final Info mediaInfo;
  final int order;

  Media({
    required this.id,
    required this.mediaUrl,
    required this.mediaInfo,
    required this.order,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      mediaUrl: json['media_url'],
      mediaInfo: Info.fromJson(json['media_info']),
      order: json['order'],
    );
  }
}

class Project {
  final int id;
  final String name;
  final String? description;
  final List<Plan> plans;

  Project({
    required this.id,
    required this.name,
    this.description,
    required this.plans,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      plans:
          (json['plans'] as List?)?.map((e) => Plan.fromJson(e)).toList() ?? [],
    );
  }
}

class Plan {
  final int id;
  final String? name;
  final int? countryId;
  final String? country;
  final String singleAmount;
  final String dailyAmount;
  final String weeklyAmount;
  final String monthlyAmount;
  final String yearlyAmount;
  final String defaultSelected;

  Plan({
    required this.id,
    this.name,
    this.countryId,
    this.country,
    required this.singleAmount,
    required this.dailyAmount,
    required this.weeklyAmount,
    required this.monthlyAmount,
    required this.yearlyAmount,
    required this.defaultSelected,
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
