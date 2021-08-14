import 'package:flutter/material.dart';
import 'package:flutter_app/provider/NetworkProvider.dart';
import '../widget/BackgroundSlideMain.dart';
import '../widget/LoginBox.dart';
import '../widget/LanguageSelect.dart';
import '../services/Storage.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController accountController;
  late TextEditingController pwdController;

  var subscription;
  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    pwdController = TextEditingController();
    exitUser();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        context.read<NetworkProvider>().change("处于wifi");
      } else if (result == ConnectivityResult.mobile) {
        context.read<NetworkProvider>().change("处于移动数据中");
      } else {
        context.read<NetworkProvider>().change("没有网络");
      }
      // Got a new connectivity status!
    });
  }

  @override
  void dispose() {
    super.dispose();
    accountController.dispose();
    pwdController.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.loose,
        children: [
          BackgroundSlideMain(),
          LoginBox(
            accountController: accountController,
            pwdController: pwdController,
          ),
          LanguageSelect()
        ],
      ),
    );
  }

  exitUser() async {
    await Storage.remove("userInfo");
  }
}
