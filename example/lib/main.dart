import 'package:flutter/material.dart';
import 'package:qr_code_manager_flutter/src/barcode_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'QR Code Manager App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Manager'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: BarcodeManager.createQrCode(
                "QR Code Created",
              )),
              FlatButton(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Text(
                    "Scan a Barcode",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  var scannedValue = await BarcodeManager.scanBarcode();
                  print(scannedValue);
                },
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
