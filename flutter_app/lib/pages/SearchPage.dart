import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/ScreenAdapter.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none)),
              onChanged: (value) {},
            ),
            height: ScreenAdapter.height(68),
            decoration: BoxDecoration(
                color: Color.fromRGBO(233, 233, 233, 0.8),
                borderRadius: BorderRadius.circular(30)),
          ),
          actions: <Widget>[
            InkWell(
              child: Container(
                height: ScreenAdapter.height(68),
                width: ScreenAdapter.width(80),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                          height: 34, width: 40, child: Icon(Icons.search)),
                      onTap: null,
                    )
                  ],
                ),
              ),
              onTap: () {},
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(isChinese ? "热搜" : "Hot",
                    style: TextStyle(fontSize: 22)),
              ),
              Divider(),
              Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 233, 233, 0.9),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(isChinese ? "周年活动" : "Anniversary"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
