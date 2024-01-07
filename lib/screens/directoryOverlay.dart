import 'package:flutter/material.dart';
import 'package:impact/screens/challengeToday.dart';
import 'package:impact/screens/profilepage.dart';
import 'package:impact/screens/calendar.dart';


class DirectoryOverlay extends StatelessWidget {
  const DirectoryOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationOverlay(),
    );
  }
}

class BottomNavigationOverlay extends StatefulWidget {
  const BottomNavigationOverlay({super.key});

  @override
  _BottomNavigationOverlayState createState() => _BottomNavigationOverlayState();
}

class _BottomNavigationOverlayState extends State<BottomNavigationOverlay> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfilePage(),
    const Calendars(),
    ChallengeToday(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Challenge of Day',
          ),
        ],
      ),
    );
  }
}

