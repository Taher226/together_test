import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/check_password_model.dart';

class CheckPasswordRepository {
  Future<CheckPasswordModel> checkPassword({
    required String token,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.changeEmailEndpoint1,
        data: {'password': password},
        token: token,
      );
      return CheckPasswordModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to check password: $e");
    }
  }
}
