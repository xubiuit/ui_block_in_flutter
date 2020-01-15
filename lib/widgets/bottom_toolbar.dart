import 'package:flutter/material.dart';
import 'package:ui_block_in_flutter/tik_tok_icons_icons.dart';

class BottomToolbar extends StatelessWidget {
  static const double NavigationIconSize = 20.0;
  static const double CreateButtonWidth = 35.0;

  Widget get _getCustomCreateIcon => Container(
      width: 45.0,
      height: 25.0,
      child: Stack(children: [
        Container(
            margin: EdgeInsets.only(left: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0))),
        Container(
            margin: EdgeInsets.only(right: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0))),
        Center(
            child: Container(
          height: double.infinity,
          width: CreateButtonWidth - 5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7.0)),
          child: Icon(
            Icons.add,
            size: 20.0,
          ),
        )),
      ]));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(TikTokIcons.home, color: Colors.white, size: NavigationIconSize),
        Icon(TikTokIcons.search, color: Colors.white, size: NavigationIconSize),
        _getCustomCreateIcon,
        Icon(TikTokIcons.messages,
            color: Colors.white, size: NavigationIconSize),
        Icon(TikTokIcons.profile, color: Colors.white, size: NavigationIconSize)
      ],
    );
  }
}
