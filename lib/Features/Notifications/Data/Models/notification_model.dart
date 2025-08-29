class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String? readAt;
  final String createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    this.readAt,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      readAt: json['read_at'],
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'read_at': readAt,
      'created_at': createdAt,
    };
  }
}
