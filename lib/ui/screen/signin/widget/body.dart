import 'package:e_commerce/data/helper/route.dart';
import 'package:e_commerce/ui/screen/signup/components/body.dart';
import 'package:e_commerce/ui/widget/material_button.dart';
import 'package:e_commerce/ui/widget/text_form_field.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySignIn extends StatefulWidget {
  const BodySignIn({super.key});

  @override
  State<BodySignIn> createState() => _BodySignInState();
}

  bool check = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _BodySignInState extends State<BodySignIn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,top: 0),
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Text('Welcome Back', style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 10,),
              Text('Sign In with your email and password', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 40,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    HTextFormField(
                      label: 'Email',
                      hidenText: 'Example@bot.com',
                      controller: emailController,
                      haveIcon: true,
                      asset: 'assets/icons/Mail.svg',
                      option: false,
                      validator: (value) {
                        if (value!.isEmpty || !value.isEmail) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30,),
                    HTextFormField(
                      label: 'Password',
                      hidenText: '........',
                      controller: passwordController,
                      haveIcon: true,
                      asset: 'assets/icons/Lock.svg',
                      option: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Checkbox(
                          value: check,
                          activeColor: HColorScheme.lightColorScheme.primary,
                          onChanged: (value) {
                            setState(() {
                              check=value!;
                            });
                          },
                        ),
                        const Text('Remember me'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    HMaterialButton(
                      function: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final String email = emailController.text.trim();
                          final String password = passwordController.text.trim();
                          bool isLoading = false;
                          try {
                          setState(() {
                            isLoading = true;
                          });
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          emailController.clear();
                          passwordController.clear();
                          Get.offAllNamed(AppRoutes.home);
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                              Get.snackbar("Sign In Error", e.code);
                            }
                          } finally{
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      text: isLoading? 'SIGNING IN...':'SIGN IN',
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Divider(thickness: 1,color: HColorScheme.lightColorScheme.secondary),
                  ),
                  const Text(" Or "),
                  Expanded(
                    child: Divider(thickness: 1,color: HColorScheme.lightColorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Text("Do you have an account?"),
              const SizedBox(height: 5,),
              MaterialButton(
                onPressed:() {
                  Get.toNamed(AppRoutes.signup);
                },
                child: Text("-> Sign Up <-",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
