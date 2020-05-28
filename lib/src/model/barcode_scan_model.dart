import 'package:qr_code_manager_flutter/src/enum/scan_status.dart';

class BarcodeScanModel {
  String data;
  ScanStatus scanStatus;

  BarcodeScanModel({this.data, this.scanStatus});
}
