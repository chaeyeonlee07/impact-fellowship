import 'package:impact/services/api_service.dart';
import 'package:impact/models/specie.dart';
import 'package:flutter/material.dart';

class ChallengeToday extends StatelessWidget {
  ChallengeToday({Key? key}) : super(key: key);

  final Future<List<Specie>> species =
      ApiService.getSpeciesInArea(55.96, 55.97, 12.20, 12.25);

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
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(child: makeList(snapshot)),
                ],
              );
            } else {
              return const Center(
                child: Center(
                  child: Text(
                    'No species data available',
                    style: TextStyle(fontSize: 18, fontFamily: 'Tenor'),
                  ),
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

  ListView makeList(AsyncSnapshot<List<Specie>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var specie = snapshot.data![index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                specie.specieName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Tenor', fontSize: 20),
              ),
            ),
            SizedBox(
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              child: getImageForKingdom(specie.kingdom),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
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
