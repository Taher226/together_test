import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/programs/data/models/program_details_model.dart';

class ProgramDetailsRepository {
  Future<ProgramDetailsModel> getProgramDetails({required int id}) async {
    try {
      final response = await DioHelper.getData(
        url: '${ApiConfig.programDetailsEndpoint}/$id',
      );
      return ProgramDetailsModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch program details: $e");
    }
  }
}
