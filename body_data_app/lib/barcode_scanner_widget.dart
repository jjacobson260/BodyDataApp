import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class BarcodeScannerWidget extends StatefulWidget {
  @override
  _BarcodeScannerWidgetState createState() => _BarcodeScannerWidgetState();
}

class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
  CameraController? _cameraController;
  BarcodeScanner _barcodeScanner = BarcodeScanner();
  bool _isProcessing = false;
  String? _barcodeResult;

  final Logger _logger = Logger('BarcodeScannerWidget');

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final camera = cameras.first;

      _cameraController = CameraController(
        camera,
        ResolutionPreset.medium,
      );

      await _cameraController?.initialize();

      setState(() {});

      _cameraController?.startImageStream(_processCameraImage);
    } catch (e) {
      _logger.severe('Error initializing camera\nerror:$e');
    }
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (_isProcessing) return;

    _isProcessing = true;

    try {
      final inputImage = InputImage.fromBytes(
        bytes: image.planes.first.bytes,
        metadata: InputImageMetadata(
          bytesPerRow: image.width * 4,
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: InputImageRotation.rotation0deg, // Adjust as needed
          format: InputImageFormat.nv21, // Assuming nv21 format
        ),
      );

      final List<Barcode> barcodes = await  await _barcodeScanner!.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        setState(() {
          _barcodeResult = barcodes.first.rawValue;
        });

        // Return the barcode result and pop the screen (consider error handling)
        Navigator.of(context).pop(_barcodeResult);
      }
    } catch (e) {
      print('Error processing image: $e');
    } finally {
      _isProcessing = false;
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: _cameraController == null || !_cameraController!.value.isInitialized
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                CameraPreview(_cameraController!),
                if (_barcodeResult != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.black54,
                      child: Text(
                        'Barcode Result: $_barcodeResult',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
