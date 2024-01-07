import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    setState(() {
      images.addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 70, 172, 123),
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: images
            .map((image) => Image.file(image, fit: BoxFit.cover))
            .toList(),
      ),
    );
  }
}
