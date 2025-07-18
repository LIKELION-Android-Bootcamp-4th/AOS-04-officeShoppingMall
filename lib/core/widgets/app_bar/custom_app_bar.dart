import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

// PreferredSizeWidget: 자신의 크기를 부모에게 알려줌. 부모에게 이정도 공간을 할당받겠다 요청.
// 추가로 Scaffold 위젯이 PreferredSizeWidget 타입의 위젯을 전달받기를 기대함
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLeading;
  final List<Widget> actions;
  final bool centerTitle;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    super.key,
    this.title = AppConst.appName,
    this.isLeading = true,
    this.actions = const [],
    this.centerTitle = false,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 8),
      title: Text(title, style: titleTextStyle ?? appTextTheme().headlineMedium),
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: isLeading
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('images/icon/ic_back.svg'),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
