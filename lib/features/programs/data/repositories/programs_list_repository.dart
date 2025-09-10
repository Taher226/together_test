import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/programs/data/models/programs_list_model.dart';

class ProgramsListRepository {
  Future<ProgramsListModel> getProgramsList() async {
    final response = await DioHelper.getData(
      url: ApiConfig.programsListEndpoint,
    );
    return ProgramsListModel.fromJson(response.data);
  }
}
