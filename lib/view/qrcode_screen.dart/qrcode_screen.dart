// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  String product;
  QrScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('QR Code Screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RepaintBoundary(
                child: QrImageView(
                  data: product,
                  version: QrVersions.auto,
                  size: 250.0,
                  gapless: true,
                  errorStateBuilder: (ctx, err) {
                    return const Center(
                      child: Text(
                        'Something went wrong!!!',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
