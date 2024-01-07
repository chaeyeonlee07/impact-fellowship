import 'package:flutter/material.dart';
import 'package:impact/screens/directoryoverlay.dart';


class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});


  @override
  _OnBoarding1 createState() => _OnBoarding1();
}

class _OnBoarding1 extends State<OnBoarding1> {

  // Simulate a delay of 3 seconds
  Future<void> _mockSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void initState() {
    super.initState();

    _mockSplashScreen().then(
      (_) {
        // After the splash screen, navigate to the main page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DirectoryOverlay()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 253, 249, 175),
                Color.fromARGB(255, 147, 203, 111)
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Nature Quest',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily:
                    'Yeseva', // Replace 'Yeseva' with the actual font family name
              ),
            ),
          ),
        ),
      ),
    );
  }
}
