import 'package:e_commerce/data/helper/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/material_button.dart';
import 'splash_content.dart';
class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
     List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  int currentPage = 0 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context,index)=> SplashContent(
                text:splashData[index]['text'].toString(),
                image:splashData[index]['image'].toString(),
              ),
            )
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(splashData.length, (index) => BuildDot(context, index)),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 300,
                    child: HMaterialButton(
                      text: 'Continue',
                      function: () {
                        Get.toNamed(AppRoutes.signin);
                      },
                    ),
                  ),
                  const Spacer()
                ],
              ),
              )
          ],
        ),
      ),
      );
  }

  // ignore: non_constant_identifier_names
  AnimatedContainer BuildDot(BuildContext context,int index) {
    return AnimatedContainer(
              duration:const Duration(milliseconds: 200),
              margin:const EdgeInsets.only(right: 5),
              height: 6,
              width:currentPage==index?20:6,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(5)),
                color:currentPage==index?Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.secondary,
              ),
            );
  }
}