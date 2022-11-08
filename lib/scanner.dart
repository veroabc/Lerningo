import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io' show Platform;
import 'db_helper.dart';
import 'main_model.dart';

class Scanner extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<StatefulWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Word? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  'Result: ${result!.english}')
                  : Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {

      var qrCodeID = int.tryParse(scanData.code ?? "");
      if (qrCodeID == null) {
        return;
      }
      
      SQLiteDbProvider.db.getWordByID(qrCodeID).then((value) =>  setState(() {
        if (value == null) {
          return;
        }
        result = value;
      }));

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
