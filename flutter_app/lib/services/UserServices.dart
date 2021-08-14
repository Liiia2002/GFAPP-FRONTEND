import '../services/Storage.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';

class UserServices {
  static tryToLogIn(String username, String password) async {
    try {
      var response = await Dio().post(Config.domain + '/loginUser',
          data: {'username': username, 'password': password});
      print(response.data);
      return response;
    } catch (e) {
      print("登录出错:" + e.toString());
    }
  }

  static tryToSignUp(String username, String password, String email) async {
    try {
      var response = await Dio().post(
        Config.domain + '/addUser',
        data: {
          'username': username,
          'password': password,
          'email': email,
        },
      );

      return response;
    } catch (e) {
      print("注册出错:" + e.toString());
    }
  }

  static tryToEdit(
      String id, String username, String password, String email) async {
    try {
      var response = await Dio().post(
        Config.domain + '/editUser',
        data: {
          'id': id,
          'username': username,
          'password': password,
          'email': email,
        },
      );
      print(response.data);
      return response;
    } catch (e) {
      print("修改出错:" + e.toString());
    }
  }

  static SignOut() async {
    await Storage.remove('userInfo');
  }
}
