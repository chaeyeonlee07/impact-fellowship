import 'package:flutter/material.dart';
import 'package:impact/screens/profilepage.dart';
import 'package:impact/services/api_service.dart';
import 'package:impact/models/specie.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'dart:io';
import 'package:impact/profilepage.dart';

class ChallengeToday extends StatefulWidget {
  const ChallengeToday({Key? key}) : super(key: key);

  @override
  ChallengeTodayState createState() => ChallengeTodayState();
}

class ChallengeTodayState extends State<ChallengeToday> {
  final Future<List<Specie>> species =
      ApiService.getSpeciesInArea(55.96, 55.97, 12.20, 12.25);

  Map<int, File?> selectedImagesMap = {}; // Map to store selected images for each challenge

  Future<void> initializeCameras() async {
    // Your camera initialization logic
  }

  @override
  void initState() {
    super.initState();
    initializeCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 148, 189, 124),
        foregroundColor: const Color.fromARGB(255, 254, 254, 253),
        title: const Text(
          "Challenge of the Day",
          style: TextStyle(fontSize: 24, fontFamily: 'Yeseva'),
        ),
      ),
      body: FutureBuilder(
        future: species,
        builder: (context, AsyncSnapshot<List<Specie>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var specie = snapshot.data![index];
                  return GestureDetector(
                    onTap: () async {
                      // Open the gallery and get the selected image
                      final pickedFile =
                          await ImagePicker().pickImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        setState(() {
                          selectedImagesMap[index] = File(pickedFile.path);
                        });
                        globalSeedPoints += 1;
                      }

                      // Do something with the selected image if needed
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      // ... Your existing code ...

                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              offset: const Offset(1, -10),
                              color: selectedImagesMap[index] != null
                                  ? const Color.fromARGB(255, 169, 191, 129) // Change the color when an image is selected
                                  : const Color.fromARGB(255, 194, 219, 148).withOpacity(0.9),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Use the selected image or default if not set
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: selectedImagesMap[index] != null
                                  ? Image.file(selectedImagesMap[index]!)
                                  : getImageForKingdom(specie.kingdom),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                specie.specieName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Tenor',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ... Your existing code ...

                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              );
            } else {
              return const Center(
                child: Text(
                  'No species data available',
                  style: TextStyle(fontSize: 18, fontFamily: 'Tenor'),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget getImageForKingdom(String kingdom) {
    String imageUrl;
    switch (kingdom.toLowerCase()) {
      case 'animalia':
        imageUrl = 'lib/images/animalia.png';
        break;
      case 'plantae':
        imageUrl = 'lib/images/plantae.png';
        break;
      case 'fungi':
        imageUrl = 'lib/images/fungi.png';
        break;
      default:
        imageUrl = 'lib/images/animalia.png';
    }

    return Image(image: AssetImage(imageUrl));
  }
}
