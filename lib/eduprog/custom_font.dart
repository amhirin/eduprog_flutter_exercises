import 'package:flutter/material.dart';

class CustomFontPage extends StatefulWidget {
  CustomFontPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomFontPageState createState() => _CustomFontPageState();
}

class _CustomFontPageState extends State<CustomFontPage> {

  //var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text("Custom Font", style: TextStyle(fontFamily: "Schaeffer", fontSize: 40),),) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
