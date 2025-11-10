import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/home/data/models/home_programs_model.dart';
import 'package:together_test/features/home/domain/entities/home_programs_entity.dart';
import 'package:together_test/features/home/domain/repositories/home_programs_repository.dart';

class HomeProgramsRepositoryImpl implements HomeProgramsRepository {
  @override
  Future<HomeProgramsEntity> getHomePrograms({int limit = 5}) async {
    try {
      final response = await DioHelper.getData(
        url: ApiConfig.homeProgramsEndpoint,
        query: {"limit": limit},
      );

      final List<Program> modelList =
          HomeProgramsModel.fromJson(response.data).data ?? [];
      final programs =
          modelList.map((program) {
            return ProgramEntity(
              id: program.id,
              name: program.name,
              type: program.type,
              language: program.language,
              photoUrl: program.photoUrl,
              bannerUrl: program.bannerUrl,
              photoInfo:
                  program.photoInfo != null
                      ? FileInfoEntity(
                        key: program.photoInfo!.key,
                        name: program.photoInfo!.name,
                      )
                      : null,
              bannerInfo:
                  program.bannerInfo != null
                      ? FileInfoEntity(
                        key: program.bannerInfo!.key,
                        name: program.bannerInfo!.name,
                      )
                      : null,
            );
          }).toList();
      return HomeProgramsEntity(programs: programs);
    } catch (e) {
      throw Exception("Failed to fetch programs: $e");
    }
  }
}
