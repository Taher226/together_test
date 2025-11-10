import 'package:flutter/material.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/verify_otp_model.dart';
import 'package:together_test/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:together_test/features/auth/domain/repositories/verify_otp_repository.dart';

class VerifyOtpRepositoryImpl implements VerifyOtpRepository {
  @override
  Future<VerifyOtpEntity> verifyOtp(String email, int otp) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.verifyOtpEndpoint,
        data: {'email': email, 'otp': otp},
      );
      debugPrint("✅ Verify OTP response: ${response.data}");
      final model = VerifyOtpModel.fromJson(response.data);
      return VerifyOtpEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
      );
    } catch (e) {
      debugPrint("❌ General Exception: $e");
      return VerifyOtpEntity(success: false, message: e.toString());
    }
  }
}
