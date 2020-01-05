import 'package:flutter/material.dart';

class MyExamplePage8 extends StatefulWidget {

  final String title;


  MyExamplePage8({Key key, this.title}) : super(key: key);

  @override
  _MyExamplePage8State createState() => _MyExamplePage8State();
}


class _MyExamplePage8State extends State<MyExamplePage8> {
  int _selectedTab = 0;
  List<Widget> _pages = [];

  Widget _getPageHome(){
    return ListView(
      children: <Widget>[
        ExpansionTile(
          leading: Icon(Icons.access_alarm),
          title: Text("Menu 1"),
          subtitle: Text("Deskripsi tentang menu 1"),
          children: <Widget>[
            ListTile(
              title: Text("Sub Menu 1.0"),
            ),
            ListTile(
              title: Text("Sub Menu 1.1"),
            )
          ],
        ),
        ExpansionTile(
          leading: Icon(Icons.account_balance_wallet),
          title: Text("Menu 2"),
          subtitle: Text("Deskripsi tentang menu 2"),
          children: <Widget>[
            ListTile(
              title: Text("Sub Menu 2.0"),
            ),
            ListTile(
              title: Text("Sub Menu 2.1"),
            )
          ],
        )
      ],
    );
  }

  Widget _getPageProfile(){
    return Container(
      child: Center(child: Text("Page Profile"),),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _pages.add(_getPageHome());
    _pages.add(_getPageProfile());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[500],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile")
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedTab = index;
          });
        },
        showUnselectedLabels: true,
        iconSize: 42,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("floatingActionButton pressed");
        },
        elevation: 0,
        child: Icon(Icons.add, size: 42,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[_selectedTab],
    );
  }
}