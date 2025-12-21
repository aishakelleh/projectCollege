import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final TextInputType type;
  final String? pref;
  final dynamic suffix;
  final bool? obscureT;

  const CustomTextformfield({
    this.pref,
    this.suffix,
    this.obscureT,
    super.key,
    required this.controller,
    required this.title,
    required this.validator,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (pref != null && controller.text.isEmpty) {
      controller.text = "$pref | ";
      controller.selection = TextSelection.collapsed(offset: controller.text.length);
    }

    return TextFormField(
      controller: controller,
      obscureText: obscureT??false ,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
        hintText: title,
        suffixIcon: suffix
      ),
      validator: validator,
      onChanged: (value) {
        if (pref != null) {
          final prefix = "$pref | ";

          // المستخدم حاول يمسح prefix
          if (!value.startsWith(prefix)) {
            controller.text = prefix;
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          }
        }
      },

    );
  }
}
