import 'dart:io';
import 'dart:convert';
import 'package:colorex/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:crypto/crypto.dart';
import 'package:provider/provider.dart';

class MyCreatePostPage extends StatefulWidget {
  const MyCreatePostPage({super.key});

  @override
  State<MyCreatePostPage> createState() => _MyCreatePostPageState();
}

class _MyCreatePostPageState extends State<MyCreatePostPage> {
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  final TextEditingController myContentController = TextEditingController();

  File? _imageFile;
  bool image = false;

  Future<void> _getImageFromGalery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        image = true;
      });
    } else {
      return;
    }
  }

  String hashAnything(dynamic input) {
    // Convert the input to a string representation
    String inputString;
    if (input is String) {
      inputString = input;
    } else if (input is List<int>) {
      inputString = utf8.decode(input);
    } else {
      inputString = input.toString();
    }

    // Calculate the MD5 hash
    var bytes = utf8.encode(inputString);
    var md5Hash = md5.convert(bytes);

    // Return the hash as a hexadecimal string
    return md5Hash.toString();
  }

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      // Create a reference to the storage location with a unique filename
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('Post_Photo/${hashAnything(imageFile)}');

      // Upload the file to Firebase Storage
      await ref.putFile(imageFile);

      // Get the download URL of the uploaded image
      String downloadURL = await ref.getDownloadURL();

      return downloadURL; // Return the download URL
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading image to Firebase Storage: $e");
      }
      return 'null'; // Return null in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 1,
              ),
              SvgPicture.asset(vectorColorex, height: 20),
              const SizedBox(
                width: 51,
              ),
            ],
          ),
        ),
        body: Container(
          constraints: BoxConstraints(maxHeight: 0.85* MediaQuery.of(context).size.height),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: const Color.fromRGBO(246, 246, 246, 1.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Visibility(
                      visible: image, // Check if imageFile is not null
                      child: Container(
                        child: _imageFile != null ? Image.file(_imageFile!) : null,
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 250),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextField(
                        controller: myContentController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'What color you want to tell ?',
                          hintStyle: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _getImageFromGalery,
                          child: const Icon(
                            Icons.image,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.send,
                          size: 30,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ],
            )));
  }
}
