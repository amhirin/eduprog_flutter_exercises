import 'dart:async';

import 'package:eduprog_flutter_exercises/eduprog/animation1.dart';
import 'package:eduprog_flutter_exercises/eduprog/animation2.dart';
import 'package:eduprog_flutter_exercises/eduprog/chipselections.dart';
import 'package:eduprog_flutter_exercises/eduprog/custom_font.dart';
import 'package:eduprog_flutter_exercises/eduprog/freeze_table.dart';
import 'package:eduprog_flutter_exercises/eduprog/login.dart';
import 'package:eduprog_flutter_exercises/eduprog/nav_drawer.dart';
import 'package:eduprog_flutter_exercises/eduprog/page8.dart';
import 'package:eduprog_flutter_exercises/eduprog/qrcodes.dart';
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
      home: SplashScreen(),
      routes: {
        '/menu': (context) => MyHomePage(title: 'Eduprog Flutter Demo')
      }
    );
  }
}

class SplashScreen extends StatefulWidget { // splash screen
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  int modAnimation = 0;
  Timer _timer;


  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      _timer.cancel();
      controller.dispose();
      Navigator.of(context).pushReplacementNamed('/menu');

    });

    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        if (modAnimation == 0){
          modAnimation = 1;
        }else{
          modAnimation = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget getLoading(){
      List<Widget> lst = [];
      for(int i = 0; i < 30; i++){
        int iMod = i % 2;
        lst.add(AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.ease,
          width: 3,
          height: iMod == modAnimation ? 50 : 30,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
        ));
        lst.add(SizedBox(
          width: 3,
        ));
      }

      return Container(
        padding: EdgeInsets.all(10),
        height: 80,
        //color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: lst,
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            width: size.width,
            height: size.height - MediaQuery.of(context).padding.top,
            child: FadeTransition(
              opacity: animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset('assets/eduprog.png'),
                      ),
                    ),
                  ),
                  getLoading(),
                  Container(
                    child: Text("Loading..."),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.red,
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Text('Aplikasi Versi 1.0.0.0 ', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0), fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 15,
                            ),

                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
              ExpansionTile(
                title: Text("Section 1"),
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

                ],
              ),
              ExpansionTile(
                title: Text("Section 2"),
                children: <Widget>[

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
                  ),
                  Divider(),
                  ListTile(
                    title: Text("QrCode Generator", style: TextStyle(fontWeight: FontWeight.bold)) ,
                    subtitle: Text("Contoh generate QRCode"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QrCodeGeneratorPage(title: "Eduprog QrCode",)),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("QrCode / BarCode Scanner", style: TextStyle(fontWeight: FontWeight.bold)) ,
                    subtitle: Text("Contoh Scan Barcode dan QRCode"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QrCodeScannerPage(title: "Eduprog Bar/Qr Code",)),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Example Widget 8", style: TextStyle(fontWeight: FontWeight.bold)) ,
                    subtitle: Text("Contoh Widget bottomNavigationBar, floatingActionButton, ListView"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyExamplePage8(title: "Eduprog Page 8",)),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Animation 2", style: TextStyle(fontWeight: FontWeight.bold)) ,
                    subtitle: Text("Contoh animasi flutter untuk kemunculan tombol"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnimationPage2(title: "Eduprog Animation",)),
                      );
                    },
                  ),


                ],
              ),
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
