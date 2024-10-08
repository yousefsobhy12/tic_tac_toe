import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.name,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(8),
          ],
          enabled: true,
          controller: controller,
          maxLength: 32,
          maxLines: 1,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
            fontFamily: 'ToyBox',
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: Icon(prefixIcon),
            isDense: true,
            labelText: name,
            floatingLabelStyle: const TextStyle(
              fontFamily: 'ToyBox',
            ),
            counterText: "",
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: 'ToyBox',
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
