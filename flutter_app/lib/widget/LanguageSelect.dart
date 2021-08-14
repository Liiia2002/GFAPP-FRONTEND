import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 35,
      top: 408,
      child: Container(
          height: 35,
          color: Colors.blue.shade100,
          child: Row(
            children: [
              Container(
                child: Text(
                  Provider.of<LanguageProvider>(context).language,
                ),
              ),
              GestureDetector(
                child: Icon(Icons.more_horiz),
                onTap: () async {
                  var index = await showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                          ScreenAdapter.width(600), 440, 0, 0),
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          height: 15,
                          value: 1,
                          child: Text("中文"),
                        ),
                        PopupMenuDivider(),
                        PopupMenuItem(
                          height: 15,
                          value: 2,
                          child: Text("English"),
                        )
                      ]);
                  if (index != null) {
                    context.read<LanguageProvider>().change(index);
                  }
                },
              )
            ],
          )),
    );
  }
}
