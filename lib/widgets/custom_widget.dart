import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;
  Function? onPressed;
  int? index;

  CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: () {
          onPressed!(index);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          '$text',
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'ToyBox',
          ),
        ),
      ),
    );
  }
}
