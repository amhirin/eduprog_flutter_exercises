import 'package:flutter/material.dart';

class PopupDialogPage extends StatefulWidget {
  PopupDialogPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PopupDialogPageState createState() => _PopupDialogPageState();
}

class _PopupDialogPageState extends State<PopupDialogPage> {

  List<Map<String, String>> lstMenu = [];

  List<Widget> buildListMenu(){
    List<Widget> lstWidget = [];

    for (int i = 0; i < lstMenu.length; i++){
      final Map mData = lstMenu[i];
      lstWidget.add(Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 60,
                alignment: Alignment.center,
                color: Colors.indigoAccent,
                child: Text(mData["text"], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.black26,
              width: 80,
              child: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: (){
                  setState(() {
                    lstMenu.remove(mData);
                  });
                },
                iconSize: 40,
                color: Colors.red,
              ),
            )

          ],
        ),
      ));
      lstWidget.add(Divider(color: Colors.black87,));
    }

    return lstWidget;
  }

  Future<String> _showStockChooserDialog(){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return MenuChooserDialog(title: "Pilih Menu",);
        }
    );
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              color: Colors.pink,
              child: Center(child: Text("Daftar Pesanan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[...buildListMenu()],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              color: Colors.black12,
              child: FlatButton.icon(onPressed: (){
                _showStockChooserDialog().then((val){
                    if (val == null) return;
                    lstMenu.add({
                      "id": "",
                      "text": val
                    });
                    setState(() {

                    });
                });
              }, icon: Icon(Icons.add_circle, size: 40,), label: Text("Tambah Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}


class MenuChooserDialog extends StatefulWidget {
  final String title;
  MenuChooserDialog({Key key, this.title}) : super(key: key);

  @override
  _MenuChooserDialogState createState() => _MenuChooserDialogState();

}

class _MenuChooserDialogState extends State<MenuChooserDialog> {

  List<Map<String, String>> _menuDataFiltered = [];
  List<Map<String, String>> _menuDataSource = [];
  final TextEditingController _filterController = TextEditingController();

  @override
  void initState() {
    _menuDataSource.addAll([{
        "id": "1",
        "text": "Cabe Goreng"
      },
      {
        "id": "2",
        "text": "Ee' Goreng"
      },
      {
        "id": "3",
        "text": "Bawang Goreng"
      },
      {
        "id": "4",
        "text": "Tempe Goreng"
      },
      {
        "id": "5",
        "text": "Pare Rebus"
      },
      {
        "id": "6",
        "text": "Jengkol Bakar"
      },
      {
        "id": "7",
        "text": "Pete Goreng"
      }
    ]
    );
    _menuDataFiltered = []..addAll(_menuDataSource);
    super.initState();
  }

  @override
  void dispose() {
    _filterController.dispose();
    _menuDataFiltered.clear();
    _menuDataSource.clear();
    super.dispose();
  }

  List<Widget> getRows(){
    List<Widget> lstWidget = [];
    lstWidget = _menuDataFiltered.map((Map menuData){
      return InkWell(
        onTap: (){
          Navigator.pop(context, menuData["text"]);
        },
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.redAccent,
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  )
              )
          ),
          //height: 40,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment:  Alignment.centerLeft,
                      child: Text("${menuData["text"]}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    Container(
                      alignment:  Alignment.centerLeft,
                      child: Text("Penjelasan detail tentang menu...",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal
                          )),
                    )

                  ],
                ),

              ),

            ],
          ),
        ),
      );
    }).toList();
    lstWidget = lstWidget.sublist(0, lstWidget.length > 50 ? 50 : lstWidget.length);
    return lstWidget;
  }

  void processFilterChange(String filterText){
    if(filterText?.isEmpty){
      _menuDataFiltered = []..addAll(_menuDataSource);
    }else{
      _menuDataFiltered = []..addAll(_menuDataSource);
      _menuDataFiltered.removeWhere((value) => !value["text"]?.toString().toLowerCase().contains(filterText.toLowerCase()));
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
      titlePadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      title: Container(
          color: Colors.blue,
          padding: EdgeInsets.fromLTRB(10,5,5,5),
          child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
      ),

      content: DefaultTextStyle(
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.blue,
            height: 400,
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TextField(
                            controller: _filterController,
                            onChanged: (filterText){
                              processFilterChange(filterText);
                            },
                            autofocus: true,
                            style: TextStyle(color: Colors.black87),
                            decoration: InputDecoration(
                              //suffixText: "By Code/Name",
                                suffixStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                                prefixIcon: Icon(Icons.search),
                                prefixStyle: TextStyle(color: Colors.blue),
                                hintText: "Cari Menu..",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 32.0),
                                    borderRadius: BorderRadius.circular(0.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 32.0),
                                    borderRadius: BorderRadius.circular(0.0)))
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: getRows(),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.redAccent,
          child: Text('Close'),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
