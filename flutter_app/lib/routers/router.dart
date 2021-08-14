import 'package:flutter/material.dart';
import '../pages/LoginPage.dart';
import '../pages/SignUpPage.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/userpage/CardBagPage.dart';
import '../pages/userpage/AddCard.dart';
import '../pages/Network.dart';
import '../pages/Set.dart';
import '../pages/EditUserPage.dart';
import '../pages/SearchPage.dart';
import '../pages/ShopPage.dart';

//配置路由
final routes = {
  '/': (context) => LoginPage(),
  '/tabs': (context, {arguments}) => Tabs(arguments: arguments),
  '/signonPage': (context) => SignUpPage(),
  '/userCard': (context) => CardBagPage(),
  '/addCard': (context) => AddCard(),
  '/network': (context) => NetworkPage(),
  '/set': (context) => SetPage(),
  '/editUser': (context) => EditUserPage(),
  '/search': (context) => SearchPage(),
  '/shop': (context, {arguments}) => ShopPage(arguments: arguments),
};

dynamic onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
