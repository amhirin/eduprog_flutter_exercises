import 'package:flutter/material.dart';

class NavDrawerPage extends StatefulWidget {
  NavDrawerPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavDrawerPageState createState() => _NavDrawerPageState();
}

class _NavDrawerPageState extends State<NavDrawerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(

              padding: new EdgeInsets.only(top: 30,bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/eduprog.png"),
                      backgroundColor: Colors.white,
                      maxRadius: 40,
                    ),
                    SizedBox(height: 10,),
                    Text("Eduprog Net", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("eduprognet@gmail.com")
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Menu 1'),
                subtitle: Text("Menu untuk melakukan sesuatu"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(thickness: 2,),
              ListTile(
                title: Text('Menu 2'),
                subtitle: Text("Menu untuk melakukan sesuatu"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(thickness: 2,),
              ListTile(
                title: Text('Menu 3'),
                subtitle: Text("Menu untuk melakukan sesuatu"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(thickness: 2,),
            ],
          ),
        ),
        body: Center(child: Text("Contoh Navigation Drawer"),)
    );
  }
}