import 'dart:convert';

import 'package:flutter/material.dart';
import '../../services/Storage.dart';
import '../../services/MyDialog.dart';
import '../../services/UserServices.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late var userInfo;
  bool islogin = false;
  @override
  void initState() {
    super.initState();
    _getUseInfo();
  }

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
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() async {
                  await _getUseInfo();
                  MyDialog.toast(isChinese ? "已刷新" : "Has been refreshed");
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black45),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ClipOval(
                      child: InkWell(
                    onTap: () {
                      MyDialog.toast(isChinese
                          ? "替换头像的功能暂未开放"
                          : "The avatar replacement function is not available yet");
                    },
                    child: Image.asset(
                      'images/user.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: null,
                    child: islogin
                        ? Text(
                            isChinese
                                ? "用户名：${userInfo["username"]}\n邮箱：${userInfo["email"]}"
                                : "Username：${userInfo["username"]}\nEmail：${userInfo["email"]}",
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                            isChinese
                                ? "请先登录或注册"
                                : "Please login or register first",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.assignment, color: Colors.red),
            title: Text(isChinese ? "订单" : "All Orders"),
            onTap: () {
              MyDialog.toast(isChinese
                  ? "订单功能暂未开放"
                  : "The order function is not available yet");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.green),
            title: Text(isChinese ? "付款" : "Obligation"),
            onTap: () {
              MyDialog.toast(isChinese
                  ? "付款功能暂未开放"
                  : "The payment function is not available");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.card_membership, color: Colors.green),
            title: Text(isChinese ? "我的卡包" : "My Card Bag"),
            onTap: () {
              if (islogin) {
                Navigator.of(context).pushNamed('/userCard');
              } else {
                MyDialog.toast(isChinese ? "请先登录" : "please log in first");
              }
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green),
            title: Text(isChinese ? "设置" : "Setting"),
            onTap: () {
              if (islogin) {
                Navigator.of(context).pushNamed('/set');
              } else {
                MyDialog.toast(isChinese ? "请先登录" : "please log in first");
              }
            },
          ),
          Divider(),
          islogin
              ? ListTile(
                  leading: Icon(Icons.logout, color: Colors.green),
                  title: Text(
                    isChinese ? "注销" : "Sign Out",
                  ),
                  onTap: () async {
                    await Storage.remove("userInfo");
                    setState(() {
                      islogin = false;
                    });
                  },
                )
              : ListTile(
                  leading: Icon(Icons.logout, color: Colors.green),
                  title: Text(
                    isChinese ? "点击登录" : " click here to sign in",
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
        ],
      ),
    );
  }
}
