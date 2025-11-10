import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/programs/data/models/programs_list_model.dart';
import 'package:together_test/features/programs/domain/entities/programs_list_entity.dart';
import 'package:together_test/features/programs/domain/repositories/programs_list_repository.dart';

class ProgramsListRepositoryImpl implements ProgramsListRepository {
  @override
  Future<ProgramsListEntity> getProgramsList() async {
    try {
      final response = await DioHelper.getData(
        url: ApiConfig.programsListEndpoint,
      );
      final model = ProgramsListModel.fromJson(response.data);
      final entity =
          model.data.map((program) {
            return ProgramEntity(
              id: program.id,
              name: program.name,
              type: program.type,
              description: program.description,
              about: program.about,
              status: program.status,
              languageId: program.languageId,
              languageCode: program.languageCode,
              languageName: program.languageName,
              photoUrl: program.photoUrl,
              bannerUrl: program.bannerUrl,
              photoInfo:
                  program.photoInfo != null
                      ? InfoEntity(
                        key: program.photoInfo!.key,
                        name: program.photoInfo!.name,
                      )
                      : null,
              bannerInfo:
                  program.bannerInfo != null
                      ? InfoEntity(
                        key: program.bannerInfo!.key,
                        name: program.bannerInfo!.name,
                      )
                      : null,
              media:
                  program.media
                      .map(
                        (m) => MediaEntity(
                          id: m.id,
                          mediaUrl: m.mediaUrl,
                          mediaInfo: InfoEntity(
                            key: m.mediaInfo.key,
                            name: m.mediaInfo.name,
                          ),
                          order: m.order,
                        ),
                      )
                      .toList(),
              projects:
                  program.projects
                      .map(
                        (p) => ProjectEntity(
                          id: p.id,
                          name: p.name,
                          description: p.description,
                          plans:
                              p.plans
                                  .map(
                                    (plan) => PlanEntity(
                                      id: plan.id,
                                      name: plan.name,
                                      countryId: plan.countryId,
                                      country: plan.country,
                                      singleAmount: plan.singleAmount,
                                      dailyAmount: plan.dailyAmount,
                                      weeklyAmount: plan.weeklyAmount,
                                      monthlyAmount: plan.monthlyAmount,
                                      yearlyAmount: plan.yearlyAmount,
                                      defaultSelected: plan.defaultSelected,
                                    ),
                                  )
                                  .toList(),
                        ),
                      )
                      .toList(),
              order: program.order,
              createdAt: program.createdAt,
            );
          }).toList();
      return ProgramsListEntity(programs: entity);
    } catch (e) {
      throw Exception("Failed to fetch programs: $e");
    }
  }
}
