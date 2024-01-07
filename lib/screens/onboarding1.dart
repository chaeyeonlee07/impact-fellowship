import 'package:flutter/material.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

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
