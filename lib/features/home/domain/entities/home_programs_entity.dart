import 'package:equatable/equatable.dart';

class HomeProgramsEntity extends Equatable {
  final List<ProgramEntity> programs;

  const HomeProgramsEntity({required this.programs});
  @override
  List<Object?> get props => [programs];
}

class ProgramEntity {
  final int? id;
  final String? name;
  final String? type;
  final String? language;
  final String? photoUrl;
  final String? bannerUrl;
  final FileInfoEntity? photoInfo;
  final FileInfoEntity? bannerInfo;

  const ProgramEntity({
    this.id,
    this.name,
    this.type,
    this.language,
    this.photoUrl,
    this.bannerUrl,
    this.photoInfo,
    this.bannerInfo,
  });
}

class FileInfoEntity {
  final String? key;
  final String? name;

  const FileInfoEntity({required this.key, required this.name});
}
