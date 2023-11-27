// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  String productId;
  QrScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('QR Code Screen'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.download),
          onPressed: () {},
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('QR Code Will Appear Here'),
              // child: QrImage(
              //   data: productId,
              //   version: QrVersions.auto,
              //   size: 200.0,
              // ),
            )
          ],
        ),
      ),
    );
  }
}
