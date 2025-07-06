import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> AppBarActionsDefault() {
  return [
    _SearchButton(),
    IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_bell.svg')),
    _CartButton(),
  ];
}

List<Widget> AppBarActionsMypage() {
  return [
    IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_setting.svg')),
    _CartButton(),
  ];
}

List<Widget> AppBarActionsNoBell() => [_SearchButton(), _CartButton()];

class _CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_cart.svg'));
  }
}

class _SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: SvgPicture.asset('images/icon/ic_appbar_search.svg'));
  }
}
