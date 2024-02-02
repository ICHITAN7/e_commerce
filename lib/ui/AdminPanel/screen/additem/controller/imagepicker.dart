import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

  File? mainImageFile;
  String? mainImageString ;
  List<File> subImageFiles=[];
  List<String> subImageDownloadURLs=[];

  Future<void> pickImage() async {
    Permission.photos.request();
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        mainImageFile = File(pickedFile.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  Future<void> pickListImage () async {
    Permission.photos.request();
    try {
      final pickerFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickerFile!=null) {
        subImageFiles.add(File(pickerFile.path));
      }
    }catch (e) {
      print('Error picking list image: $e');
    }
  }
  Future<void> uploadImageToFirebase(File imageFile) async {
    final storageReference = FirebaseStorage.instance.ref().child('images/${imageFile.path}');
    final uploadTask = storageReference.putFile(imageFile);

    await uploadTask.whenComplete(() async {
      try {
        final downloadURL = await storageReference.getDownloadURL();
        mainImageString = downloadURL;
        print('Image uploaded and download URL: $downloadURL');
        if (imageFile == mainImageFile) {
          mainImageString = downloadURL;
        } else {
          subImageDownloadURLs.add(downloadURL);
        }
      } catch (e) {
        print('Error getting download URL: $e');
      }
    });
  }
  Future<void> uploadListSubImages(List<File> subImageFiles) async {
    for (final imageFile in subImageFiles) {
      try {
        await uploadImageToFirebase(imageFile);
      } catch (e) {
        print('Error uploading sub-image: $imageFile - $e');
      }
    }
    print('${subImageFiles.length} sub-images uploaded!');
  }