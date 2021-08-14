import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("可用票"),
        Text("敬请期待"),
      ],
    ));
  }
}
