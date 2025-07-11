import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_content_container.dart';

import '../../../../core/theme/theme.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';

class ReviewItem extends StatelessWidget{
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((MypageViewModel vm) => vm.user!);

    return Container(
        width: double.infinity,
        height: 120,

        child: ProductContentContainer(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: appColorScheme().surfaceContainerHigh,
                    radius: 32,
                    foregroundImage: AssetImage(
                      user.profile.profileImage != null
                          ? 'images/default_profile.jpg'
                          : user.profile.profileImage!,
                    ),
                  ),

                  SizedBox(width: 20),


                ]
            )
        )
    );
  }

}