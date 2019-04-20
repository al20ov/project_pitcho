import 'package:flutter/material.dart';
import 'utils.dart';
import 'about.dart';
import 'dart:math';

void main() => runApp(MyApp());

List<String> students;
String student;
bool darkMode = false;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  ThemeData lightTheme = ThemeData(primarySwatch: Colors.indigo);

  switchTheme() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PitchoRandomizer',
      home: HomeScaffold(switchTheme),
      theme: darkMode == true ? ThemeData.dark() : lightTheme,
    );
  }
}

class HomeScaffold extends StatefulWidget {
  final Function() callback;
  HomeScaffold(this.callback);
  @override
  State<StatefulWidget> createState() {
    return HomeScaffoldState();
  }
}

class HomeScaffoldState extends State<HomeScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PitchoRandomizer',
          style: TextStyle(fontFamily: 'ProductSans'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(darkMode == true ? Icons.wb_sunny : Icons.brightness_3),
            onPressed: () {
              darkMode = !darkMode;
              widget.callback();
            },
            tooltip: darkMode == true ? "Light mode" : "Dark mode",
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              students = await FileUtils.loadClassroom();
            },
            tooltip: "Charger un fichier classe",
          ),
          IconButton(
            icon: Icon(Icons.help),
            tooltip: "Aide",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          )
        ],
      ),
      body: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Center(
                child: Text(
          student == null ? "null" : student,
          style: TextStyle(fontSize: 24.0),
        ))),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text(
              "Pick random student",
              style: TextStyle(fontSize: 16.0),
            ),
            onPressed: () {
              setState(() {
                student = chooseRandomStudent();
              });
            },
          ),
        ))
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  String chooseRandomStudent() {
    final _random = new Random();
    if (students != null)
      return (students[_random.nextInt(students.length)]);
    else
      return ("You must first load a class file");
  }
}
