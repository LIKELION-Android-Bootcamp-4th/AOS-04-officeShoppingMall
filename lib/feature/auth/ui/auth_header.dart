import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 120,
            color: AppColors.surfaceContainerHighColor,
            alignment: Alignment.center,
            child: Text("앱 아이콘"),
          ),
          SizedBox(height: 16),

          Text(
            "직장인을 위한 스마트 쇼핑몰",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 56),
        ],
      ),
    );
  }
}
