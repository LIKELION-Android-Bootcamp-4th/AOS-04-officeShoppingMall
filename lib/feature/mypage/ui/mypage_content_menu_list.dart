import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/feature/mypage/data/menu_item.dart';

class MypageContentMenuList extends StatelessWidget {
  List<MenuItem> items = [
    MenuItem('images/icon/ic_history.svg', '최근 본 상품'),
    MenuItem('images/icon/ic_cart.svg', '주문 내역'),
    MenuItem('images/icon/ic_comment.svg', '리뷰'),
    MenuItem('images/icon/ic_inquiry.svg', '문의 내역'),
    MenuItem('images/icon/ic_logout.svg', '로그아웃'),
  ];

  @override
  Widget build(BuildContext context) {
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
                    Expanded(child: Text(item.title, style: Theme.of(context).textTheme.titleSmall)),
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
