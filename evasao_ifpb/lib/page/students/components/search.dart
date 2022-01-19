import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 40,
      child: TextField(
        controller: textEditingController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.5),
          ),
          hintText: 'Insira a matrícula...',
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              print(textEditingController.text);
            },
          ),
        ),
      ),
    );
  }
}
