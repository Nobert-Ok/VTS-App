import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrResult = "Code not Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Scanned Results",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrResult,
              style: TextStyle(
                fontSize: 15.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(20.0),
              onPressed: () async {
                String codeSanner =
                    // Scanner
                    await BarcodeScanner.scan();
                setState(() {
                  qrResult = codeSanner;
                });
              },
              child: Text(
                "Scan Now",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0)),
            )
          ],
        ),
      ),
    );
  }

  //its quite simple as that you can use try and catch staatements too for platform exception
}
