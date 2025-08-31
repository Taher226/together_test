import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/features/auth/data/models/send_otp_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class SendOtpRepository {
  Future<SendOtpModel> sendOtp({required String email}) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.sendOtpEndpoint,
        data: {'email': email},
      );
      
      debugPrint("✅ Send OTP Response Status: ${response.statusCode}");
      debugPrint("✅ Send OTP Response Data: ${response.data}");
      
      // Check if the response indicates an error
      if (response.statusCode != null && response.statusCode! >= 400) {
        String errorMessage = 'Failed to send OTP';
        if (response.statusCode == 404) {
          errorMessage = 'User not found or invalid email';
        } else if (response.statusCode == 422) {
          // Check if the error is about email already being taken (which is expected after registration)
          if (response.data['messages'] != null && 
              response.data['messages']['email'] != null &&
              response.data['messages']['email'].toString().contains('already been taken')) {
            // This is expected after registration, treat as success
            debugPrint("✅ Email already taken (expected after registration), proceeding with OTP");
            return SendOtpModel.fromJson(response.data);
          }
          errorMessage = 'Invalid email format';
        } else if (response.statusCode == 429) {
          errorMessage = 'Too many requests. Please wait before trying again.';
        } else if (response.statusCode == 500) {
          errorMessage = 'Server error. Please try again later.';
        }
        
        return SendOtpModel(
          success: false,
          message: errorMessage,
          messages: response.data['messages'] != null 
            ? Map<String, dynamic>.from(response.data['messages'])
            : null,
        );
      }
      
      return SendOtpModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("❌ Send OTP DioException: ${e.message}");
      
      String errorMessage = 'Network error occurred';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timeout. Please check your internet connection.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Request timeout. Please try again.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'No internet connection. Please check your network.';
      }
      
      return SendOtpModel(
        success: false,
        message: errorMessage,
      );
    } catch (e) {
      debugPrint("❌ Send OTP General Exception: $e");
      return SendOtpModel(
        success: false,
        message: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }
}
