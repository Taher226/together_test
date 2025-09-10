import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/features/auth/data/models/register_model.dart';

class RegisterRepository {
  Future<RegisterModel> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String passwordConfirmation,
    int? countryId,
    int? stateId,
    String? city,
    String? postalCode,
    String? address,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.registerEndpoint,
        data: {
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
          "password_confirmation": passwordConfirmation,
          "country_id": countryId,
          "state_id": stateId,
          "city": city,
          "postal_code": postalCode,
          "address": address,
        },
      );

      debugPrint("✅ Response Status: ${response.statusCode}");
      debugPrint("✅ Response Data: ${response.data}");

      // Check if the response indicates an error
      if (response.statusCode != null && response.statusCode! >= 400) {
        // Handle HTTP error status codes
        String errorMessage = 'Registration failed';
        if (response.statusCode == 404) {
          errorMessage = 'User not found or invalid endpoint';
        } else if (response.statusCode == 422) {
          errorMessage = 'Validation error: Please check your input';
        } else if (response.statusCode == 500) {
          errorMessage = 'Server error: Please try again later';
        }

        return RegisterModel(
          success: false,
          message: errorMessage,
          messages:
              response.data['messages'] != null
                  ? Map<String, List<String>>.from(
                    (response.data['messages'] as Map<String, dynamic>).map(
                      (key, value) => MapEntry(
                        key,
                        List<String>.from(value.map((e) => e.toString())),
                      ),
                    ),
                  )
                  : null,
        );
      }

      return RegisterModel.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("❌ DioException: ${e.message}");
      debugPrint("❌ DioException Response: ${e.response?.data}");

      if (e.response != null && e.response?.data != null) {
        return RegisterModel.fromJson(e.response?.data);
      }

      // Handle network errors
      String errorMessage = 'Network error occurred';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage =
            'Connection timeout. Please check your internet connection.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Request timeout. Please try again.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'No internet connection. Please check your network.';
      }

      return RegisterModel(success: false, message: errorMessage);
    } catch (e) {
      debugPrint("❌ General Exception: $e");
      return RegisterModel(
        success: false,
        message: 'An unexpected error occurred: ${e.toString()}',
      );
    }
  }
}
