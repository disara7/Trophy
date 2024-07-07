import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'dart:io'; // Add this import for Platform

class Qrcodepage extends StatefulWidget {
  final String title;
  final String description;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitydate;
  final String activitytime;
  final String activityvenue;

  const Qrcodepage({
    required this.title,
    required this.description,
    required this.coinCount,
    required this.activitiesdetails,
    required this.activitiesmainimgUrl,
    required this.activitydate,
    required this.activitytime,
    required this.activityvenue,
  });

  @override
  _QrcodepageState createState() => _QrcodepageState();
}

class _QrcodepageState extends State<Qrcodepage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

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
      appBar: CustomAppBar(
        title: 'Activities',
        coinCount: 500,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildQrView(context), // Add the QR scanner view
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // Handle scanned data here
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
