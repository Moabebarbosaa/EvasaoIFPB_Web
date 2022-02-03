import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String labelText;
  final TextEditingController textEditingController;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.textEditingController
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: textEditingController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
