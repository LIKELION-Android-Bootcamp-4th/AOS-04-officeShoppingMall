import 'package:flutter/material.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';

class PreferenceContentCountText extends StatefulWidget {
  const PreferenceContentCountText({super.key});

  @override
  State<PreferenceContentCountText> createState() => _PreferenceContentCountTextState();
}

class _PreferenceContentCountTextState extends State<PreferenceContentCountText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: '총 ', style: Theme.of(context).textTheme.titleLarge),
          TextSpan(
            text: '6',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: appColorScheme().primary),
          ),
          TextSpan(text: '개', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
