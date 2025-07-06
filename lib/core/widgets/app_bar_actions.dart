import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';

List<Widget> AppBarActionsDefault() => [_SearchButton(), _BellButton(), _CartButton()];

List<Widget> AppBarActionsMypage() => [_SettingButton(), _CartButton()];

List<Widget> AppBarActionsNoBell() => [_SearchButton(), _CartButton()];

class _CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.cart);
      },
      icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg'),
    );
  }
}

class _SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.search);
      },
      icon: SvgPicture.asset('images/icon/ic_appbar_search.svg'),
    );
  }
}

class _SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.setting);
      },
      icon: SvgPicture.asset('images/icon/ic_appbar_setting.svg'),
    );
  }
}

class _BellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.notification);
      },
      icon: SvgPicture.asset('images/icon/ic_appbar_bell.svg'),
    );
  }
}
