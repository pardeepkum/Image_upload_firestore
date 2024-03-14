import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skincare_app/controller/camera_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _uploadImage(String imagePath) async {
    try {
      String userId = _auth.currentUser!.uid;
      String imageName = DateTime.now().toString();
      Reference ref = _storage.ref().child('images/$userId/$imageName.jpg');
      await ref.putFile(File(imagePath));
      String imageUrl = await ref.getDownloadURL();

      // Create the data map to update in Firestore
      Map<String, dynamic> userData = {
        'image_url': imageUrl,
      };

      // Get the reference to the user's document
      DocumentReference userDocRef =
      _firestore.collection('skincare_routines').doc(userId);

      // Update the user's document with the image URL
      await userDocRef.set(userData, SetOptions(merge: true));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daily Skincare',
          style: TextStyle(
            color: Color(0xFF1C0D12),
            fontSize: 18,
            fontFamily: "Epilogue",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.listdata.length,
          itemBuilder: (context, index) {
            final item = controller.listdata[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    color: const Color(0xffF2E8EB),
                    child: const Icon(Icons.check),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['type'],
                          style: const TextStyle(
                            color: Color(0xff964F66),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          item['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          controller.pickImage().then((imagePath) {
                            if (imagePath != null) {
                              _uploadImage(imagePath);
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        item['time'],
                        style: const TextStyle(
                          color: Color(0xff964F66),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
