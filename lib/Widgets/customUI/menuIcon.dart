import 'package:flutter/material.dart';
import '../AppDrawer.dart';
import 'colors.dart';
import 'icons.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon(
      {Key key, this.color = PrimaryDarkColor, this.bg = SecondryColorLight})
      : super(key: key);

  final Color color;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bg,
        ),
        child: Builder(
          builder: (BuildContext appBarContext) {
            return IconButton(
                onPressed: () {
                  AppDrawer.of(appBarContext).toggle();
                },
                icon: Icon(  MyFlutterApp.menu,
                  color: color,));
          },
        ),
      ),
    );
  }
}
