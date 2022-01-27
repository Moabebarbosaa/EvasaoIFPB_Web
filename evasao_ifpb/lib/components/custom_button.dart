import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool selected;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            primary: selected ? Colors.white : const Color(0xFF241424).withOpacity(0.3),
            backgroundColor: selected ? Colors.green : Colors.white,
            onSurface: Colors.grey,
          ),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF241424).withOpacity(0.3),
              fontWeight: selected ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        )
    );
  }
}
