import 'package:dio/dio.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/reset_password_model.dart';
import 'package:together_test/features/auth/domain/entities/reset_password_entity.dart';
import 'package:together_test/features/auth/domain/repositories/reset_password_repository.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  @override
  Future<ResetPasswordEntity> resetPassword({
    required String email,
    required int otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.resetPasswordEndpoint,
        data: {
          'email': email,
          'otp': otp,
          'password': password,
          'password_confirmation': passwordConfirmation,
          '_method': 'patch',
        },
      );
      final model = ResetPasswordModel.fromJson(response.data);
      return ResetPasswordEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final model = ResetPasswordModel.fromJson(e.response?.data);

        return ResetPasswordEntity(
          success: model.success,
          message: model.message,
          messages: model.messages,
        );
      }
      return ResetPasswordEntity(
        success: false,
        message: "Network error occurred",
      );
    } catch (e) {
      return ResetPasswordEntity(
        success: false,
        message: "Unexpected error: ${e.toString()}",
      );
    }
  }
}
