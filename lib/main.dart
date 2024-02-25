import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}

// make splash screen and then go to main screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(8, 119, 87, 1),
        child: const Center(
          child: Image(
            image: AssetImage('images/logo_swafoody.png'),
            width: 150.0,
            height: 150.0,
          ),
        ));
  }
}

