import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

// PreferredSizeWidget: 자신의 크기를 부모에게 알려줌. 부모에게 이정도 공간을 할당받겠다 요청.
// 추가로 Scaffold 위젯이 PreferredSizeWidget 타입의 위젯을 전달받기를 기대함
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.title = AppConstants.appName,
    this.leading,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 8),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: title == AppConstants.appName ? 30 : 24,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        ),
      ),
      leading: leading,
      actions: actions,
      elevation: 1,
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
