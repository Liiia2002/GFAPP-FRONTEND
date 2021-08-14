import 'package:flutter/material.dart';
import '../../widget/MyCard.dart';
import '../../services/MyDialog.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class Coupon extends StatefulWidget {
  const Coupon({Key? key}) : super(key: key);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Container(
      color: Colors.black12,
      child: Container(
        color: Color.fromRGBO(255, 255, 255, 0.8),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(children: [
          MyCard(
              color: Colors.pink.shade50,
              fn: () => MyDialog.toast(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")),
          MyCard(
              color: Colors.blue.shade100,
              fn: () => MyDialog.toast(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")),
          MyCard(
              color: Colors.blue.shade50,
              fn: () => MyDialog.toast(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")),
          MyCard(
              color: Colors.pink.shade300,
              fn: () => MyDialog.toast(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")),
          MyCard(
              color: Colors.black26,
              fn: () => MyDialog.toast(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")),
          MyCard(
              color: Colors.red.shade200,
              fn: () => MyDialog.toast(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")),
        ]),
      ),
    );
  }
}
