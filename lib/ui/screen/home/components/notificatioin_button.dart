import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarHomeButton extends StatelessWidget {
  final int notificationCount;
  final VoidCallback onPressed;
  final String asset ;
  const AppBarHomeButton({
    Key? key,
    required this.onPressed,this.notificationCount = 0, required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
        borderRadius:const BorderRadius.all(Radius.circular(20))
      ),
      child: InkWell(
        borderRadius:const BorderRadius.all(Radius.circular(20)) ,
        onTap: onPressed,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              child: SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(asset,color: Theme.of(context).colorScheme.onSurface,),
                  ],
                ),
              )
              ),
            if (notificationCount > 0)
              Positioned(
                bottom: 25,
                left: 30,
                child: Container(
                  padding:const EdgeInsets.all(4),
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    notificationCount.toString(),
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
