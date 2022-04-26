import 'package:ant/Pruebas/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final socketService= Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(child: Text('Hello Wolrd'),),
    );
  }
}