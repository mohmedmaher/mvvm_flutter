import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text, required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.bold));
  }
}