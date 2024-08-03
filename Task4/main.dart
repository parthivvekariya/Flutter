import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart'; // Use tflite_flutter instead of tflite
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PalmScanner(),
    );
  }
}

class PalmScanner extends StatefulWidget {
  @override
  _PalmScannerState createState() => _PalmScannerState();
}

class _PalmScannerState extends State<PalmScanner> {
  late File _image;
  final picker = ImagePicker();
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('palm_detection.tflite');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> _detectPalm(File image) async {
    // Implement palm detection using tflite_flutter here
    // ...
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _detectPalm(_image);
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palm Scanner'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
