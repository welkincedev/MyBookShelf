import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanBookScreen extends StatefulWidget {
  const ScanBookScreen({super.key});

  @override
  State<ScanBookScreen> createState() => _ScanBookScreenState();
}

class _ScanBookScreenState extends State<ScanBookScreen> {
  final MobileScannerController controller = MobileScannerController();
  bool scanned = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleBarcode(BarcodeCapture capture) {
    if (scanned) return;
    final barcode = capture.barcodes.first;
    final raw = barcode.rawValue;
    if (raw != null) {
      scanned = true;
      Navigator.pop(context, raw);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Book Barcode')),
      body: MobileScanner(controller: controller, onDetect: handleBarcode),
    );
  }
}
