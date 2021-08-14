import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../../widget/MyCard.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';
import '../../widget/TitleWidget.dart';
import '../../widget/SwiperWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/search');
          },
          child: Container(
            height: 34,
            decoration: BoxDecoration(
                color: Color.fromRGBO(233, 233, 233, 0.8),
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Container(height: 34, width: 40, child: Icon(Icons.search)),
            onTap: null,
          )
        ],
      ),
      drawer: Drawer(
        child: Text(isChinese ? "敬请期待" : "Expect"),
      ),
      body: ListView(
        children: [
          SwiperWidget(),
          SizedBox(
            height: 10,
          ),
          TitleWidget(value: isChinese ? "猜你喜欢" : "Guess You Like"),
          MyCard(
            color: Colors.blue.shade300,
            ChineseText1: "去获取",
            EnglishText1: "to get",
            fn: () {
              Navigator.of(context).pushNamed('/shop', arguments: {"index": 1});
            },
          ),
          SizedBox(
            height: 10,
          ),
          TitleWidget(value: isChinese ? "热门推荐" : "HOT"),
          Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              runSpacing: 10,
              spacing: 10, //这里不用 ScreenAdaper 是为了方便计算
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/shop', arguments: {"index": 1});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      "images/shop1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/shop', arguments: {"index": 2});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      "images/shop2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
