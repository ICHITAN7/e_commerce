import 'package:e_commerce/ui/widget/material_button.dart';
import 'package:e_commerce/ui/widget/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;
class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [
            Text('Register Account',style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: 10),
            Text('Complete your detials or Continue',style: Theme.of(context).textTheme.bodySmall,),
            Text('with social media',style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: 40,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  HTextFormField(
                    label: 'User Name', 
                    hidenText: '', 
                    controller: _nameController, 
                    haveIcon: true,
                    asset:'assets/icons/User.svg' ,
                    option: false, 
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  HTextFormField(
                    label: 'Email', 
                    hidenText: 'Example@gmail.com', 
                    controller: _emailController, 
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
                  const SizedBox(height: 20,),
                  HTextFormField(
                    label: 'Password', 
                    hidenText: '.......', 
                    controller: _passwordController, 
                    haveIcon: true,
                    asset:'assets/icons/Lock.svg' ,
                    option: true, 
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30,),
                ],
              )
            ),
            HMaterialButton(
              function: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                String name = _nameController.text.trim();
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password
                    );
                    String userId = user.user!.uid;
                    DatabaseReference dataRef = FirebaseDatabase.instance.ref();
                    await dataRef.child('users').child(userId).set({
                      'username': name,
                      'email': email,
                    });
                  } catch (e) {
                    print(e.toString());
                  }finally{
                    setState(() {
                      isLoading = false;
                    });
                  }
                  _emailController.clear();
                  _passwordController.clear();
                  _nameController.clear();
                  Get.back();
                }
              }, 
              text:isLoading?'Creating Account...' : 'Sign Up'
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/google-icon.svg',width: 30,height: 30,),
                const SizedBox(width: 20,),
                SvgPicture.asset('assets/icons/facebook-2.svg',width: 30,height: 30,),
              ],
            ),
            const SizedBox(height: 20,),
            Text('By continue you comfirm that you agree',style: Theme.of(context).textTheme.bodySmall,),
            Text('with our Team and Condition',style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}