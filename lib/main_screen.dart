
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // File? imageFile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman utama aplikasi swafoody'),
      ),
    );
  }
}