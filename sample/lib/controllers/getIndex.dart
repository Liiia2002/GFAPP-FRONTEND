import 'package:flutter/material.dart';
/**
 * 作者：
  时间：
  类描述：getindex()判断容器是否超出一定数量
 */
class GetIndex {
  final list;
  GetIndex(this.list);
  int getindex() {
    for (int i = 0; i < list.length; i++) {
      bool c = false;
      for (int k = 0; k < list.length; k++) {
        if (i == int.parse(list[k])) {
          c = true;
        }
      }
      if (c == false) {
        return i;
      }
    }
    return list.length;
  }
}
