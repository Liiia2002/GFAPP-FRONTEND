import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String test;
  const LoadingWidget({Key? key, required this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              color: Colors.pink.shade200,
              strokeWidth: 2.0,
            ),
            SizedBox(width: 20),
            Text(
              this.test,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
