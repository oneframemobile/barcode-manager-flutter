import 'package:flutter/material.dart';
import 'package:qr_code_manager_flutter/src/qr_code_manager.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Qr Code View'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: QrCodeManager.createQrCode(
                    data: "QrCode",
                  )),
              FlatButton(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Text(
                    "Scan Qr Code",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  var scannedValue = await QrCodeManager.scanQrCode();
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
