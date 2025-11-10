import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/reset_email_model.dart';
import 'package:together_test/features/more/domain/entities/reset_email_entity.dart';
import 'package:together_test/features/more/domain/repositories/reset_email_repository.dart';

class ResetEmailRepositoryImpl implements ResetEmailRepository {
  @override
  Future<ResetEmailEntity> resetEmail({
    required String token,
    required String email,
    required String password,
    required int otp,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.changeEmailEndpoint3,
        data: {
          'email': email,
          'password': password,
          'otp': otp,
          '_method': 'patch',
        },
        token: token,
      );
      final model = ResetEmailModel.fromJson(response.data);
      return ResetEmailEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
      );
    } catch (e) {
      throw Exception("Failed to reset email: $e");
    }
  }
}
