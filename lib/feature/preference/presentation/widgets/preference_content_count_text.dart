import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/preference/presentation/viewmodel/preference_viewmodel.dart';

class PreferenceContentCountText extends StatefulWidget {
  const PreferenceContentCountText({super.key});

  @override
  State<PreferenceContentCountText> createState() => _PreferenceContentCountTextState();
}

class _PreferenceContentCountTextState extends State<PreferenceContentCountText> {
  @override
  Widget build(BuildContext context) {
    final favorites = context.select((PreferenceViewModel vm) => vm.favorites);
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: '총 ', style: Theme.of(context).textTheme.titleLarge),
          TextSpan(
            text: favorites.length.toString(),
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
