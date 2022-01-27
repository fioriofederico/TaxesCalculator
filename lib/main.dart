
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/widget_button.dart';


enum TaxRate { tax22, tax10, tax4 }


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends  State<MyApp>{
  var selectedTax = TaxRate.tax22;
  var taxValue = 0.0;

  void changeValue(String value){
    setState(() {
      taxValue = double.parse(value);
    });
  }

  void onChaneTaxRate(TaxRate taxRate){
    setState(() {
      selectedTax = taxRate;
    });
  }

  bool isSelected(TaxRate taxRate){
    return taxRate == selectedTax;
  }

  var _userInput = "";

  @override
  Widget build(BuildContext context){

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
              children: [
                TextFormField(onChanged: (String text){
                  setState(() {
                    _userInput = text;
                  });
                },

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Inserisci Importo',
                    errorText: 'Inserire un numero valido',
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left:8.0),
                      child:
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.all(2.0),child: ButtonActive("22%",() {
                            onChaneTaxRate(TaxRate.tax22);
                          }, isSelected(TaxRate.tax22))),
                          Padding(padding: EdgeInsets.all(2.0),child: ButtonActive("10%",() {
                            onChaneTaxRate(TaxRate.tax10);
                          }, isSelected(TaxRate.tax10))),
                          Padding(padding: EdgeInsets.all(2.0),child: ButtonActive("4%",() {
                            onChaneTaxRate(TaxRate.tax4);
                          }, isSelected(TaxRate.tax4))),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsetsDirectional.only(top:8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Text('Importo senza IVA $_userInput',
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
                          Text('totale è ',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Futura',
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
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
                ),
              ],

            ),
          )
      ),
    );
  }
}