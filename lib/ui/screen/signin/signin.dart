import 'package:e_commerce/ui/screen/signin/widget/body.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In',style: Theme.of(context).textTheme.headlineMedium,),),
      body:const BodySignIn(),
    );
  }
}