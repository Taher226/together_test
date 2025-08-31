class VerifyEmailModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;
  final String? data;

  VerifyEmailModel({
    required this.success,
    this.message,
    this.messages,
    this.data,
  });

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'],
      messages:
          json['messages'] != null
              ? Map<String, List<String>>.from(
                json['messages'].map(
                  (key, value) => MapEntry(key, List<String>.from(value)),
                ),
              )
              : null,
    );
  }
}
