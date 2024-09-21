import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trophy/Components/Activity/successfulPage.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:trophy/coinManage.dart';
import 'dart:convert';
import 'dart:io';

import 'package:trophy/constants.dart';

class Qrcodepage extends StatefulWidget {
  final String title;
  final String description;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitydate;
  final String activitytime;
  final String activityvenue;
  final String id;

  const Qrcodepage({
    super.key,
    required this.title,
    required this.description,
    required this.coinCount,
    required this.activitiesdetails,
    required this.activitiesmainimgUrl,
    required this.activitydate,
    required this.activitytime,
    required this.activityvenue,
    required this.id,
  });

  @override
  _QrcodepageState createState() => _QrcodepageState();
}

class _QrcodepageState extends State<Qrcodepage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = false;

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
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildQrView(context),
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
        borderLength: 50,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (!isScanning) {
        isScanning = true;

        // Extract unique key from the QR code data
        String? uniqueKey = scanData.code;
        print('Scanned unique key: $uniqueKey');

        // Send unique key to the backend with the activity ID
        await sendUniqueKeyToBackend(uniqueKey!, widget.id, widget.coinCount);

        // Once processed, pause scanning to prevent multiple scans
        controller.pauseCamera();
        setState(() {
          isScanning = false;
        });
      }
    });
  }

  Future<void> sendUniqueKeyToBackend(String uniqueKey, String activityId, int coinCount) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      String apiUrl = '$baseUrl/api/compareUniqueKey/$activityId';

      Map<String, String> requestBody = {
        'uniqueKey': uniqueKey,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(requestBody),
      );

      // Handle the response
      if (response.statusCode == 200) {
        print('Unique key sent successfully');
        addCoinsToBank(coinCount);
        // Navigate to the SuccessfulPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessfulPage(coinAmount: coinCount),
          ),
        );
      } else {
        print('Failed to send unique key: ${response.body}');
        // Navigate to the FailedPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FailedPage(),
          ),
        );
      }
    } catch (e) {
      print('Error sending unique key to backend: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
