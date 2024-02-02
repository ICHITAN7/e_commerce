import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class HTextFormField extends StatelessWidget {
  const HTextFormField({super.key, required this.label, required this.hidenText, required this.controller, required this.option, required this.validator, required this.asset, required this.haveIcon});
  final String label;
  final String hidenText;
  final TextEditingController controller;
  final String asset;
  final bool haveIcon;
  final bool option;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  keyboardType: option ? TextInputType.visiblePassword : TextInputType.emailAddress,
                  controller:controller ,
                  obscureText: option,
                  validator: validator,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    label:Text(label,style: Theme.of(context).textTheme.bodyMedium,),
                    hintText: hidenText,
                    suffixIcon: haveIcon ? Container(
                      padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                      child: SvgPicture.asset(asset),
                      ): null,
                    border: OutlineInputBorder(
                      borderRadius:const BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      gapPadding: 10,
                    ),
                  ),
                );
  }
}