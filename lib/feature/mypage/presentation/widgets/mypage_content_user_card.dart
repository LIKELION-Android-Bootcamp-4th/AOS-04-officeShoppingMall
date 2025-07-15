import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_shopping_mall/core/constants/app_constants.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/mypage/presentation/viewmodel/mypage_viewmodel.dart';
import 'package:office_shopping_mall/feature/order/presentation/viewmodel/order_list_viewmodel.dart';
import 'package:office_shopping_mall/feature/setting/presentation/viewmodel/setting_viewmodel.dart';

class MypageContentUserCard extends StatelessWidget {
  const MypageContentUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((MypageViewModel vm) => vm.user!);
    final imgUrl = context.select((SettingViewModel vm) => vm.uploadImageUrl);
    final orders = context.select((OrderListViewModel vm) => vm.orders);
    ImageProvider? imageProvider;
    String? initImage = user.profile.profileImage;

    if (imgUrl != null) {
      imageProvider = NetworkImage(imgUrl);
    } else if (initImage != null && initImage.isNotEmpty) {
      imageProvider = NetworkImage(initImage);
    } else {
      imageProvider = AssetImage('images/default_profile.jpg');
    }
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
                    backgroundImage: imageProvider,
                  ),

                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.nickName, style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        AppConst.gen.greetingMessage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.setting);
                    },
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
                        Text('${orders.where((a) => a.status == 'pending').length}', style: Theme.of(context).textTheme.headlineMedium),
                        Text('결제 완료', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.orderShipping),
                    child: Column(
                      children: [
                        Text('${orders.where((a) => a.status == 'shipped').length}', style: Theme.of(context).textTheme.headlineMedium),
                        Text('배송 중', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.orderDelivered),
                    child: Column(
                      children: [
                        Text('${orders.where((a) => a.status == 'delivered').length}', style: Theme.of(context).textTheme.headlineMedium),
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
