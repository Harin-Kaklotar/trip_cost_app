import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tirp Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FualForm(),
    );
  }
}

class FualForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FualFormState();
}

class _FualFormState extends State<FualForm> {
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final double formDistance = 10.0;
  String result = '';
  final _currencies = ['Dollars', 'Pounds', 'Euro'];
  String _currency = 'Dollars';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: formDistance, top: formDistance),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Distance",
                  hintText: "e.g. 124",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: distanceController,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: formDistance, top: formDistance),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Distance per unit",
                  hintText: "e.g. 14",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: avgController,
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: formDistance, top: formDistance),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Price",
                        hintText: "e.g. 1.65 ",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      controller: priceController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),

                Container(width: formDistance *5,),

                Expanded(
                    child: DropdownButton<String>(
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  value: _currency,
                  onChanged: (String value) {
                    _onDropDownChange(value);
                  },
                )),
              ],
            ),

            Row(
             children: <Widget>[

              Expanded(child: 
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryColorLight,
                child: new Text(
                  "Submit",
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  setState(() {
                    result = _calculate();
                  });
                }),
              ),

            Expanded(child: 
              RaisedButton(
                color: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
                child: new Text(
                  "Reset",
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  setState(() {
                    _reset();
                  });
                })
              ),

             ], 
            ),
            
            Text(result)
          ],
        ),
      ),
    );
  }

  void _onDropDownChange(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuleCost = double.parse(priceController.text);
    double _consuption = double.parse(avgController.text);
    double _totalCost = _distance / _consuption * _fuleCost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void _reset(){
      distanceController.text = '';
      priceController.text = '';
      avgController.text = '';
      setState(() {
        result = '';
      });
  }
}
