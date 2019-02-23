import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance")),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              TextField(
                controller: myController1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue)),
                  hintText: 'Conducted Hours',
                ),
              ),
              TextField(
                controller: myController2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Bunked till now'),
              ),
              Expanded(
                child: new Divider(),
              ),
              RaisedButton(
                child: Text("CALCULATE"),
                onPressed: () {
                  int con = int.parse(myController1.text);
                  int ab = int.parse(myController2.text);
                  int pr = con - ab;
                  int pp1 = 100 * pr;
                  double pp2 = (pp1 / con);
                  String s;
                  if (pp2 > 75) {
                    pp2 = (con - (4 * ab)) / 3;
                    s = "No of classes you can leave\n";
                  } else {
                    pp2 = ((4 * ab) - con).toDouble();
                    s = "No of classes YOU HAVE TO ATTEND\n";
                  }
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(s + pp2.toInt().toString()),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
