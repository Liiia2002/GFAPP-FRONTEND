import 'package:flutter/material.dart';
import 'Coupon.dart';
import 'Ticket.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class CardBagPage extends StatefulWidget {
  CardBagPage({Key? key}) : super(key: key);

  @override
  _CardBagPageState createState() => _CardBagPageState();
}

class _CardBagPageState extends State<CardBagPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> _pageList = [Coupon(), Ticket()];
  List<Tab> myTabs = <Tab>[
    Tab(
      text: "卡券",
    ),
    Tab(
      text: "票",
    ),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    isChinese
        // ignore: unnecessary_statements
        ? true
        : myTabs = <Tab>[
            Tab(
              text: "coupon",
            ),
            Tab(
              text: "ticket",
            ),
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isChinese ? "卡包" : "My Card Bag"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Container(
            width: double.infinity,
            height: 30,
            child: TabBar(
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: _pageList),
    );
  }
}
