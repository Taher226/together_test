import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/verify_email_model.dart';
import 'package:together_test/features/auth/domain/entities/verify_email_entity.dart';
import 'package:together_test/features/auth/domain/repositories/verify_email_repository.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  @override
  Future<VerifyEmailEntity> verifyEmail({
    required String otp,
    required String email,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/verify-email',
        data: {'otp': otp, 'email': email},
      );
      final model = VerifyEmailModel.fromJson(response.data);
      return VerifyEmailEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
        data: model.data,
      );
    } catch (e) {
      return throw Exception(
        'An error occurred while verifying email: ${e.toString()}',
      );
    }
  }
}
