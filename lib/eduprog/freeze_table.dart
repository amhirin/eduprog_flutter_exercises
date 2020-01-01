import 'package:flutter/material.dart';

class FreezeColumnPage extends StatefulWidget {
  FreezeColumnPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FreezeColumnPageState createState() => _FreezeColumnPageState();
}

class _FreezeColumnPageState extends State<FreezeColumnPage> {

  TextStyle headerStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  Color colorHeader = Colors.blue;
  Color colorRow = Colors.grey[200];

  Widget getRow_Freeze(int index){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      height: 60,
      decoration: BoxDecoration(
          color: colorRow,
          border: Border(
              bottom: BorderSide(
                  color: Colors.black87
              )
          )
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("Row.Col $index-1"),
          ),
          Expanded(
            child: Text("Row.Col $index-2"),
          ),
        ],
      ),
    );
  }

  Widget getRow_Unfreeze(int index){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      height: 60,
      decoration: BoxDecoration(
        color: colorRow,
        border: Border(
          bottom: BorderSide(
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 110,
            child: Text("Row.Col $index-3"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-4"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-5"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-6"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-7"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-8"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-9"),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-10"),
          ),
        ],
      ),
    );
  }

  Widget getCol_Freeze(){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      color: colorHeader,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("Col 1", style: headerStyle,),
          ),
          Expanded(
            child: Text("Col 2", style: headerStyle,),
          ),
        ],
      ),
    );
  }

  Widget getCol_Unfreeze(){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      color: colorHeader,
      child: Row(
        children: <Widget>[
          Container(
            width: 110,
            child: Text("Col 3", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 4", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 5", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 6", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 7", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 8", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 9", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 10", style: headerStyle,),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              child: Column(
                children: <Widget>[
                  getCol_Freeze(),
                  getRow_Freeze(1),
                  getRow_Freeze(2),
                  getRow_Freeze(3),
                  getRow_Freeze(4),
                  getRow_Freeze(5),
                  getRow_Freeze(6),
                  getRow_Freeze(7),
                  getRow_Freeze(8),
                  getRow_Freeze(9),
                  getRow_Freeze(10),

                ],
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(

                  child: Column(
                    children: <Widget>[
                      getCol_Unfreeze(),
                      getRow_Unfreeze(1),
                      getRow_Unfreeze(2),
                      getRow_Unfreeze(3),
                      getRow_Unfreeze(4),
                      getRow_Unfreeze(5),
                      getRow_Unfreeze(6),
                      getRow_Unfreeze(7),
                      getRow_Unfreeze(8),
                      getRow_Unfreeze(9),
                      getRow_Unfreeze(10),


                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}

class FreezeRowPage extends StatefulWidget {
  FreezeRowPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FreezeRowPageState createState() => _FreezeRowPageState();
}

class _FreezeRowPageState extends State<FreezeRowPage> {

  TextStyle headerStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  TextStyle rowStyle = TextStyle(fontSize: 15);
  Color colorHeader = Colors.blue;
  Color colorRow = Colors.grey[300];

  Widget getRow(int index){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      height: 60,
      decoration: BoxDecoration(
          color: colorRow,
          border: Border(
              bottom: BorderSide(
                color: Colors.black87
              )
          )
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 110,
            child: Text("Row.Col $index-1", style: rowStyle,),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-2", style: rowStyle),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-3", style: rowStyle),
          ),
          Container(
            width: 110,
            child: Text("Row.Col $index-4", style: rowStyle),
          ),

        ],
      ),
    );
  }

  Widget getCol(){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      color: colorHeader,
      child: Row(
        children: <Widget>[
          Container(
            width: 110,
            child: Text("Col 1", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 2", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 3", style: headerStyle,),
          ),
          Container(
            width: 110,
            child: Text("Col 4", style: headerStyle,),
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    getCol(),
                    getRow(1),
                    getRow(2),
                    getRow(3),
                    Container( //. untuk separator
                      height: 5,
                      color: Colors.grey,

                    ),
                  ],
                ),
              ),
              Expanded( //. unfreeze area
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        getRow(4),
                        getRow(5),
                        getRow(6),
                        getRow(7),
                        getRow(8),
                        getRow(9),
                        getRow(10),
                        getRow(11),
                        getRow(12),
                        getRow(13),
                        getRow(14),
                        getRow(15),
                        getRow(16),
                        getRow(17),
                        getRow(18),
                        getRow(19),
                        getRow(20),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}