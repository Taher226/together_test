import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/check_email_model.dart';

class CheckEmailRepository {
  Future<CheckEmailModel> checkEmail(String email) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/check-email',
        data: {'email': email},
      );
      print("====================API Response: ${response.data}");
      print("====================Status Code: ${response.statusCode}");
      if (response.data is Map<String, dynamic>) {
        return CheckEmailModel.fromJson(response.data);
      }
      throw Exception("Unexpected response format: ${response.data}");
    } catch (e) {
      throw Exception('Failed to check email: $e');
    }
  }
}
