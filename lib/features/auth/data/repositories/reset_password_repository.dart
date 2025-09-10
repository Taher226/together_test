import 'package:dio/dio.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/reset_password_model.dart';

class ResetPasswordRepository {
  Future<ResetPasswordModel> resetPassword({
    required String email,
    required int otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await DioHelper.patchData(
        url: ApiConfig.resetPasswordEndpoint,
        data: {
          'email': email,
          'otp': otp,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return ResetPasswordModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResetPasswordModel.fromJson(e.response?.data);
      }
      return ResetPasswordModel(
        success: false,
        message: "Network error occurred",
      );
    } catch (e) {
      return ResetPasswordModel(
        success: false,
        message: "Unexpected error: ${e.toString()}",
      );
    }
  }
}
