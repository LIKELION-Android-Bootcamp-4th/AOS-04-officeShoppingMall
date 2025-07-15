class NotificationDTO {
  final String title;
  final String content;
  final String category;
  final bool isImportant;
  final bool isPinned;
  final int viewCount;
  final String publishedAt;
  final String createdAt;
  final String updatedAt;
  final String id;

  NotificationDTO({required this.title, required this.content, required this.category,
  required this.isImportant, required this.isPinned, required this.viewCount,
  required this.publishedAt, required this.createdAt, required this.updatedAt, required this.id});

  factory NotificationDTO.fromJson (Map<String, dynamic> json) {
    return NotificationDTO(
      title: json['title'],
      content: json['content'],
      category: json['category'],
      isImportant: json['isImportant'],
      isPinned: json['isPinned'],
      viewCount: json['viewCount'],
      publishedAt: json['publishedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id']
    );
  }
}