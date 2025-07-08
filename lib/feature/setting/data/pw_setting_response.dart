class PasswordSettingResponse {
  final bool success;
  final String message;
  final DateTime timestamp;
  final PasswordChangeSuccess? data;
  final PasswordChangeFail? error;

  PasswordSettingResponse({
    required this.success,
    required this.message,
    required this.timestamp,
    this.data,
    this.error,
  });

  factory PasswordSettingResponse.fromJson(Map<String, dynamic> json) {
    final bool isSuccess = json['success'] as bool;

    return PasswordSettingResponse(
      success: isSuccess,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: isSuccess && json['data'] != null
          ? PasswordChangeSuccess.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      error: !isSuccess && json['error'] != null && json['error'] is Map
          ? PasswordChangeFail.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PasswordChangeSuccess {
  final DateTime changedAt;
  final bool sessionInvalidated;

  PasswordChangeSuccess({
    required this.changedAt,
    required this.sessionInvalidated,
  });

  factory PasswordChangeSuccess.fromJson(Map<String, dynamic> json) {
    return PasswordChangeSuccess(
      changedAt: DateTime.parse(json['changedAt'] as String),
      sessionInvalidated: json['sessionInvalidated'] as bool,
    );
  }
}

class PasswordChangeFail {
  final String? type;
  final List<String>? details;

  PasswordChangeFail({
    this.type,
    this.details,
  });

  factory PasswordChangeFail.fromJson(Map<String, dynamic> json) {
    return PasswordChangeFail(
      type: json['type'] as String?,
      details: json['details'] != null
          ? List<String>.from(json['details'] as List)
          : null,
    );
  }
}