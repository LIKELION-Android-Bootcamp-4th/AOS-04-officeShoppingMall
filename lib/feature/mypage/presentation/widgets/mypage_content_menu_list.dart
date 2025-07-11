import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:office_shopping_mall/feature/mypage/data/menu_item.dart';

class MypageContentMenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = [
      MenuItem(
        'images/icon/ic_history.svg',
        '최근 본 상품',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.recentProd);
        },
      ),
      MenuItem(
        'images/icon/ic_cart.svg',
        '주문 내역',
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.orderPaid);
        },
      ),
      MenuItem('images/icon/ic_comment.svg', '내가 작성한 리뷰'),
      MenuItem('images/icon/ic_inquiry.svg', '문의 내역'),
      MenuItem(
        'images/icon/ic_logout.svg',
        '로그아웃',
        onTap: () async {
          await context.read<AuthViewModel>().logOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            // 홈만 남기고 삭제. 테스트 용
            (route) => route.settings.name == AppRoutes.home,
            // (route) => false,
          );
        },
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var item in items) ...[
            InkWell(
              onTap: item.onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(item.icon),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(item.title, style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        ],
      ),
    );
  }
}
