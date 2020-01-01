import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        //color: Colors.red[100],
//        width: screenSize.width,
//        height: screenSize.height,
        scrollDirection: Axis.vertical,
        child: Stack(

          children: <Widget>[
            //make curves for desgining
            ClipPath(
              child: Container(
                color: Colors.blue[400],
                height: 140,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),
            ClipPath(
              child: Container(
                color: Colors.blue[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),

            //curves for bottom
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),

            SingleChildScrollView(
              child: Container(
                //for small
                width: screenSize.width,
                height: screenSize.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 200,
                      child: Image.asset("assets/eduprog.png", fit: BoxFit.contain,),
                    ),

                    SizedBox(height: 32,),
                    Container(
                      //height: 130,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),

                      ),

                      child: Column(
                        children: <Widget>[

                          TextField(
                            obscureText: false,
                            style: TextStyle( fontSize: 20.0),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Username",
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                          ),

                          Divider(color: Colors.transparent,),

                          TextField(
                            obscureText: true,
                            style: TextStyle( fontSize: 20.0),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Password",
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                          ),

                        ],
                      ),
                    ),
                    //SizedBox(height: 16,),
                    Container(
                      width: 350,
                      height: 80,
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                          color: Colors.blue[600],
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16),),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                          ),
                          onPressed: () {

                          }
                      ),
                      
                    ),

                  ],
                ),

              ),
            ),


          ],
        ),

      ),
    );
  }
}
