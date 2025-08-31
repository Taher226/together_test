class LoginModel {
  final bool success;
  final String message;
  final List<dynamic>? messages;
  final UserData? data;

  LoginModel({
    required this.success,
    required this.message,
    this.messages,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      messages: json['messages'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "messages": messages,
      "data": data?.toJson(),
    };
  }
}

class UserData {
  final String token;
  final String? photoUrl;
  final String lang;

  UserData({required this.token, this.photoUrl, required this.lang});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'] ?? "",
      photoUrl: json['photo_url'],
      lang: json['lang'] ?? "en",
    );
  }

  Map<String, dynamic> toJson() {
    return {"token": token, "photo_url": photoUrl, "lang": lang};
  }
}
