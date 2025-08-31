class SendOtpModel {
  final bool success;
  final String? message;
  final Map<String, dynamic>? messages; // للأخطاء

  SendOtpModel({required this.success, this.message, this.messages});

  factory SendOtpModel.fromJson(Map<String, dynamic> json) {
    return SendOtpModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          json['messages'] != null
              ? Map<String, dynamic>.from(json['messages'])
              : null,
    );
  }
}
