import 'package:flutter/material.dart';
import '../services/Storage.dart';
import '../services/MyDialog.dart';
import 'dart:convert';
import 'package:flutter_app/services/Storage.dart';
import '../services/UserServices.dart';
import '../widget/LoadingWidget.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  bool isload = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController accountController;
  late TextEditingController pwdController1;
  late TextEditingController pwdController2;
  late TextEditingController emailController;
  late var userInfo;

  _getUseInfo() async {
    String? getInfo = await Storage.getString('userInfo');
    if (getInfo == null) {
    } else {
      setState(() {
        userInfo = json.decode(getInfo);
        accountController.text = userInfo["username"];
        pwdController1.text = userInfo["password"];
        pwdController2.text = userInfo["password"];
        emailController.text = userInfo["email"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUseInfo();
    accountController = TextEditingController();

    pwdController1 = TextEditingController();
    pwdController2 = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    accountController.dispose();
    pwdController1.dispose();
    pwdController2.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(
        title: isload
            ? LoadingWidget(test: isChinese ? "保存修改中..." : "Saveing...")
            : Text(""),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: accountController,
              maxLength: 10,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: isChinese ? "用户名" : "username",
                hintStyle: TextStyle(color: Colors.black12),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return isChinese ? "不能为空" : 'Please enter some text';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: pwdController1,
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
            SizedBox(height: 10),
            TextFormField(
              controller: pwdController2,
              decoration: InputDecoration(
                  labelText: isChinese ? "确认密码" : "type password again",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              validator: (String? value) {
                if (pwdController2.text != pwdController1.text) {
                  return isChinese
                      ? "两次输入的密码不相同"
                      : "The passwords typed are different";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: isChinese ? "邮箱" : "email",
                prefixIcon: Icon(Icons.email),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return isChinese ? "邮箱不能空" : "NOT NULL";
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
                      _editUser(context);
                    }
                  },
                  child: Text(
                    isChinese ? "保存修改" : "Save",
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _editUser(context) async {
    setState(() {
      isload = true;
    });

    var response = await UserServices.tryToEdit(
      userInfo["id"],
      accountController.text,
      pwdController1.text,
      emailController.text,
    );
    if (response.data["success"]) {
      MyDialog.toast(response.data["message"]);
      await Storage.setString(
          'userInfo', json.encode(response.data["userinfo"]));
    } else {
      MyDialog.toast(response.data["message"]);
    }
    setState(() {
      isload = false;
    });
  }
}
