
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:impact/services/api_service.dart';
import 'package:impact/screens/onboarding1.dart';
import 'package:impact/screens/challengeToday.dart';
>>>>>>> ff06e4cbfed8ee576c131a8113afe17206991352

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
<<<<<<< HEAD
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: "Profile",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 203, 235, 204),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      
                      const Text(
                        
                        "Profile",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 39, 116, 43),
                        ),
                      ),
                      const SizedBox(height: 10) // Added SizedBox for spacing
                      ,
                      pfp(context)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

Widget bottomsheet(BuildContext context) {
  return Container(
    height: 100,
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        const Text(
          "Choose profile picture",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera),
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {},
              label: const Text("Gallery"),
            )
          ],
        )
      ],
    ),
  );
}


Widget pfp(BuildContext context) {
  return Stack(
    children: <Widget>[
      const CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage("assets/defaultpfp.png"),
        backgroundColor: Colors.white,
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (builder) => bottomsheet(context), // Pass the context here
            );
          },
          child: const Icon(
            Icons.camera_alt,
            color: Colors.teal,
            size: 20,
          ),
        ),
      ),
    ],
  );
}
=======
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: challengeToday(),
    );
  }
}
>>>>>>> ff06e4cbfed8ee576c131a8113afe17206991352
