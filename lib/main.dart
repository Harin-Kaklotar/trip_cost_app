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

            TextField(
              decoration: InputDecoration(
                labelText: "Distance",
                hintText: "e.g. 124",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
              controller: distanceController,
              keyboardType: TextInputType.number,
            ),

            DropdownButton<String>(
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
            ),

            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryColorLight,
              child: new Text(
                "Submit",
                textScaleFactor: 1.5,
                ),
              onPressed: () {
                setState(() {
                  result = distanceController.text;
                });
              }
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
}
