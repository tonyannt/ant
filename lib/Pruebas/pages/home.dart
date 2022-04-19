import 'dart:io';

import 'package:ant/Pruebas/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands=[
    Band(id:'1', name: 'Metalica', votes: 5),
    Band(id:'2', name: 'Zoe', votes: 3),
    Band(id:'3', name: 'MCR', votes: 3),
    Band(id:'4', name: 'Linkin Park', votes: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Band Names', style: TextStyle( color: Colors.black87),),backgroundColor: Colors.white,),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i)=> _bandTile(bands[i])
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      elevation: 1, 
      onPressed: addNewBand,),
    );
  }

  Widget _bandTile(Band band) {
    //Efecto de eliminar
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('direction: $direction');
        print('id: ${band.id}');
      }, 
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          
        alignment: Alignment.centerLeft,
        child:Text('Delete Band', style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(child: Text(band.name.substring(0,2)),
        backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: TextStyle(fontSize: 20),),
        onTap: (){},
      ));
  }

  addNewBand(){
  final textController = new TextEditingController();
    //Platform importar desde dartr.io y no del html
    if(Platform.isAndroid){
      return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('New Band Name'),
          content:  TextFormField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Add'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: ()=> addBandToList(textController.text)
              )
          ],
        );
      }
      );
    }
    showCupertinoDialog(context: context, builder: (_){
      return CupertinoAlertDialog(
        title: Text('New Band Name'),
        content: CupertinoTextField(
          controller: textController,
        ),
        actions: [CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('add'),
          onPressed: ()=> addBandToList(textController.text)
          ),
          CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text('Dismmiss'),
          onPressed: ()=> Navigator.pop(context)
          ),
          ],
      );
    });
    
  }

  //Diferenciación entre iphone y android
  void addBandToList(String name){
    if(name.length >1){
      print(name);
      this.bands.add(new Band(id:DateTime.now().toString() , name: name, votes: 0));
      setState(() {
        //Es para recargar la app
      });
      //Podemos agregar
    }

    Navigator.pop(context);//Se cierra el dialogo
  }

}