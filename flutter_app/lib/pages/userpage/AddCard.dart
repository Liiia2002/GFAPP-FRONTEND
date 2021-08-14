import 'package:flutter/material.dart';
import '../../../services/Storage.dart';
import 'dart:convert';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  late var userInfo;
  bool islogin = false;
  _getUseInfo() async {
    String? getInfo = await Storage.getString('userInfo');
    if (getInfo == null) {
      islogin = false;
    } else {
      setState(() {
        islogin = true;
        userInfo = json.decode(getInfo);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUseInfo();
  }

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(isChinese ? "这是添加卡片的页面" : "This is the page for adding cards"),
          islogin
              ? Text(isChinese
                  ? "对不起，该功能暂未开放"
                  : "Sorry, this feature is not available yet")
              : Text(isChinese ? "请您先登录" : "Please log in first")
        ],
      ),
    );
  }
}
