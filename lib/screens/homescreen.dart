import 'package:impact/services/api_service.dart';
import 'package:impact/models/specie.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<Specie>> species =
      ApiService.getSpeciesInArea(55.96, 55.97, 12.20, 12.25);

  @override
  Widget build(BuildContext context) {
    print(species);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "specie",
          style: TextStyle(
            fontSize: 24,
          ),
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
                    height: 100,
                  ),
                  Expanded(child: makeList(snapshot)),
                ],
              );
            } else {
              return const Center(
                child: Text('No species data available'),
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
          children: [
            Text(specie.specieName),
            getImageForKingdom(specie.kingdom),
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
