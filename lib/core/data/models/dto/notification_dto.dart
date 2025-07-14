class NotificationDTO {
  final String content;
  final String category;
  NotificationDTO({required this.content, required this.category});

  factory NotificationDTO.fromJson(Map<String, dynamic> json) {
    return NotificationDTO(
      content: json['content'] ?? '',
      category: json['category'] ?? 'notice');
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'category': category,
  };
}