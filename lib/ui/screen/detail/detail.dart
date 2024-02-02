import 'package:e_commerce/ui/screen/detail/components/body.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.imagePaths, required this.description, required this.title, required this.rating});
  final List<String> imagePaths;
  final String description;
  final String title;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetail(
        imagePaths: imagePaths,
        description: description,
        title: title,
        rating: rating,
      ),
    );
  }
}