import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyDialog {
  static Future<dynamic> showAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(" AlertDialog"),
          content: Text("你确定要删除吗？"),
          actions: [],
        );
      },
    );
  }

  static toast(String mag1) async {
    Fluttertoast.showToast(
        msg: mag1,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5, //仅ios才可设置
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
