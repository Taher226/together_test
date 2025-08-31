class CheckEmailModel {
  bool success;
  List<dynamic>? messages;
  String message;

  CheckEmailModel({
    required this.success,
    this.messages,
    required this.message,
  });

  factory CheckEmailModel.fromJson(Map<String, dynamic> json) {
    return CheckEmailModel(
      success: json['success'],
      messages:
          json.containsKey('messages')
              ? List<dynamic>.from(json['messages'])
              : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'messages': messages, 'message': message};
  }
}
