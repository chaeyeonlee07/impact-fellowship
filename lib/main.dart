import 'package:flutter/material.dart';
import 'package:impact/services/api_service.dart';
import 'package:impact/screens/onboarding1.dart';
import 'package:impact/screens/challengeToday.dart';
import 'package:impact/screens/directoryOverlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ApiService().executeApiService();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DirectoryOverlay(),
    );
  }
}