import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class KameraPage extends StatefulWidget {
  const KameraPage({Key? key}) : super(key: key);

  @override
  _KameraPageState createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  late CameraController _cameraController;
  Future<void>? _cameraInitialization;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Initialize the camera controller
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await _cameraController.initialize();

    // Other initialization logic if needed
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamera'),
      ),
      body: _cameraInitialization == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : FutureBuilder<void>(
        future: _cameraInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Failed to initialize camera'),
              );
            } else {
              return CameraPreview(_cameraController);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
