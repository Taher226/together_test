class ProgramDetailsEntity {
  final ProgramEntity? data;

  ProgramDetailsEntity({this.data});
}

class ProgramEntity {
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
  final InfoEntity? photoInfo;
  final InfoEntity? bannerInfo;
  final List<MediaEntity>? media;
  final List<ProjectEntity>? projects;
  final int? order;
  final String? createdAt;

  ProgramEntity({
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
}

class InfoEntity {
  final String? key;
  final String? name;

  InfoEntity({this.key, this.name});
}

class MediaEntity {
  final int? id;
  final String? mediaUrl;
  final InfoEntity? mediaInfo;
  final int? order;

  MediaEntity({this.id, this.mediaUrl, this.mediaInfo, this.order});
}

class ProjectEntity {
  final int? id;
  final String? name;
  final String? description;
  final List<PlanEntity>? plans;

  ProjectEntity({this.id, this.name, this.description, this.plans});
}

class PlanEntity {
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

  PlanEntity({
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
}
