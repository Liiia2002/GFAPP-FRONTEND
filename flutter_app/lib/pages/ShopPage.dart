import 'package:flutter/material.dart';
import '../../widget/MyCard.dart';
import '../services/MyDialog.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  final Map? arguments;
  ShopPage({Key? key, this.arguments}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool iscard = false;
  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (iscard) {
                setState(() {
                  iscard = !iscard;
                });
              } else {
                Navigator.pop(context);
              }
            }),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Image.asset(
              "images/shop${widget.arguments?['index']}.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          iscard
              ? MyCard(
                  ChineseText1: "领取",
                  EnglishText1: "get",
                  color: Colors.black26,
                  fn: () => MyDialog.toast(isChinese
                      ? "对不起，该功能暂未开放"
                      : "Sorry, this feature is not available yet"))
              : Container(
                  decoration: BoxDecoration(color: Colors.cyan.shade100),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: CircleAvatar(
                          child: Text("1"),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              isChinese ? "优惠卡" : "Discount",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(isChinese
                                ? "快来领取吧！"
                                : "go to get a discount card!")
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            iscard = true;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 40,
                          child: Icon(Icons.arrow_right),
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
