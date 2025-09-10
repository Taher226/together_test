import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/show_profile_model.dart';

class ShowProfileRepository {
  Future<ShowProfileModel> showProfile(String token) async {
    try {
      final response = await DioHelper.getData(
        url: ApiConfig.showProfileEndpoint,
        token: token,
      );
      if (response.statusCode == 200) {
        return ShowProfileModel.fromJson(response.data);
      } else {
        throw Exception('Failed to show profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Catching Profile Error: ${e.toString()}');
    }
  }
}
