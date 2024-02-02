import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.image, required this.text,
  });
  final String image ;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        const Spacer(),
        Text('Tokota',style: Theme.of(context).textTheme.headlineLarge,),
        Text(text,style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(flex: 2,),
        Image.asset(image,width: 300,height: 400,),
      ],
    );
  }
}