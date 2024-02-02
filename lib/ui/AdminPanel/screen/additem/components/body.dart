import 'dart:async';
import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class BodyAddItem extends StatefulWidget {
  const BodyAddItem({Key? key}) : super(key: key);

  @override
  State<BodyAddItem> createState() => _BodyAddItemState();
}

class _BodyAddItemState extends State<BodyAddItem> {
  File? mainImageFile;
  String? mainImageString ;
  List<File> subImageFiles=[];
  List<String> subImageDownloadURLs=[];
  bool isLoadingSub = false;
  bool isLoadingMain = false;
  bool isLoadingAdd = false;
  String code = "";
  Future<void> pickImage() async {
    Permission.photos.request();
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          mainImageFile = File(pickedFile.path);
        });
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
        setState(() {
          subImageFiles.add(File(pickerFile.path));
        });
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
        setState(() {
          isLoadingMain = true;
        });
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
      }finally {
        setState(() {
          isLoadingMain = false;
        });
      }
    });
  }
  Future<void> uploadListSubImages(List<File> subImageFiles) async {
    for (final imageFile in subImageFiles) {
      try {
        setState(() {
          isLoadingSub = true;
        });
        await uploadImageToFirebase(imageFile);
      } catch (e) {
        print('Error uploading sub-image: $imageFile - $e');
      }finally{
        setState(() {
          isLoadingSub = false;
        });
      }
    }
    print('${subImageFiles.length} sub-images uploaded!');
  }
  Future<void> scanBarCode () async {
    await Permission.camera.request();
    final result = await BarcodeScanner.scan(
    );
    setState(() {
      code = result.rawContent;
    });
  }
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _title = TextEditingController();

  final TextEditingController _subtitle = TextEditingController();

  final TextEditingController _price = TextEditingController();

  final TextEditingController _rating = TextEditingController();

  final TextEditingController _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:subImageFiles.length,
                  itemBuilder: (context,index){
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.file(subImageFiles[index])
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                pickListImage();
              },
                  child:const Text('Pick sub Image')),
              ElevatedButton(onPressed: (){uploadListSubImages(subImageFiles);}, child:isLoadingSub?CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary,) : const Text('Upload')),
              SizedBox(
                width: 100,
                height: 100,
                child:mainImageFile!=null?
                Image.file(mainImageFile!):
                Image.asset('assets/images/sdf.webp'),
              ),
              ElevatedButton(
                  onPressed: (){
                    pickImage();
                  }, child:const Text('Pick main Image')),
              ElevatedButton(onPressed: (){uploadImageToFirebase(mainImageFile as File);}, child:isLoadingMain?CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary) : const Text('Upload')),
              TextFormField(
                controller: _title,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                // Add other properties as needed
              ),
              TextFormField(
                controller: _subtitle,
                decoration: InputDecoration(
                  labelText: 'Subtitle',
                ),
                // Add other properties as needed
              ),
              TextFormField(
                controller: _price,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
              TextFormField(
                controller: _rating,
                decoration: InputDecoration(
                  labelText: 'Rating',
                ),
              ),
              ElevatedButton(onPressed: (){
                scanBarCode();
              }, child: const Text('Scan barcode')),
              ElevatedButton(
                onPressed: () {
                    String title = _title.text.toString();
                    String subTitle = _subtitle.text.toString();
                    String price = _price.text.toString();
                    String rating = _rating.text.toString();
                    try {
                      setState(() {
                        isLoadingAdd = true;
                      });
                      DatabaseReference ref = FirebaseDatabase.instance.ref();
                      ref.child('items').child(code).set({
                        'title':title,
                        'subTitle': subTitle,
                        'mainImage': mainImageString,
                        'subImage': subImageDownloadURLs,
                        'price': price,
                        'rating':rating,
                        'loved':false,
                      });
                    } catch (e) {
                      print(e.toString());
                    }finally{
                      Future.delayed(const Duration(seconds: 2),(){
                        setState(() {
                          isLoadingAdd = false;
                          _title.clear();
                          _subtitle.clear();
                          _price.clear();
                          _rating.clear();
                          mainImageFile = null;
                          subImageFiles = [];
                          mainImageString='';
                          subImageDownloadURLs=[];
                        });
                      });
                    }
                },
                child:isLoadingAdd?CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary) : const Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
