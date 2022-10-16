import 'package:flutter/material.dart';
import 'package:payment_gateway_course/shared/style/colors.dart';
Widget defaultButton({
  double width = double.infinity,
  Color backGround = defColor,
  bool isUpperCase = true,
  double radius = 0,
  required Function() function,
  required String text,
})
{
  return Container(
    width: width,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: backGround,
    ),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),

  );
}


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines,
})
{
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    enabled: isClickable,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    onTap: onTap,
    maxLines: lines,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null ?
      IconButton(onPressed: suffixPressed, icon: Icon(suffix), )
          : null ,
      border: const OutlineInputBorder(),
    ),
  );
}

