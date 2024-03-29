
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swafoody_gsc/previewimage.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Create a CameraController and set the resolution to the highest available
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    // Initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the screen is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the camera preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: SizedBox(
        height: 80, // Set the desired height of the button
        width: 80,  // Set the desired width of the button
        child: FloatingActionButton(
          onPressed: _captureImage,
          mini: false, // Set mini to false to make the button bigger
          backgroundColor: const Color(0xFF0C8B19),
          child: const Icon(
            Icons.camera_alt,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _captureImage() async {
    try {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoadingScreen()),
      // );

      final XFile image = await _controller.takePicture();

      // Navigate to the preview screen with the captured image
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImagePreviewScreen(imagePath: image.path)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error capturing image: $e');
      }
    }
  }
}

