import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){

    List<Widget> body = <Widget>[
      InputValue(),
      Container(
        margin: const EdgeInsets.only(left:8.0),
        child: RowButton(),
      ),
      Padding(padding: const EdgeInsetsDirectional.only(top:15.0),
          child:RowButton()),
      Padding(padding: const EdgeInsetsDirectional.only(top:12.0),
          child: ColumnValue(),),
      RowOnBottom(),
      ButtonOnBottom(),
      /*Box(),
      RedBox(),
      GreenBox(),
      BlueBox(),*/

    ];
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("TAXES CALCULATOR"),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: body,
            ),
          )
      ),
    );
  }
}
class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(),
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

class GreenBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
      ),
    );
  }
}

class Box extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle, size: 50),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Flutter McFlutter',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text('Experienced App Developer'),
            BoxAdd(),
          ],
        ),
      ],
    );
  }
}

class RowButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonActive(),
        ButtonDisactive(),
        ButtonDisactive(),
      ],
    );
  }
}

class BoxAdd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('123 Main Street',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Futura',
            color: Colors.blue,
          )
        )
      ],
    );
  }
}

class InputValue extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Inserisci Importo',
      ),
    );
  }
}

class ButtonActive extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Enabled'),
    );
  }
}

class ButtonDisactive extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: Text('Disabled'),
    );
  }
}

class ColumnValue extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsetsDirectional.only(top:8.0, bottom: 8.0),
          child: Row(
            children: const [
              Text('Importo senza IVA',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Futura',
                  ))
            ],
          ),
        ),
        Padding(padding: EdgeInsetsDirectional.only(top:8.0, bottom: 8.0),
          child: Row(
            children: const [
              Text('IVA',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Futura',
                  ))
            ],
          ),
        ),Padding(padding: EdgeInsetsDirectional.only(top:8.0, bottom: 8.0),
          child: Row(
            children: const [
              Text('totale è',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Futura',
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class RowOnBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonOnBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('CALCOLO IVA'),
                ),
              )
            ],
          ),
        ),
    );
  }
}