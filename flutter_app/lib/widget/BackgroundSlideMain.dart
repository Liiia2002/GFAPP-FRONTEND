import 'dart:async';
import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import 'package:flutter_app/provider/NetworkProvider.dart';
import 'package:provider/provider.dart';

class BackgroundSlideMain extends StatefulWidget {
  BackgroundSlideMain({Key? key}) : super(key: key);

  @override
  _BackgroundSlideMainState createState() => _BackgroundSlideMainState();
}

class _BackgroundSlideMainState extends State<BackgroundSlideMain>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer intervale;
  double opacityMain = 1;
  double opacityToChange = 0;

  int indexMain = 1;
  int indexToChange(indexMain) {
    return (indexMain == total) ? 1 : indexMain + 1;
  }

  int total = 4;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {
        if (_controller.status == AnimationStatus.completed) {
          indexMain = indexMain % total + 1;
          opacityMain = 1;
          opacityToChange = 0;
        }
        if (_controller.status == AnimationStatus.forward) {
          opacityMain = 1 - _controller.value;
          opacityToChange = _controller.value;
        }
      });
    });

    intervale = Timer.periodic(Duration(milliseconds: 3000), (timer) {
      _controller.forward(from: 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    intervale.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black38,
      child: Stack(
        children: [
          Opacity(
            opacity: opacityMain,
            child: Container(
              width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.getScreenHeight(),
              child: Image.asset(
                "images/$indexMain.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: opacityToChange,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "images/${indexToChange(indexMain)}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Text(Provider.of<NetworkProvider>(context).stateText)),
        ],
      ),
    );
  }
}
