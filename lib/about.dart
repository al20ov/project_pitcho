import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:project_pitcho/about_text.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutState();
  }
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},),
        title: Text("Help", style: TextStyle(fontFamily: 'ProductSans')),
      ),
      body: Markdown(data: markdown),
   );
  }
}
