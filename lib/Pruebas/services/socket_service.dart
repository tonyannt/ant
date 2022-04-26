//Conexion al servidor
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  //Estado al inicio de la app
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService(){
    this._initConfig();
  }

  void _initConfig(){
  IO.Socket socket = IO.io('http://192.168.100.242:3000/', {
    'transports':['websocket'],
    'autoConnect':true,
  });
  
  
  socket.on('connect',(_) {
    print('connect');
  });
  socket.on('disconnect',(_) {print('disconnect');});
  }
}