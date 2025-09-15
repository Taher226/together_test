class ChangeEmailModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;

  ChangeEmailModel({required this.success, this.message, this.messages});

  factory ChangeEmailModel.fromJson(Map<String, dynamic> json) {
    return ChangeEmailModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          (json['messages'] != null && json['messages'] is Map)
              ? (json['messages'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(key, List<String>.from(value)),
              )
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'messages': messages};
  }
}
