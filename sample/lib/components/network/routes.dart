import 'package:flutter/material.dart';
import '../../pages/page1.dart';
/**
 * 作者：
   时间：
   类描述：命名路由跳转
   注意：路由命名采用全小写
 */
class Routes {
  var onGenerateRoute = (RouteSettings settings) {
    final routes = {
      '/': (context) => Page1(),
    };
    final String name = settings.name; //获取要跳转的页面名称，key值
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  };
}
