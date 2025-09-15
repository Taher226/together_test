class ResetEmailModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;

  ResetEmailModel({required this.success, this.message, this.messages});

  factory ResetEmailModel.fromJson(Map<String, dynamic> json) {
    return ResetEmailModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          (json['messages'] != null)
              ? (json['messages'] as Map<String, dynamic>).map(
                (key, value) =>
                    MapEntry(key, List<String>.from(value as List<dynamic>)),
              )
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'messages': messages};
  }
}
