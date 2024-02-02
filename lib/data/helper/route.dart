import 'package:e_commerce/ui/screen/home/home.dart';
import 'package:e_commerce/ui/screen/signin/signin.dart';
import 'package:e_commerce/ui/screen/signup/signup.dart';
import 'package:e_commerce/ui/screen/splash/splash.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/';
  static const spalash = '/spalash';
  static const signin = '/signin';
  static const signup = '/signup';

  static List<GetPage> routes = [
    GetPage(name: home, page: () =>const HomeScreen()),
    GetPage(name: spalash, page: () =>const SplashScreen()),
    GetPage(name: signin, page: () =>const SignInScreen()),
    GetPage(name: signup, page: ()=>const SignUpScreen()),
  ];
}
