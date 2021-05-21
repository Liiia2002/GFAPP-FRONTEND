import 'package:flutter/material.dart';
import 'pages/page1.dart';
import 'components/network/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var onGenerateRoute = new Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Page1(),
      initialRoute: '/', //初始化时要加载的路由
      onGenerateRoute: onGenerateRoute.onGenerateRoute,
    );
  }
}
