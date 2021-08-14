import 'package:flutter_screenutil/flutter_screenutil.dart';

//将 flutter_screenutil 封装 为防止以后该库升级时其方法名的改变
// 方便维护

class ScreenAdapter {
  //设置高度
  static height(num value) {
    return ScreenUtil().setHeight(value);
  }

  //设置宽度
  static width(num value) {
    return ScreenUtil().setWidth(value);
  }

  //设置字体大小
  static size(num value) {
    return ScreenUtil().setSp(value);
  }

  //获取设备的物理宽度
  static getScreenWidth() {
    return ScreenUtil().screenWidth;
  }

  //获取设备的物理高度
  static getScreenHeight() {
    return ScreenUtil().screenHeight;
  }
}
