import 'package:flutter/material.dart';

class ResponsivePage extends StatefulWidget {
  ResponsivePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ResponsivePageState createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {

  //var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            int colCount = 0;
            print(constraints.maxWidth);
            print(constraints.maxHeight);

            if (constraints.maxWidth > 600){
              //. grid dengan 3 kolom
              colCount = 3;
            }else{
              //. grid dengan 2 kolom
              colCount = 2;

            }

            return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: colCount,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Item 1'),
                    color: Colors.blue[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Item 2'),
                    color: Colors.blue[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Item 3'),
                    color: Colors.blue[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Item 4'),
                    color: Colors.blue[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Item 5'),
                    color: Colors.blue[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Item 6'),
                    color: Colors.blue[600],
                  ),
                ]

            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
