import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  static const width = 100.0;
  static const height = 100.0;
  static const margin = 8.0;
  final Function? fn;
  final Color color;
  String ChineseText1;
  String EnglishText1;
  MyCard(
      {Key? key,
      required this.color,
      this.fn,
      this.ChineseText1 = "去使用",
      this.EnglishText1 = "  To Use "})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [color, Color.fromARGB(50, 0, 0, 222)]),
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: width - margin * 2,
      height: height - margin * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(isChinese ? "买五送一 " : "Buy 5 Get 1 Free",
                  style: TextStyle(fontSize: 20, color: Colors.pink.shade100),
                  textDirection: TextDirection.rtl),
              Text(
                isChinese
                    ? "截止日期是8月5日凌晨4点"
                    : "The deadline is 4 a.m. on Aug. 5",
                style: TextStyle(fontSize: 15, color: Colors.black26),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
            ],
          ),
          SizedBox(width: 3),
          Container(
            child: Center(
              child: GestureDetector(
                onTap: () => {
                  if (fn != null) {fn!()}
                },
                child: Text(
                  isChinese ? this.ChineseText1 : this.EnglishText1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    color: Colors.black26, width: 1, style: BorderStyle.solid),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
