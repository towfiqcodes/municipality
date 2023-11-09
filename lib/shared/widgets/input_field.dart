import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final Color color;
  final Color placeHolderColor;
  final double fontSize;
  final double iconSize;
  final bool password;
  final Widget? suffixIcon;
  final IconData? icon;
  final CustomTextFormFieldType? type;
  final String? Function(String?) validator;
  final bool? Function(bool?)? isPassword;

  InputField({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.placeholder = '',
    this.color = Colors.white,
    this.placeHolderColor = Colors.white,
    this.fontSize = 14.0,
    this.iconSize = 18.0,
    this.password = false,
    this.suffixIcon,
    this.icon,
    this.type,
    required this.validator,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    final showIconOutsideField =
        type != CustomTextFormFieldType.outlined && icon != null;
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.transparent,
         contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        //contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        focusedBorder:InputBorder.none,
        border: InputBorder.none,
        suffixIcon: suffixIcon,
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: this.color,
        //   ),
        // ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          icon,
          size: iconSize,
        ),
        labelText: this.labelText,
        labelStyle: TextStyle(
          fontSize: fontSize - 2,
          color: color,
          height: 0.2,
          fontWeight: FontWeight.normal,
        ),
        hintText: this.placeholder,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: placeHolderColor,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        isDense: true,
      ),
      controller: this.controller,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: this.keyboardType,
      obscureText: password,
      autocorrect: false,
      validator: validator,
    );
  }
}

enum CustomTextFormFieldType { standard, outlined, heading }
