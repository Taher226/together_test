import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/verify_email_model.dart';

class VerifyEmailRepository {
  Future<VerifyEmailModel> verifyEmail({
    required String otp,
    required String email,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/verify-email',
        data: {'otp': otp, 'email': email},
      );
      return VerifyEmailModel.fromJson(response.data);
    } catch (e) {
      return throw Exception('An error occurred: ${e.toString()}');
    }
  }
}
