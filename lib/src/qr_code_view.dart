import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({
    Key key,
    this.data,
    this.size,
    this.color
  }) : super(key: key);

  @override
  _QrCodeViewState createState() => _QrCodeViewState();
  final String data;
  final double size;
  final Color color;
}

class _QrCodeViewState extends State<QrCodeView> {
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: widget.data,
      version: QrVersions.auto,
      backgroundColor: widget.color,
      size: widget.size,
    );
  }
}
