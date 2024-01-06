
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  late PickedFile _imageFile;
   final ImagePicker _picker = ImagePicker();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 203, 235, 204),
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
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              icon: const Icon(Icons.camera),
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            )
          ],
        )
      ],
    ),
  );
}

void takePhoto(ImageSource source) async {
  final PickedFile = await _picker.getImage(
    source: source
  );
  SetState(() {
    _imageFile = pickedFile;
  });
}

Widget pfp(BuildContext context) {
  return Stack(
    children: <Widget>[
      const CircleAvatar(
        radius: 80,
        backgroundImage: _imageFile == null? AssetImage("lib/images/defaultpfp.png"): FileImage(_imageFile),
        
      ),
      Positioned(
        bottom: 10,
        right: 10,
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
            size: 50,
            shadows: [Shadow(color: Colors.black), ],
          ),
        ),
      ),
    ],
  );
}

