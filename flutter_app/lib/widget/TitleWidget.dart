import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String value;
  TitleWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.red,
            width: 5,
          ),
        ),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 13,
        ), //黑灰色
      ),
    );
  }
}
