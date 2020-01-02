import 'package:flutter/material.dart';

class ChipSelectionPage extends StatefulWidget {
  ChipSelectionPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ChipSelectionPageState createState() => _ChipSelectionPageState();
}



class _ChipSelectionPageState extends State<ChipSelectionPage> {

  int _single_index = -1;
  List<bool> _multi_index = [false, false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(239, 228, 176, 1.0),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text("Single ChipChoice", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text("Supaya hidup bahagia, harus memiliki ? ..."),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(5),
                child: Wrap(
                  spacing: 10,
                  children: <Widget>[
                    ChoiceChip(
                      selected: _single_index == 0 ? true : false,
                      label: Text("0 Istri"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _single_index = 0;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _single_index == 1 ? true : false,
                      label: Text("1 Istri"),
                      onSelected: (b){
                        setState(() {
                          _single_index = 1;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _single_index == 2 ? true : false,
                      label: Text("2 Istri"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _single_index = 2;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _single_index == 3 ? true : false,
                      label: Text("3 Istri"),
                      onSelected: (b){
                        setState(() {
                          _single_index = 3;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _single_index == 4 ? true : false,
                      label: Text("4 Istri"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _single_index = 4;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _single_index == 5 ? true : false,
                      label: Text("5 Istri"),
                      onSelected: (b){
                        setState(() {
                          _single_index = 5;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _single_index == 6 ? true : false,
                      label: Text("6 Istri"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _single_index = 6;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _single_index == 7 ? true : false,
                      label: Text("7 Istri"),
                      onSelected: (b){
                        setState(() {
                          _single_index = 7;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _single_index == 8 ? true : false,
                      label: Text("8 Istri"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _single_index = 8;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _single_index == 9 ? true : false,
                      label: Text("9 Istri"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _single_index = 9;
                        });
                      },
                    ),

                  ],
                ),
              ),
              Container(
                color: Color.fromRGBO(239, 228, 176, 1.0),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text("Multiple ChipChoice", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text("Berikut ini adalah hewan yang merayap ? ..."),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(5),
                child: Wrap(
                  spacing: 10,
                  children: <Widget>[
                    ChoiceChip(
                      selected: _multi_index[0],
                      label: Text("Ular"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _multi_index[0] = b;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _multi_index[1],
                      label: Text("Kambing"),
                      onSelected: (b){
                        setState(() {
                          _multi_index[1] = b;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _multi_index[2],
                      label: Text("Cicak"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _multi_index[2] = b;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _multi_index[3],
                      label: Text("Kucing"),
                      onSelected: (b){
                        setState(() {
                          _multi_index[3] = b;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _multi_index[4],
                      label: Text("Si Boby"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _multi_index[4] = b;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _multi_index[5],
                      label: Text("Tokek"),
                      onSelected: (b){
                        setState(() {
                          _multi_index[5] = b;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _multi_index[6],
                      label: Text("Nyamuk"), // your custom label widget
                      onSelected: (b){
                        setState(() {
                          _multi_index[6] = b;
                        });
                      },
                    ),
                    ChoiceChip(
                      selected: _multi_index[7],
                      label: Text("Laba-Laba"),
                      onSelected: (b){
                        setState(() {
                          _multi_index[7] = b;
                        });
                      },// your custom label widget
                    ),
                    ChoiceChip(
                      selected: _multi_index[8],
                      label: Text("Cacing"),
                      onSelected: (b){
                        setState(() {
                          _multi_index[8] = b;
                        });
                      },// your custom label widget
                    ),

                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}