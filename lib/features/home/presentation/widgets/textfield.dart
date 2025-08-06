import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String text; TextEditingController ctl;
  CustomTextField({super.key, required this.text,required this.ctl});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctl,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      cursorHeight: 15,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),

      // validator: (value) => value == null || value.isEmpty ? 'Please enter value' : null,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
