import 'package:project_pitcho/utils.dart';
import 'package:flutter/material.dart';
import "dart:math";

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PitchoRandomizer',
      home: Scaffold(
          appBar: AppBar(
            title: Text('PitchoRandomizer', style: TextStyle(fontFamily: 'ProductSans'),),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                    darkMode == true ? Icons.wb_sunny : Icons.brightness_3),
                onPressed: () {
                  darkMode = !darkMode;
                  setState(() {});
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  students = await FileUtils.loadClassroom();
                },
                tooltip: "Charger un fichier classe",
              ),
            ],
          ),
          body: new Home()),
      theme: darkMode == true ? ThemeData.dark() : lightTheme,
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
              "Choose random student",
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
