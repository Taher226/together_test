class EditProfileModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;

  EditProfileModel({required this.success, this.message, this.messages});

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          json['messages'] != null
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
