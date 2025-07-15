import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_shopping_mall/core/constants/app_routes.dart';
import 'package:office_shopping_mall/core/theme/theme.dart';
import 'package:office_shopping_mall/feature/cart/presentation/viewmodel/cart_viewmodel.dart';

List<Widget> appBarActionsDefault() => [_SearchButton(), _BellButton(), _CartButton()];

List<Widget> appBarActionsMypage() => [_SettingButton(), _CartButton()];

List<Widget> appBarActionsNoBell() => [_SearchButton(), _CartButton()];

class _CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartViewModel>().carts.length;
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -2, end: -2),
      showBadge: cartCount > 0,
      badgeContent: Text('$cartCount', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      badgeStyle: badges.BadgeStyle(badgeColor: appColorScheme().secondary, padding: EdgeInsets.all(6)),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.cart);
        },
        icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg'),
      ),
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
