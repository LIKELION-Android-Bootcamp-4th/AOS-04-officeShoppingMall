import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeContentCategory extends StatelessWidget {
  const HomeContentCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {},
              splashFactory: NoSplash.splashFactory,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/icon/ic_close.svg'),
                  Text('이름 ${index + 1}', style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
