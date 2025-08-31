class ApiConfig {
  // Base URL
  static const String baseUrl = 'https://api-test.togetherapps.ca/';
  
  // Auth endpoints
  static const String registerEndpoint = 'api/v1/users/client/auth/signup';
  static const String sendOtpEndpoint = 'api/v1/users/client/auth/send-otp';
  static const String verifyEmailEndpoint = 'api/v1/users/client/auth/verify-email';
  static const String loginEndpoint = 'api/v1/users/client/auth/login';
  static const String resetPasswordEndpoint = 'api/v1/users/client/auth/reset-password';
  
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
