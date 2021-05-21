import 'package:flutter/material.dart';
import '../components/view/box.dart';
import '../models/initList.dart';
import '../controllers/getIndex.dart';

List<String> list = InitList.list;

class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var getindex = new GetIndex(list);

  final colors = InitList.colors;
  int _slot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCDDEEC),
      appBar: AppBar(
        title: Text("嗯✧( •̀ ω •́ )✧嗯"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Container(
              color: Colors.black12,
              child: Listener(
                //监听事件
                onPointerMove: (event) {
                  final y = event.position.dy;
                  if (y >
                      (_slot + 1) * MoveContainer.height +
                          MoveContainer.margin) {
                    if (_slot == list.length - 1) return;
                    setState(() {
                      final c = list[_slot];
                      list[_slot] = list[_slot + 1];
                      list[_slot + 1] = c;
                      _slot++;
                    });
                  } else if (y < _slot * MoveContainer.height) {
                    if (_slot == 0) return;
                    setState(() {
                      final c = list[_slot];
                      list[_slot] = list[_slot - 1];
                      list[_slot - 1] = c;
                      _slot--;
                    });
                  }
                },
                child: Stack(
                    children: List.generate(list.length, (index) {
                  return MoveContainer(colors[int.parse(list[index])],
                      (Color color) {
                    _slot = index;
                  }, 5.0, MoveContainer.height * index, ValueKey(list[index]));
                })),
              ))),
      floatingActionButton: Container(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          child: Text("+"),
          onPressed: () {
            if (getindex.getindex() <= 5) {
              int i = getindex.getindex();
              list.add(i.toString());
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}
