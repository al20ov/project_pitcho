import 'package:flutter/material.dart';
import 'package:project_pitcho/utils.dart';
import "dart:math";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PitchoRandomizer',
      home: Scaffold(
          appBar: AppBar(
            title: Text('PitchoRandomizer'),
          ),
          body: new Home()),
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
  List<String> students;
  String student;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(
        child: Text("Load class"),
        onPressed: () async {
          students = await FileUtils.loadClassroom();
        },
      ),
      Text("Random student: $student"),
      RaisedButton(
        child: Text("Choose random student"),
        onPressed: () {
          setState(() { student = chooseRandomStudent(); });
        },
      ),
    ]);
  }

  String chooseRandomStudent() {
    final _random = new Random();
    return (students[_random.nextInt(students.length)]);
  }
}
