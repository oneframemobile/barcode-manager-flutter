import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_manager_flutter/src/enum/scan_status.dart';
import 'package:qr_code_manager_flutter/src/model/barcode_scan_model.dart';
import 'package:qr_code_manager_flutter/src/qr_code_view.dart';

class BarcodeManager {
  static Future<BarcodeScanModel> scanBarcode() async {
    var barcodeScanModel = BarcodeScanModel();

    try {
      var result = await BarcodeScanner.scan();
      print(result);
      barcodeScanModel.data = result;
      barcodeScanModel.scanStatus = ScanStatus.SUCCESS;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        barcodeScanModel.scanStatus = ScanStatus.NEED_CAMERA_PERMISSION;
      } else {
        barcodeScanModel.scanStatus = ScanStatus.ERROR;
      }
    } on FormatException {
      barcodeScanModel.scanStatus = ScanStatus.CANCEL;
    } catch (e) {
      barcodeScanModel.scanStatus = ScanStatus.ERROR;
    }

    return barcodeScanModel;
  }

  static Widget createQrCode(String data, {Color color = Colors.white, double size = 300}) {
    return QrCodeView(
      data: data,
      size: size,
      color: color,
    );

    // data: Value to be placed in the barcode [REQUIRED]
    // size: The size on the screen [OPTIONAL]
    // color: Changes the color of the barcode [OPTIONAL]
  }
}
