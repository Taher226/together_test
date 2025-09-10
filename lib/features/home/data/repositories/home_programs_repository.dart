import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/home/data/models/home_programs_model.dart';

class HomeProgramsRepository {
  Future<List<Program>> getHomePrograms({int limit = 5}) async {
    try {
      final response = await DioHelper.getData(
        url: ApiConfig.homeProgramsEndpoint,
        query: {"limit": limit},
      );

      final programsModel = HomeProgramsModel.fromJson(response.data);
      return programsModel.data ?? [];
    } catch (e) {
      throw Exception("Failed to fetch programs: $e");
    }
  }
}
