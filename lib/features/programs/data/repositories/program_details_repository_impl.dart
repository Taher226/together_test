import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/programs/data/models/program_details_model.dart';
import 'package:together_test/features/programs/domain/entities/program_details_entity.dart';
import 'package:together_test/features/programs/domain/repositories/program_details_repository.dart';

class ProgramDetailsRepositoryImpl implements ProgramDetailsRepository {
  @override
  Future<ProgramDetailsEntity> getProgramDetails({required int id}) async {
    try {
      final response = await DioHelper.getData(
        url: '${ApiConfig.programDetailsEndpoint}/$id',
      );
      final model = ProgramDetailsModel.fromJson(response.data);
      final entity =
          model.data != null
              ? ProgramEntity(
                id: model.data!.id,
                name: model.data!.name,
                type: model.data!.type,
                description: model.data!.description,
                about: model.data!.about,
                status: model.data!.status,
                language: model.data!.language,
                languageName: model.data!.languageName,
                photoUrl: model.data!.photoUrl,
                bannerUrl: model.data!.bannerUrl,
                photoInfo:
                    model.data!.photoInfo != null
                        ? InfoEntity(
                          key: model.data!.photoInfo!.key,
                          name: model.data!.photoInfo!.name,
                        )
                        : null,
                bannerInfo:
                    model.data!.bannerInfo != null
                        ? InfoEntity(
                          key: model.data!.bannerInfo!.key,
                          name: model.data!.bannerInfo!.name,
                        )
                        : null,
                media:
                    model.data!.media
                        ?.map(
                          (m) => MediaEntity(
                            id: m.id,
                            mediaUrl: m.mediaUrl,
                            mediaInfo:
                                m.mediaInfo != null
                                    ? InfoEntity(
                                      key: m.mediaInfo!.key,
                                      name: m.mediaInfo!.name,
                                    )
                                    : null,
                            order: m.order,
                          ),
                        )
                        .toList() ??
                    [],
                projects:
                    model.data!.projects
                        ?.map(
                          (p) => ProjectEntity(
                            id: p.id,
                            name: p.name,
                            description: p.description,
                            plans:
                                p.plans
                                    ?.map(
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
                                    .toList() ??
                                [],
                          ),
                        )
                        .toList() ??
                    [],
                order: model.data!.order,
                createdAt: model.data!.createdAt,
              )
              : null;
      return ProgramDetailsEntity(data: entity);
    } catch (e) {
      throw Exception("Failed to fetch program details: $e");
    }
  }
}
