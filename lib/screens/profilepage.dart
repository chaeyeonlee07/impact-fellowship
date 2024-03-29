import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

int globalSeedPoints = 0;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  



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
                    const SizedBox(height: 25),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Yeseva',
                        color: Color.fromARGB(255, 39, 116, 43),
                      ),
                    ),
                    const SizedBox(height: 10) // Added SizedBox for spacing
                    ,
                    pfp(context),
                    const SizedBox(height: 30),
                    const Text("Your Seed Points",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Tenor',
                          color: Color.fromARGB(255, 39, 116, 43),
                        )),
                    const SizedBox(height: 15),
                    Text(
                      '$globalSeedPoints',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Tenor',
                        color: Color.fromARGB(255, 39, 116, 43),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
                icon: const Icon(Icons.camera_alt),
                
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
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Widget pfp(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: _imageFile == null
              ? const AssetImage("lib/images/defaultpfp.png")
              : _imageFile != null
                  ? FileImage(File(_imageFile!.path)) as ImageProvider<Object>?
                  : null,
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => bottomsheet(context),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}