import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obsText;
  final VoidCallback? toggle;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool isUnderLine;
  final Color? hintColor;
  final double? fontSize;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.obsText = false,
    this.toggle,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.hintText,
    this.isUnderLine = true,
    this.hintColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obsText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor, fontSize: fontSize),
        border: UnderlineInputBorder(
          borderSide: isUnderLine
              ? BorderSide(color: Colors.grey)
              : BorderSide(color: Colors.transparent),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: isUnderLine
              ? BorderSide(color: Colors.grey)
              : BorderSide(color: Colors.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: isUnderLine
              ? BorderSide(color: Colors.grey)
              : BorderSide(color: Colors.transparent),
        ),
        suffixIcon: suffixIcon ??
            (toggle != null
                ? IconButton(
                    icon: Icon(
                      obsText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: toggle,
                  )
                : null),
      ),
    );
  }
}
