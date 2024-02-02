import 'package:e_commerce/ui/screen/signup/components/body.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up',style: Theme.of(context).textTheme.headlineMedium,),),
      body:const SignUpBody(),
    );
  }
}