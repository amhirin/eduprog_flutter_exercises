import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeGeneratorPage extends StatefulWidget {

  final String title;


  QrCodeGeneratorPage({Key key, this.title}) : super(key: key);

  @override
  _QrCodeGeneratorState createState() => _QrCodeGeneratorState();
}


class _QrCodeGeneratorState extends State<QrCodeGeneratorPage> {
  String _qrData = "www.eduprog.net";
  final _txtQrCode = TextEditingController();

  @override
  void dispose() {
    _txtQrCode.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _txtQrCode.text = _qrData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: QrImage(
                    data: _qrData,
                    version: QrVersions.auto,
                    size: 280,
                    gapless: false,
//                  embeddedImage: AssetImage('assets/eduprog.png'),
//                  embeddedImageStyle: QrEmbeddedImageStyle(
//                    size: Size(80, 80),
//                  )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _txtQrCode,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                      hintText: 'Masukan data QrCode'
                  ),
                ),

                Container(
                  width: 200,
                  height: 80,
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                      color: Colors.blue[600],
                      child: Text("Generate", style: TextStyle(color: Colors.white, fontSize: 16),),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30),
                      ),
                      onPressed: () {
                        if ((_txtQrCode.text ?? "").toString().length > 0){
                          setState(() {
                            _qrData = _txtQrCode.text.toString();
                          });
                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Data QrCode tidak boleh kosong."),));
                        }
                      }
                  )
                ),

              ],
            ),
          ),
        )
    );
  }
}


class QrCodeScannerPage extends StatefulWidget {

  final String title;


  QrCodeScannerPage({Key key, this.title}) : super(key: key);

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}


class _QrCodeScannerState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  String qrText = "";


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(children:
              <Widget>[
                Text("Result of scan = $qrText", style: TextStyle(fontSize: 18)),
                RaisedButton(
                  color: Colors.green[600],
                  onPressed: (){
                    if(controller != null){
                      controller.flipCamera();
                    }
                  },
                  child: Text(
                      'Flip Camera',
                      style: TextStyle(fontSize: 20)
                  ),
                )
              ],
              ),
            )
          ],
        )
    );
  }
}