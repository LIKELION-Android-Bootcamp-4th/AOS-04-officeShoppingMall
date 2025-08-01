import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Walkin", style: Theme.of(context).textTheme.displayLarge),
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
