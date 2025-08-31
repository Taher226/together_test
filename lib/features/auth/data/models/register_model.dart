class RegisterModel {
  final bool success;
  final String? message;
  final Map<String, List<String>>? messages;

  RegisterModel({required this.success, this.message, this.messages});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          json['messages'] != null
              ? (json['messages'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(
                  key,
                  List<String>.from(value.map((e) => e.toString())),
                ),
              )
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'messages': messages};
  }
}
