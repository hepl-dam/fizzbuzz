import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues _rangeValues = RangeValues(1, 100);
  late int min;
  late int max;

  @override
  void initState() {
    super.initState();
    min = _rangeValues.start.round();
    max = _rangeValues.end.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FizzBuzz"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                print("Bouh");
              },
              child: Icon(Icons.help),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 10,
            color: Colors.white,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("Choisissez un interval"),
                  RangeSlider(
                    min: 1,
                    max: 100,
                    divisions: 100,
                    values: _rangeValues,
                    labels: RangeLabels(
                      _rangeValues.start.round().toString(),
                      _rangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _rangeValues = values;
                        min = _rangeValues.start.round();
                        max = _rangeValues.end.round();
                      });
                    },
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(min.toString()),
                      Spacer(
                        flex: 5,
                      ),
                      Text(
                        max.toString(),
                      ),
                      Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('FizzBuzz'),
                        content: Text(fizzBuzz(min, max)),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('D’accord !'),
                          ),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_list_numbered),
                        Text("Afficher le résultat")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String fizzBuzz(int min, int max) {
    String fizzBuzz = "";
    for (int i = min; i <= max; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        fizzBuzz += "FizzBuzz, ";
      } else if (i % 3 == 0) {
        fizzBuzz += "Fizz, ";
      } else if (i % 5 == 0) {
        fizzBuzz += "Buzz, ";
      } else {
        fizzBuzz += i.toString() + ", ";
      }
    }

    return fizzBuzz;
  }
}
