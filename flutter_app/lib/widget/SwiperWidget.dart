import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class SwiperWidget extends StatelessWidget {
  SwiperWidget({Key? key}) : super(key: key);
  final List imgList = [
    {"url": "images/card1.jpg"},
    {"url": "images/card2.jpg"},
    {"url": "images/card3.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      ///AspectRatio 用来设置宽高比的容器 不能固定
      ///不同设备的长与宽都不一样
      child: AspectRatio(
        aspectRatio: 2 / 1, //宽高比
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            print(index);
            return new Image.asset(
              imgList[index]["url"],
              fit: BoxFit.cover,
            );
          },
          itemCount: imgList.length,
          pagination: new SwiperPagination(), //分页器
          autoplay: true, //自动播放
        ),
      ),
    );
  }
}
