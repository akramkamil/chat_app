import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({super.key, required this.hintText, this.onChange, this.obscureText= false});

  String? hintText;
  bool obscureText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return 'required value';
          }
          return null;
        },
        onChanged: onChange,
        style: const TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.2,
              style: BorderStyle.solid)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.2,
              style: BorderStyle.solid))
        ),
      ),
    );
  }
}