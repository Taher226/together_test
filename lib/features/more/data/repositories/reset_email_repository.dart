import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/reset_email_model.dart';

class ResetEmailRepository {
  Future<ResetEmailModel> resetEmail({
    required String token,
    required String email,
    required String password,
    required int otp,
  }) async {
    try {
      final response = await DioHelper.patchData(
        url: ApiConfig.changeEmailEndpoint3,
        data: {'email': email, 'password': password, 'otp': otp},
        token: token,
      );
      return ResetEmailModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to reset email: $e");
    }
  }
}
