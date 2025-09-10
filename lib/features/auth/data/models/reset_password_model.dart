class ResetPasswordModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;

  ResetPasswordModel({required this.success, this.message, this.messages});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>>? parsedMessages;

    if (json['messages'] != null) {
      if (json['messages'] is Map<String, dynamic>) {
        parsedMessages = (json['messages'] as Map<String, dynamic>).map(
          (key, value) =>
              MapEntry(key, List<String>.from(value.map((e) => e.toString()))),
        );
      } else {
        parsedMessages = {};
      }
    }

    return ResetPasswordModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages: parsedMessages,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'messages': messages};
  }
}
