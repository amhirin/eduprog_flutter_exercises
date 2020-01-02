import 'package:flutter/material.dart';

class WllPopScopePage extends StatefulWidget {
  WllPopScopePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WllPopScopePageState createState() => _WllPopScopePageState();
}

Future<bool> onExitApp(BuildContext context) {
  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text('Confirm Exit Page'),
      content: Text('Do you want to exit this page?'),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    ),
  ) ??
      false;
}

class _WllPopScopePageState extends State<WllPopScopePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onExitApp(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Text("Press Back Button", style: TextStyle(fontSize: 20),),
          )
      ),
    );
  }
}