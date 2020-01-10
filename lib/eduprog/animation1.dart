import 'package:flutter/material.dart';

class AnimationPage1 extends StatefulWidget {
  final String title;

  AnimationPage1({Key key, this.title}) : super(key: key);

  @override
  _AnimationPage1State createState() => _AnimationPage1State();
}


class _AnimationPage1State extends State<AnimationPage1> {

  var selectedAnimatedCard = 'KUCING';
  var selectedNonAnimatedCard = 'KUCING';


  selectAnimatedCard(cardTitle) {
    setState(() {
      selectedAnimatedCard = cardTitle;
    });
  }

  selectNonAnimatedCard(cardTitle) {
    setState(() {
      selectedNonAnimatedCard = cardTitle;
    });
  }

  Widget _buildAnimatedCard(String cardTitle, String info) {
    return InkWell(
        onTap: () {
          selectAnimatedCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedAnimatedCard ? Colors.teal.withOpacity(0.8) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedAnimatedCard ?
                  Colors.transparent :
                  Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75
              ),

            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontSize: 12.0,
                          color:
                          cardTitle == selectedAnimatedCard ? Colors.white : Colors.grey,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child:  Text(info,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: cardTitle == selectedAnimatedCard
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold)),
                  )
                ]
            )
        )
    );
  }

  Widget _buildNonAnimatedCard(String cardTitle, String info) {
    return InkWell(
        onTap: () {
          selectNonAnimatedCard(cardTitle);
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedNonAnimatedCard ? Colors.teal.withOpacity(0.8) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedNonAnimatedCard ?
                  Colors.transparent :
                  Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75
              ),

            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontSize: 12.0,
                          color:
                          cardTitle == selectedNonAnimatedCard ? Colors.white : Colors.grey,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child:  Text(info,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: cardTitle == selectedNonAnimatedCard
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold)),
                  )
                ]
            )
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.deepOrangeAccent,
                child: Center(child: Text("Tanpa Animasi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildNonAnimatedCard('KUCING', 'Tanpa Animasi'),
                    SizedBox(width: 10.0),
                    _buildNonAnimatedCard('ANJING', 'Tanpa Animasi'),
                    SizedBox(width: 10.0),
                    _buildNonAnimatedCard('BEBEK', 'Tanpa Animasi'),
                    SizedBox(width: 10.0),
                    _buildNonAnimatedCard('ULAR', 'Tanpa Animasi'),
                  ],
                )
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.deepOrangeAccent,
                child: Center(child: Text("Dengan Animasi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _buildAnimatedCard('KUCING', 'Dengan Animasi'),
                      SizedBox(width: 10.0),
                      _buildAnimatedCard('ANJING', 'Dengan Animasi'),
                      SizedBox(width: 10.0),
                      _buildAnimatedCard('BEBEK', 'Dengan Animasi'),
                      SizedBox(width: 10.0),
                      _buildAnimatedCard('ULAR', 'Dengan Animasi'),
                    ],
                  )
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )
    );
  }
}

