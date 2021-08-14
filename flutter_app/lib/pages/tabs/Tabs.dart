import 'package:flutter/material.dart';
import 'Home.dart';
import 'User.dart';

class Tabs extends StatefulWidget {
  final Map? arguments;
  Tabs({Key? key, this.arguments}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  late PageController _pageController;
  List<Widget> _pageList = [HomePage(), UserPage()];
  @override
  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              color:
                  (_currentIndex == 0) ? Colors.blue.shade300 : Colors.black87,
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  this._pageController.jumpToPage(_currentIndex);
                });
              },
            ),
            SizedBox(),
            IconButton(
              color:
                  (_currentIndex == 1) ? Colors.blue.shade300 : Colors.black87,
              icon: Icon(Icons.person),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                  this._pageController.jumpToPage(_currentIndex);
                });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addCard');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
