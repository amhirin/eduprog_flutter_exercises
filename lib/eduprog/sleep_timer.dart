import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SleepTimerPage extends StatefulWidget {
  SleepTimerPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SleepTimerPageState createState() => _SleepTimerPageState();
}

class _SleepTimerPageState extends State<SleepTimerPage> {
  int _counter = 0;
  Timer _timer;

  int _counter_sleep = 0;

  void _setTimeOut(int _ms){
    Future.delayed(Duration(milliseconds: _ms), (){
      //. action
      setState(() {
        _counter_sleep++;
      });
    });
  }

  void _setInterval(int _ms){
    if (_timer != null) _timer.cancel();
    _timer = Timer.periodic(Duration(milliseconds: _ms), (timer) {
      setState(() {
        _counter++;
      });
    });
  }


  @override
  void dispose(){
    if (_timer != null) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.purple[100],
              child: Center(child: Text("setTimeout Result = $_counter_sleep")),
            ),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Center(
              child: FlatButton(

                child: Text("Test setTimeout", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  _setTimeOut(500);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple[100],
              child: Center(child: Text("setInterval Result = $_counter")),
            ),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: Center(
              child: FlatButton(
                child: Text("Test setInterval", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  _setInterval(100);
                },
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}