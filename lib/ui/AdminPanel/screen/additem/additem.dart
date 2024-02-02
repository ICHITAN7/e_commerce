import 'package:e_commerce/ui/AdminPanel/screen/additem/components/body.dart';
import 'package:flutter/material.dart';
class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyAddItem(),
    );
  }
}