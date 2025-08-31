import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/send_otp_model.dart';

class SendOtpRepository {
  Future<SendOtpModel> sendOtp({required String email}) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/send-otp',
        data: {'email': email},
      );
      return SendOtpModel.fromJson(response.data);
    } catch (e) {
      return throw Exception('An error occurred: ${e.toString()}');
    }
  }
}
