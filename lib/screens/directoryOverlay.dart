import 'package:flutter/material.dart';
import 'package:impact/screens/challengeToday.dart';
import 'package:impact/screens/profilepage.dart';
import 'package:impact/screens/calendar.dart';
import 'package:impact/screens/camera.dart';
import 'package:camera/camera.dart';


class DirectoryOverlay extends StatefulWidget {
  const DirectoryOverlay({super.key});

  @override
  _DirectoryOverlayState createState() => _DirectoryOverlayState();
}

class _DirectoryOverlayState extends State<DirectoryOverlay> {
  List<CameraDescription>? camerasList;

  @override
  void initState() {
    super.initState();
    initializeCameras();
  }

  Future<void> initializeCameras() async {
    camerasList = await availableCameras();
    setState(() {}); // Trigger a rebuild after initializing cameras
  }

  @override
  Widget build(BuildContext context) {
    // Check if camerasList is null or empty before building the UI
    if (camerasList == null) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationOverlay(camerasList: camerasList),
    );
  }
}



class BottomNavigationOverlay extends StatefulWidget {
  final List<CameraDescription>? camerasList;

  const BottomNavigationOverlay({
    Key? key,
    required this.camerasList,
  }) : super(key: key);

  @override
  _BottomNavigationOverlayState createState() =>
      _BottomNavigationOverlayState();
}

class _BottomNavigationOverlayState extends State<BottomNavigationOverlay> {
  late int _currentIndex;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _initializeScreens();
  }

  void _initializeScreens() {
    _screens = [
      const ProfilePage(),
      ChallengeToday(),
      if (widget.camerasList != null)
        CameraScreen(cameras: widget.camerasList!),
      const Calendars(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: const Color.fromARGB(255, 33, 226, 39),
        unselectedItemColor: const Color.fromARGB(159, 0, 97, 24),  
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Challenge of Day',
          ),
          if (widget.camerasList != null)
            const BottomNavigationBarItem(
              icon: Icon(Icons.camera_enhance_outlined),
              label: 'Camera',
            ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}

