import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {

  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final String? errorText;

  ReusableTextField({
    required this.obscureText,
    required this.textInputAction,
    this.keyboardType,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextField(
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      onEditingComplete: textInputAction == TextInputAction.next ? () => node.nextFocus() : null,
      onSubmitted: textInputAction == TextInputAction.done  ? (_) => node.unfocus() : null,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.black,width: 1.0)
        ),

      ),
    );
  }
}
