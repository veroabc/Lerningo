import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_app/word_list.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io' show Platform;
import 'db_helper.dart';
import 'word_popup.dart';
import 'package:confetti/confetti.dart';


class Scanner extends StatefulWidget {
  final Function onScanComplete;

  Scanner(this.onScanComplete, {super.key});

  @override
  QRViewState createState() => QRViewState(onScanComplete);
}

class QRViewState extends State<StatefulWidget> {
  final Function onScanComplete;
  int userScore = 0;

  QRViewState(this.onScanComplete);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Word? result;
  QRViewController? controller;

  late ConfettiController _centerController;

  bool isDialogOpen = false;


  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _centerController =
        ConfettiController(duration: const Duration(milliseconds: 300));
  }

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
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    controller?.dispose();
    super.dispose();
  }

  updateUserScore() {
    SQLiteDbProvider.db.getUserScore().then((value) =>
    {
      setState(() {
        userScore = value!;
      })
    }
      ,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Objects"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 20, right: 20.0),
              child: Text('Your Word Score: $userScore')
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  SQLiteDbProvider.db.getAllWords().then((words) => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WordList(words)),
                    )
                  });
                },
                child: const Icon(
                  Icons.list,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _centerController,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 160,
              minBlastForce: 50,
              emissionFrequency: 0.0,

              // 10 paticles will pop-up at a time
              numberOfParticles: 80,
              // particles will pop-up
              gravity: 0.06,
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

        if (!isDialogOpen) {
          buildWordPopup(context, result!, () => {
            isDialogOpen = false,
            _centerController.play(),
            SQLiteDbProvider.db.insertScannedWord(qrCodeID).then((value) =>
            {onScanComplete(), updateUserScore()}),
          }, null);
          isDialogOpen = true;
        }
      }));

    });

    controller.pauseCamera();
    controller.resumeCamera();
  }
}

/*

// COnfetti Code

          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _centerController,
              blastDirectionality: BlastDirectionality.explosive,
              maxBlastForce: 160,
              minBlastForce: 50,
              emissionFrequency: 0.0,

              // 10 paticles will pop-up at a time
              numberOfParticles: 80,
              // particles will pop-up
              gravity: 0.06,
            ),
          ),

// APP BAR CODE

      appBar: AppBar(
        title: Text("Scan Objects"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  SQLiteDbProvider.db.getAllWords().then((words) => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WordList(words)),
                    )
                  });
                },
                child: const Icon(
                  Icons.list,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
 */