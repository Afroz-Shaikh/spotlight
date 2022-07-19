import 'package:flutter/material.dart';
import 'package:spotlight/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final IconData icon;
  final String label;

  const TextInputField(
      {Key? key,
      required this.controller,
      this.isPassword = false,
      required this.icon,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) => controller.text,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      cursorColor: appRed,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        // prefixIcon: Icon(
        //   icon,
        //   color: Colors.red,
        // ),
        floatingLabelStyle: TextStyle(color: appRed),
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      obscureText: isPassword,
    );
  }
}
