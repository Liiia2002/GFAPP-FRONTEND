import 'package:flutter/material.dart';
import '../../models/boxCss.dart';
import 'container.dart';
/**
 * 作者：
   时间：
   类描述：可移动的盒子
 */
class MoveContainer extends StatelessWidget {
  static const height =100.0;
  static const margin = 8.0;
  final Color color;
  double x, y;
  final Function(Color color) onDrag;
  MoveContainer(this.color, this.onDrag, this.x, this.y, Key key) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(seconds: 1),
      left: x,
      top: y,
      child: Draggable(
          onDragStarted: () =>
              onDrag(color), 
          child: Box(color),
          feedback: Box(color),//托起的内容
          childWhenDragging: Container(
            width: BoxCss.width,
            height: BoxCss.height,
          )),
    );
  }
}
