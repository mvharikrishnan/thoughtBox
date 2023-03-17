import 'package:flutter/material.dart';
import 'package:machinegrid/constants/constants.dart';

class TextFormFiledTitle extends StatelessWidget {
  const TextFormFiledTitle({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textFormTitleColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
