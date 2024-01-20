import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/widgets/text_field.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final productNameController = TextEditingController();
  final productStockController = TextEditingController();
  final productDescriptionController = TextEditingController();
  String imageUrl = "";
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('shared_product');
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: TextButton(
            style: const ButtonStyle(
                shape: MaterialStatePropertyAll(CircleBorder()),
                backgroundColor: MaterialStatePropertyAll(Color(0xff176B87)),
                minimumSize: MaterialStatePropertyAll(Size(120, 120))),
            onPressed: () async {
              //Kullanıcıdan fotoğraf alma
              ImagePicker imagePicker = ImagePicker();
              XFile? file = await imagePicker.pickImage(
                  source: ImageSource.camera, maxHeight: 720, maxWidth: 720);

              if (file == null) return;

              //Fotoğrafı veri tabanına upload etme
              String uniqueFileName =
                  "${currentUser.uid}_${DateTime.now().millisecondsSinceEpoch.toString()}";

              Reference referenceRoot = FirebaseStorage.instance.ref();
              Reference referenceDirImages = referenceRoot.child('images');
              Reference referenceImageToUpload =
                  referenceDirImages.child(uniqueFileName);
              try {
                await referenceImageToUpload.putFile(File(file.path));
                imageUrl = await referenceImageToUpload.getDownloadURL();
              } catch (error) {
                Navigator.pop(context);
                displayMessage(error.toString());
                await Future.delayed(const Duration(seconds: 1));
                Navigator.pop(context);
              }
            },
            child: const Column(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  "add image",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: MyTextField(
            controller: productNameController,
            hintText: "Product Name",
            obscureText: false,
            isNumber: false,
            color: const Color(0xff176B87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: MyTextField(
            controller: productStockController,
            hintText: "Stock Quantity",
            obscureText: false,
            isNumber: true,
            color: const Color(0xff176B87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: MyTextField(
            controller: productDescriptionController,
            hintText: "Product Description",
            obscureText: false,
            isNumber: false,
            color: const Color(0xff176B87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
          child: ElevatedButton(
            onPressed: () async {
              String productName = productNameController.text;
              String productStock = productStockController.text;
              String productDescription = productDescriptionController.text;
              String dateTime =
                  DateTime.now().millisecondsSinceEpoch.toString();
              String image = imageUrl;
              if (imageUrl == "") {
                image =
                    "https://www.huber-online.com/daisy_website_files/_processed_/8/0/csm_no-image_d5c4ab1322.jpg";
              }
              String userID = currentUser.uid;
              String userEmail = currentUser.email!;
              Map<String, String> dataToSend = {
                'name': productName,
                'quantity': productStock,
                'image': image,
                'description': productDescription,
                'userID': userID,
                'date': dateTime,
                'userEmail': userEmail
              };
              _reference.add(dataToSend);
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xff176B87)),
              shape: MaterialStatePropertyAll(StadiumBorder()),
            ),
            child: const Text(
              "Submit",
            ),
          ),
        )
      ],
    );
  }
}
