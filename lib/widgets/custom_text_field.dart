import 'package:flutter/material.dart';


class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({super.key, required this.hintText, this.onChange});

  String? hintText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'required value';
          }
        },
        onChanged: onChange,
        style: TextStyle(
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