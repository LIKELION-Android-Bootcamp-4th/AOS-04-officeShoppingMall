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
    final image = context.select((SettingViewModel vm) => vm.image);
    ImageProvider? imageProvider;

    if (image != null) {
      imageProvider = FileImage(File(image.path));
    } else if (user.profile.profileImage?.isNotEmpty == true) {
      imageProvider = NetworkImage(user.profile.profileImage!);
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
                    backgroundImage: imageProvider,
                    backgroundColor: appColorScheme().surfaceContainerHigh,
                    radius: 32,
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
                  orderInfo(context: context, state: 'pending', title: '결제 완료'),
                  orderInfo(context: context, state: 'shipped', title: '배송 중'),
                  orderInfo(context: context, state: 'delivered', title: '배송 완료'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget orderInfo({
  required BuildContext context,
  required String state,
  required String title,
}) {
  final orders = context.select((OrderListViewModel vm) => vm.orders);
  return InkWell(
    onTap: () => Navigator.pushNamed(context, AppRoutes.orderPaid),
    child: Column(
      children: [
        Text(
          '${orders.where((a) => a.status == state).length}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ],
    ),
  );
}
