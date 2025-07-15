class AppConst {
  static const appName = 'Walkin';

  static const err = Error();
  static const gen = General();
}

class General {
  const General();

  final greetingMessage = '고객님, 안녕하세요!';

}

class Error {
  const Error();

  final pageNotFound = '페이지를 찾을 수 없습니다';

  final sessionExpiration = '세션이 만료되었습니다. 다시 로그인해주세요.';
  final noAuthority = '권한이 없습니다. 다시 로그인해주세요.';
  final accountMismatch = '이메일 또는 비밀번호가 일치하지 않습니다.';
  final wrongRequest = '잘못된 요청입니다. 다시 로그인해주세요.';
  final inputId = '이메일과 비밀번호를 입력해주세요';
  final checkUpInput = '이메일 또는 비밀번호가 올바르지 않습니다.';
  final alreadyAccounts = '이미 가입된 계정입니다.';

}