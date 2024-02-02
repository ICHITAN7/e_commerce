import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    super.key,
    required this.width, required this.rating,
  });

  final double width;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      margin:const EdgeInsets.only(top: 50,left: 10,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius:const BorderRadius.all(Radius.circular(20)),
            onTap: (){
              Get.back();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                ),
              padding:const EdgeInsets.all(10),
              child: SvgPicture.asset('assets/icons/Back ICon.svg',color: Theme.of(context).colorScheme.onSurface,height: 15,),
            ),
          ),
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              borderRadius:const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rating),
                const SizedBox(width: 5,),
                SvgPicture.asset('assets/icons/Star Icon.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
