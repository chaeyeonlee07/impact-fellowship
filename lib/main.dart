import 'package:flutter/material.dart';
import 'package:impact/screens/camera.dart';
import 'package:impact/services/api_service.dart';
import 'package:impact/screens/onboarding1.dart';
import 'package:impact/screens/challengeToday.dart';
import 'package:impact/screens/challengeToday.dart';
import 'package:impact/screens/directoryoverlay.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(App(cameras: cameras));
}

class App extends StatelessWidget {
  // const App({Key? key}) : super(key: key);
  final List<CameraDescription> cameras;
  const App({Key? key, required this.cameras}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:
          OnBoarding1(), // replace with CameraScreen(cameras: cameras) to see camera page
    );
  }
}
