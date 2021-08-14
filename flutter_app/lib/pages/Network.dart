import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';

class NetworkPage extends StatefulWidget {
  NetworkPage({Key? key}) : super(key: key);

  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  var subscription;
  String _stateText = "检测中...";

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        setState(() {
          _stateText = "处于wifi";
        });
      } else if (result == ConnectivityResult.mobile) {
        setState(() {
          _stateText = "处于手机网络";
        });
      } else {
        setState(() {
          _stateText = "没有网络";
        });
      }
      // Got a new connectivity status!
    });
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("检测网络变化"),
      ),
      body: Center(child: Text("${this._stateText}")),
    );
  }
}
