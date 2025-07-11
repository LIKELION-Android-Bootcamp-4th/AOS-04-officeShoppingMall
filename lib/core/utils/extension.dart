import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isValidEmail() =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool isValidPhone() => RegExp(r'^\d{2,3}-\d{3,4}-\d{4}$').hasMatch(this);
}

extension IntExtension on int {
  String get toWon => '${NumberFormat('#,###').format(this)}원';

  String get toAmount => NumberFormat('#,###').format(this);
}
