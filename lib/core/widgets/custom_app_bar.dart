import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final bool centerTitle;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    super.key,
    this.title = AppConstants.appName,
    this.leading,
    this.actions = const [],
    this.centerTitle = false,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) {

    final TextStyle defaultTextStyle = GoogleFonts.roboto(
      fontSize: title == AppConstants.appName ? 30 : 24,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    );

    return AppBar(
      title: Text(
        title,
        style: titleTextStyle ?? defaultTextStyle
      ),
      centerTitle: centerTitle,
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
