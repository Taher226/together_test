class CheckPasswordModel {
  final bool success;
  final String? message;
  final List<String>? messages;

  CheckPasswordModel({required this.success, this.message, this.messages});

  factory CheckPasswordModel.fromJson(Map<String, dynamic> json) {
    return CheckPasswordModel(
      success: json['success'] ?? false,
      message: json['message'],
      messages:
          json['messages'] != null ? List<String>.from(json['messages']) : null,
    );
  }
}
