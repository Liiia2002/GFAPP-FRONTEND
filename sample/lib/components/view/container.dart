import 'package:flutter/material.dart';
import '../../models/boxCss.dart';

class Box extends StatelessWidget {
  final Color color;
  const Box(this.color, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [color, Color.fromARGB(50, 0, 0, 222)]),
          color: color,
          borderRadius: BorderRadius.circular(8.0)),
      width: BoxCss.width,
      height: BoxCss.height, //托起的内容
    );
  }
}
