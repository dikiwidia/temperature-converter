import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shamo'),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin),
                    label: const Text("Celcius"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                maxLength: 4,
                obscureText: false,
                controller: username,
              ),
              resultCalculated('Fahrenheit'),
              resultCalculated('Reamur'),
              resultCalculated('Kelvin'),
            ],
          ),
        ),
      ),
    );
  }

  resultCalculated(String type) {
    double? result = 0;
    if (double.tryParse(username.text) != null) {
      result = double.tryParse(username.text);
    }
    switch (type) {
      case 'Fahrenheit':
        result = (9 / 5 * result!) + 32;
        break;
      case 'Reamur':
        result = (4 / 5 * result!);
        break;
      case 'Kelvin':
        result = (5 / 5 * result!) + 273.15;
        break;
      default:
        result = 0;
        break;
    }
    return Text(
      result.toStringAsFixed(2) + ' ' + type,
      style: const TextStyle(fontSize: 24),
    );
  }
}
