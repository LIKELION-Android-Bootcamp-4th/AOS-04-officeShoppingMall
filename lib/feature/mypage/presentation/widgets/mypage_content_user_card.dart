import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';

class MypageContentUserCard extends StatelessWidget {
  const MypageContentUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((MypageViewModel vm) => vm.user!);
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
                  CircleAvatar(
                    backgroundColor: appColorScheme().surfaceContainerHigh,
                    radius: 32,
                    // foregroundImage: AssetImage(user.profile.profileImage?:),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.nickName, style: Theme.of(context).textTheme.titleMedium),
                      Text('고객님, 안녕하세요!', style: Theme.of(context).textTheme.bodyMedium),
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
                    onTap: () => Navigator.pushNamed(context, AppRoutes.orderPaid),
                    child: Column(
                      children: [
                        Text('0', style: Theme.of(context).textTheme.headlineMedium),
                        Text('결제 완료', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.orderShipping),
                    child: Column(
                      children: [
                        Text('1', style: Theme.of(context).textTheme.headlineMedium),
                        Text('배송 중', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.orderDelivered),
                    child: Column(
                      children: [
                        Text('2', style: Theme.of(context).textTheme.headlineMedium),
                        Text('배송 완료', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
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
