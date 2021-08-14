import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/services/Storage.dart';
import '../services/UserServices.dart';
import '../services/MyDialog.dart';
import '../widget/LoadingWidget.dart';
import 'tabs/Tabs.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isload = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController accountController;
  late TextEditingController pwdController;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    pwdController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    accountController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(
        title: Text(isChinese ? "注册" : "Sign up"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: accountController,
              maxLength: 12,
              decoration: InputDecoration(
                labelText: isChinese ? "用户名" : "username",
                hintStyle: TextStyle(color: Colors.black12),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: pwdController,
              maxLength: 12,
              decoration: InputDecoration(
                  labelText: isChinese ? "密码" : "password",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.trim().length <= 5) {
                  return isChinese
                      ? "密码不能少于6位"
                      : "The password must be at least six characters long";
                }
                return null;
              },
            ),
            TextFormField(
              maxLength: 25,
              controller: emailController,
              decoration: InputDecoration(
                  labelText: isChinese ? "邮箱" : "email",
                  prefixIcon: Icon(Icons.email)),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  //必须判断是否为 null 否则报错
                  return isChinese ? "不能为空" : "NOT NULL";
                }
                return null;
              },
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade400)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signUp(context);
                    }
                  },
                  child: Text(
                    isChinese ? "注册" : "Sign up",
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              },
            ),
            isload
                ? LoadingWidget(
                    test: isChinese ? "注册中..." : "Registration in progress")
                : Text(""),
          ],
        ),
      ),
    );
  }

  _signUp(context) async {
    setState(() {
      isload = true;
    });

    var response = await UserServices.tryToSignUp(
      accountController.text,
      pwdController.text,
      emailController.text,
    );

    if (response.data["success"]) {
      MyDialog.toast(response.data["message"]);
      await Storage.setString(
          'userInfo', json.encode(response.data["userinfo"]));

      Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
          builder: (context) => new Tabs(),
        ),
        (route) => false,
      );
    } else {
      print(response.data["message"]);
      MyDialog.toast(response.data["message"]);
    }
    setState(() {
      isload = false;
    });
  }
}
