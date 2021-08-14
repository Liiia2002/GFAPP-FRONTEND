import 'dart:convert';
import '../services/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import '../services/UserServices.dart';
import '../services/MyDialog.dart';
import '../services/Storage.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class LoginBox extends StatelessWidget {
  LoginBox(
      {Key? key, required this.accountController, required this.pwdController})
      : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController accountController;
  late TextEditingController pwdController;

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Positioned(
      left: 0,
      top: 150,
      child: Container(
        width: ScreenAdapter.getScreenWidth(),
        height: 300,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              height: 225,
              child: Stack(
                children: [
                  Positioned(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            height: 85,
                            child: TextFormField(
                              focusNode: focusNode1,
                              controller: accountController,
                              maxLength: 12,
                              decoration: InputDecoration(
                                labelText: isChinese ? "账户" : "account",
                                hintText: isChinese ? "您的用户名" : "username",
                                hintStyle: TextStyle(color: Colors.black12),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return isChinese ? "不能为空" : "NOT NULL";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            height: 85,
                            child: TextFormField(
                              controller: pwdController,
                              focusNode: focusNode2,
                              decoration: InputDecoration(
                                  labelText: isChinese ? "密码" : "password",
                                  hintText: isChinese ? "您的登录密码" : "",
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return isChinese ? "不能为空" : "NOT NULL";
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 15,
                    child: Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/signonPage');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: new Border.all(
                                    width: 1, color: Colors.black12),
                              ),
                              child: Text(
                                isChinese ? "注册" : "sign up",
                                style: TextStyle(fontSize: isChinese ? 18 : 17),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              MyDialog.toast(isChinese
                                  ? "对不起，该功能暂未开放"
                                  : "Sorry, this feature is not available yet");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: new Border.all(
                                    width: 1, color: Colors.black12),
                              ),
                              child: Text(
                                isChinese ? "忘记密码" : "   Forget\nPassword",
                                style: TextStyle(
                                  fontSize: isChinese ? 18 : 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/tabs',
                              arguments: {"isUser": false});
                        },
                        child: Text(
                          isChinese ? "游客模式" : "Guest\nMode",
                          style: TextStyle(fontSize: isChinese ? 16 : 15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                width: ScreenAdapter.getScreenWidth() - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade400)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _login(context);
                            }
                          },
                          child: Text(
                            isChinese ? "登录" : "Login",
                            style: TextStyle(color: Colors.white70),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _login(context) async {
    var response = await UserServices.tryToLogIn(
        accountController.text, pwdController.text);
    if (response.data["success"]) {
      await Storage.setString(
          'userInfo', json.encode(response.data["userinfo"]));
      MyDialog.toast(response.data["message"]);
      Navigator.of(context).pushReplacementNamed('/tabs');
    } else {
      MyDialog.toast(response.data["message"]);
    }
  }
}
