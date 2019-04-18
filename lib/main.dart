import 'package:project_pitcho/utils.dart';
import 'package:flutter/material.dart';
import "dart:math";

void main() => runApp(MyApp());

List<String> students;
String student;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PitchoRandomizer',
      home: Scaffold(
          appBar: AppBar(
            title: Text('PitchoRandomizer'),
            actions: <Widget>[
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
      theme: ThemeData.dark(),
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
        Center(child: Text(student == null ? "null" : student, style: TextStyle(fontSize: 24.0),)),
        Padding(
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
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  String chooseRandomStudent() {
    final _random = new Random();
    if (students != null)
      return (students[_random.nextInt(students.length)]);
    else
      return (null);
  }
}
