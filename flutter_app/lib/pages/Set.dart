import 'package:flutter/material.dart';
import 'package:flutter_app/provider/LanguageProvider.dart';
import 'package:provider/provider.dart';

class SetPage extends StatefulWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  @override
  Widget build(BuildContext context) {
    bool isChinese = Provider.of<LanguageProvider>(context).isChinese;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.settings_backup_restore, color: Colors.red),
            title: Text(
                isChinese ? "修改用户个人信息" : "Modifying User Personal Information"),
            onTap: () {
              Navigator.of(context).pushNamed('/editUser');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.red),
            title: Text(isChinese ? "切换为 English" : "Switch to 中文"),
            onTap: () {
              context.read<LanguageProvider>().change(isChinese ? 2 : 1);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
