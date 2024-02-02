
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarHomeSearch extends StatelessWidget {
  const AppBarHomeSearch({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hintText: 'Search Product',
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        prefixIcon: Container(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset('assets/icons/Search Icon.svg'),
        ),
      ),
    );
  }
}