import 'package:equatable/equatable.dart';

class ProgramsListEntity extends Equatable {
  final List<ProgramEntity> programs;

  const ProgramsListEntity({required this.programs});
  @override
  List<Object?> get props => [programs];
}

class ProgramEntity {
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
  final InfoEntity? photoInfo;
  final InfoEntity? bannerInfo;
  final List<MediaEntity> media;
  final List<ProjectEntity> projects;
  final int? order;
  final String createdAt;

  const ProgramEntity({
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
  //  @override
  List<Object?> get props => [
    id,
    name,
    type,
    description,
    about,
    status,
    languageId,
    languageCode,
    languageName,
    photoUrl,
    bannerUrl,
    photoInfo,
    bannerInfo,
    media,
    projects,
    order,
    createdAt,
  ];
}

class InfoEntity {
  final String? key;
  final String? name;

  const InfoEntity({required this.key, required this.name});

  //@override
  List<Object?> get props => [key, name];
}

class MediaEntity extends Equatable {
  final int id;
  final String mediaUrl;
  final InfoEntity mediaInfo;
  final int order;

  const MediaEntity({
    required this.id,
    required this.mediaUrl,
    required this.mediaInfo,
    required this.order,
  });

  @override
  List<Object?> get props => [id, mediaUrl, mediaInfo, order];
}

class ProjectEntity extends Equatable {
  final int id;
  final String name;
  final String? description;
  final List<PlanEntity> plans;

  const ProjectEntity({
    required this.id,
    required this.name,
    this.description,
    required this.plans,
  });

  @override
  List<Object?> get props => [id, name, description, plans];
}

class PlanEntity extends Equatable {
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

  const PlanEntity({
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

  @override
  List<Object?> get props => [
    id,
    name,
    countryId,
    country,
    singleAmount,
    dailyAmount,
    weeklyAmount,
    monthlyAmount,
    yearlyAmount,
    defaultSelected,
  ];
}
