class PasswordSettingRequest {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  PasswordSettingRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String,dynamic> toJson(){
    return{
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword
    };
  }
}
