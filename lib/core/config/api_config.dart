class ApiConfig {
  // Base URL
  static const String baseUrl = 'https://api-test.togetherapps.ca/';

  // Auth endpoints
  static const String registerEndpoint = 'api/v1/users/client/auth/signup';
  static const String sendOtpEndpoint = 'api/v1/users/client/auth/send-otp';
  static const String verifyEmailEndpoint =
      'api/v1/users/client/auth/verify-email';
  static const String loginEndpoint = 'api/v1/users/client/auth/login';
  static const String getCountriesEndpoint = 'api/v1/lookups/geo/getCountries';
  static const String forgetPasswordEndpoint =
      'api/v1/users/client/auth/forget-password';
  static const String resetPasswordEndpoint =
      'api/v1/users/client/auth/reset-password';
  static const String verifyOtpEndpoint = 'api/v1/users/client/auth/check-otp';
  static const String resendOtpEndpoint = 'api/v1/users/client/auth/resend-otp';
  static const String logoutEndpoint = 'api/v1/users/client/auth/logout';

  // Programs endpoints
  static const String homeProgramsEndpoint =
      'api/v1/programs/client/programs/list/home';
  static const String programsListEndpoint =
      'api/v1/programs/client/programs/list';
  static const String programDetailsEndpoint =
      'api/v1/programs/client/programs';

  // Profile endpoints
  static const String showProfileEndpoint = 'api/v1/users/client/profile/show';

  static const String updateProfileEndpoint =
      'api/v1/users/client/profile/update';

  static const String changePasswordEndpoint =
      'api/v1/users/client/profile/change-password';

  static const String changeEmailEndpoint1 =
      'api/v1/users/client/profile/check-password';
  static const String changeEmailEndpoint2 =
      'api/v1/users/client/profile/change-email';
  static const String changeEmailEndpoint3 =
      'api/v1/users/client/profile/reset-email';

  // Timeouts
  static const int connectionTimeout = 10; // seconds
  static const int receiveTimeout = 10; // seconds

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Debug mode
  static const bool debugMode = true;

  // Log API responses
  static void logApiResponse(String endpoint, int statusCode, dynamic data) {
    if (debugMode) {
      print('🌐 API Response for $endpoint:');
      print('   Status Code: $statusCode');
      print('   Data: $data');
    }
  }

  // Log API errors
  static void logApiError(String endpoint, String error) {
    if (debugMode) {
      print('❌ API Error for $endpoint: $error');
    }
  }
}
