import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

void main() {
  runApp(data());
}
class data extends StatelessWidget {
  final dbhelper=DatabaseHelper.instance;
  _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'jazab ali',
      DatabaseHelper.columnAge  : 222
    };
    int id = await dbhelper.insert(row);
    print(id);
  }
  void qureyall() async{
    var allrows = await dbhelper.queryall();
    allrows.forEach((row){
      print(row);
    });
  }
  void qureyspecific() async{
    var allrows = await dbhelper.queryspecific(25);
      print(allrows);
  }
  void deletdata() async{
    var id = await dbhelper.deletdata(3);
    print(id);
  }
  void updatedata() async{
    var id = await dbhelper.updatedata(5);
    print(id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Database'),
        ),
        body: Column(
          children: [
            Container(
             child:Center(
               child:RaisedButton(
                 child: Text('Save data'),
                 onPressed: (){
                   _insert();
                 },
               ),
             ),
            ),
            RaisedButton(
              child: Text('Read data'),
              onPressed: (){
                qureyall();
              },
            ),
            RaisedButton(
              child: Text('only data'),
              onPressed: (){
                qureyspecific();
              },
            ),
            RaisedButton(
              child: Text('deletdata'),
              onPressed: (){
                deletdata();
              },
            ),
            RaisedButton(
              child: Text('updatedata'),
              onPressed: (){
                updatedata();
              },
            ),
          ],
        ),
      ),
    );
  }
}


