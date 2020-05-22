import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_manager_flutter/src/enum/qr_status.dart';
import 'package:qr_code_manager_flutter/src/model/qr_status_model.dart';
import 'package:qr_code_manager_flutter/src/qr_code_view.dart';

class QrCodeManager {
  static Future<QrStatusModel> scanQrCode() async {
    var qrStatusModel = QrStatusModel();

    try {
      var result = await BarcodeScanner.scan();
      print(result);
      qrStatusModel.data = result;
      qrStatusModel.qrStatus = QrStatus.SUCCESS;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        qrStatusModel.qrStatus = QrStatus.NEED_CAMERA_PERMISSION;
      } else {
        qrStatusModel.qrStatus = QrStatus.ERROR;
      }
    } on FormatException {
      qrStatusModel.qrStatus = QrStatus.CANCEL;
    } catch (e) {
      qrStatusModel.qrStatus = QrStatus.ERROR;
    }

    return qrStatusModel;
  }

  static Widget createQrCode({@required String data, Color color = Colors.white, double size = 300}) {
    return QrCodeView(
      data: data,
      size: size,
      color: color,
    );
  }
}
