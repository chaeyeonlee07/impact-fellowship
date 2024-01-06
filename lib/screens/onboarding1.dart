import 'package:flutter/material.dart';

class onBoarding1 extends StatelessWidget {
  const onBoarding1({super.key});

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
              'Wood Wonder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontFamily: 'Yeseva',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
