import 'package:flutter/material.dart';

class CategorySlide extends StatelessWidget {
  const CategorySlide({
    Key? key,
    this.title = '',
    this.subTitle = '',
    required this.asset, 
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      // padding:const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius:const BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          InkWell(
            borderRadius:const BorderRadius.all(Radius.circular(20)),
            onTap:(){},
            child: ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(20)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    asset,
                    fit: BoxFit.cover,
                  ),
                  // BackdropFilter(
                  //   filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  //   child: Container(
                  //     color: Colors.transparent,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 0,
          //   top: 0,
          //   child: Container(
          //     width: 150,
          //     height: 70,
          //     padding:const EdgeInsets.only(right: 5, bottom: 5),
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.onSecondary,
          //       borderRadius:const BorderRadius.only(bottomRight:Radius.circular(20),topLeft: Radius.circular(20))
          //     ),
          //     child: Container(
          //       padding: EdgeInsets.only(left: 5),
          //       decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.background,
          //       borderRadius:const BorderRadius.only(bottomRight:Radius.circular(15),topLeft: Radius.circular(15))
          //     ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(title, style: Theme.of(context).textTheme.titleMedium),
          //           Text(subTitle, style: Theme.of(context).textTheme.titleSmall)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
