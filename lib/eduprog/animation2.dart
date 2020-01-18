import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPage2 extends StatefulWidget {
  final String title;

  AnimationPage2({Key key, this.title}) : super(key: key);

  @override
  _AnimationPage2State createState() => _AnimationPage2State();
}


class _AnimationPage2State extends State<AnimationPage2> {

  double _btnWidth = 0;
  double _btnHeight = 0;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    //. test pertama saat load
    Future.delayed(Duration(milliseconds: 500), (){
      _btnWidth = 350;
      _btnHeight = 70;
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: RaisedButton(
                        color: Colors.green,
                        child: Text("SHOW", style: TextStyle(color: Colors.white, fontSize: 16),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                        onPressed: () {
                          setState(() {
                            _btnWidth = 350;
                            _btnHeight = 70;
                          });
                        }
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: RaisedButton(
                        color: Colors.red,
                        child: Text("HIDE", style: TextStyle(color: Colors.white, fontSize: 16),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                        onPressed: () {
                          setState(() {
                            _btnWidth = 0;
                            _btnHeight = 0;
                          });
                        }
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceOut,
                height: _btnHeight,
                width: _btnWidth,
                child: RaisedButton(
                    color: Colors.orange,
                    child: Text("BUTTON 1", style: TextStyle(color: Colors.white, fontSize: 16),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                    onPressed: () {

                    }
                )
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceIn,
                height: _btnHeight,
                width: _btnWidth,
                child: RaisedButton(
                    color: Colors.red,
                    child: Text("BUTTON 2", style: TextStyle(color: Colors.white, fontSize: 16),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {

                    }
                )
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.ease,
                height: _btnHeight,
                width: _btnWidth,
                child: RaisedButton(
                    color: Colors.green,
                    child: Text("BUTTON 3", style: TextStyle(color: Colors.white, fontSize: 16),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {

                    }
                )
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.slowMiddle,
                height: _btnHeight,
                width: _btnWidth,
                child: RaisedButton(
                    color: Colors.teal,
                    child: Text("BUTTON 4", style: TextStyle(color: Colors.white, fontSize: 16),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {

                    }
                )
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}