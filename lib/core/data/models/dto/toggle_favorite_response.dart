class ToggleFavoriteResponse {
  final bool isLiked;
  final int likeCount;
  final String message;

  ToggleFavoriteResponse({
    required this.isLiked,
    required this.likeCount,
    required this.message,
  });

  factory ToggleFavoriteResponse.fromJson(Map<String, dynamic> json) {
    final msg = json['message'] as Map<String, dynamic>? ?? {};
    final result = msg['result'] as Map<String, dynamic>? ?? {};

    return ToggleFavoriteResponse(
      isLiked: result['isLiked'] ?? false,
      likeCount: result['likeCount'] ?? 0,
      message: msg['message'] ?? '',
    );
  }
}
