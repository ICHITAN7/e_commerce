import 'package:e_commerce/data/helper/route.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/helper/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    runApp(const Ecommerce());
  }).catchError((error) {
    print('Error initializing Firebase: $error');
  });
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      initialRoute:FirebaseAuth.instance.currentUser!=null?AppRoutes.home : AppRoutes.spalash,
      getPages: AppRoutes.routes,
    );
  }
}
