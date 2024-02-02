import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class HMaterialButton extends StatelessWidget {
  const HMaterialButton({
    super.key, required this.function, required this.text,
  });
  final VoidCallback function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      animationDuration:const Duration(microseconds: 200),
      elevation: 1,
      color: HColorScheme.lightColorScheme.primary,
      onPressed: function,
      child: SizedBox(
        height: 40,
        child: Center(child: Text(text,style: Theme.of(context).textTheme.titleLarge,)),
      ),
    );
  }
}