import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class MypageContentUserCard extends StatelessWidget {
  const MypageContentUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Card(
        elevation: 0,
        color: appColorScheme().surfaceContainerLow,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: appColorScheme().surfaceContainerHigh, radius: 32),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('data', style: Theme.of(context).textTheme.titleMedium),
                      Text('data', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'images/icon/ic_edit.svg',
                      colorFilter: ColorFilter.mode(
                        appColorScheme().surfaceContainerHigh,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.delivery),
                    child: Column(
                      children: [
                        Text('0', style: Theme.of(context).textTheme.headlineMedium),
                        Text('결제 완료', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text('1', style: Theme.of(context).textTheme.headlineMedium),
                      Text('배송 중', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Column(
                    children: [
                      Text('2', style: Theme.of(context).textTheme.headlineMedium),
                      Text('배송 완료', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
