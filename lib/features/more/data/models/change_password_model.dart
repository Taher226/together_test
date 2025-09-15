class ChangePasswordModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;

  ChangePasswordModel({required this.success, this.message, this.messages});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          json['messages'] != null
              ? Map<String, List<String>>.from(
                (json['messages'] as Map).map(
                  (key, value) =>
                      MapEntry(key.toString(), List<String>.from(value)),
                ),
              )
              : null,
    );
  }
}
