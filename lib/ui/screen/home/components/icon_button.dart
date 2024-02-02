import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class IconButtonHome extends StatelessWidget {
  const IconButtonHome({
    super.key, required this.asset, required this.title, required this.onTab,
  });
  final String asset ;
  final String title ;
  final VoidCallback onTab ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 105,
      child: Column(
        children: [
          InkWell(
            onTap: onTab,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 60,
              height: 60,
              padding:const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius:const BorderRadius.all(Radius.circular(10))
              ),
                child: SvgPicture.asset(asset)
            ),
          ),
          const SizedBox(height: 5),
          Text(title,style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}