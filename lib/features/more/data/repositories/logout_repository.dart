import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/logout_model.dart';

class LogoutRepository {
  Future<LogoutModel> logout(String token) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.logoutEndpoint,
        token: token,
        data: null,
      );
      if (response.statusCode == 200) {
        return LogoutModel.fromJson(response.data);
      } else {
        throw Exception('Failed to logout: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Catching Error: ${e.toString()}');
    }
  }
}
