import 'package:flutter/material.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/verify_otp_model.dart';

class VerifyOtpRepository {
  Future<VerifyOtpModel> verifyOtp({
    required String email,
    required int otp,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.verifyOtpEndpoint,
        data: {'email': email, 'otp': otp},
      );
      debugPrint("✅ Verify OTP response: ${response.data}");

      return VerifyOtpModel.fromJson(response.data);
    } catch (e) {
      debugPrint("❌ General Exception: $e");
      return VerifyOtpModel(success: false, message: e.toString());
    }
  }
}
