import 'package:eduprog_flutter_exercises/eduprog/chipselections.dart';
import 'package:eduprog_flutter_exercises/eduprog/custom_font.dart';
import 'package:eduprog_flutter_exercises/eduprog/freeze_table.dart';
import 'package:eduprog_flutter_exercises/eduprog/login.dart';
import 'package:eduprog_flutter_exercises/eduprog/nav_drawer.dart';
import 'package:eduprog_flutter_exercises/eduprog/willpopscope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'eduprog/responsive.dart';
import 'eduprog/sleep_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eduprog Demo',
      theme: ThemeData(
        //primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Eduprog Flutter Demo'),
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

  Widget _getMenu(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 30,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text("Main Menu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 10,
                blurRadius: 5,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
          )

        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Fungsi setInterval dan setTimeout", style: TextStyle(fontWeight: FontWeight.bold),) ,
                subtitle: Text("Contoh Fungsi setTimeout (sleep) dan setInterval (timer)"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SleepTimerPage(title: "Eduprog Sleep dan Timer",)),
                  );

                },
              ),
              Divider(),
              ListTile(
                title: Text("Responsive UI", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh tampilan widget Responsive"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResponsivePage(title: "Eduprog Responsive UI",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Login UI", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh tampilan UI Login"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: "Eduprog Login UI",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Custom Font", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh style font yang custom"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomFontPage(title: "Eduprog Custom Font",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Freeze Table (Column)", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh desain tabel dengan freeze column"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FreezeColumnPage(title: "Eduprog Freeze Column",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Freeze Table (Row)", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh desain tabel dengan freeze row"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FreezeRowPage(title: "Eduprog Freeze Row",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Navigation Drawer", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh implementasi drawer pada halaman"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavDrawerPage(title: "Eduprog Drawer",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Exit Confirmation", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh konfirmasi button back dengan WillPopScope"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WllPopScopePage(title: "Eduprog WillPopScope",)),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text("Chip Selection", style: TextStyle(fontWeight: FontWeight.bold)) ,
                subtitle: Text("Contoh Chip Selection untuk Single / Multiple Choice"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChipSelectionPage(title: "Eduprog Chip Selection",)),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getMenu(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
