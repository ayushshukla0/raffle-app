import 'package:flutter/material.dart';

// This file contains standardized widgets for use throughout the app

class PlainTextField extends StatelessWidget {
  const PlainTextField(
      {required this.obscureText,
      required this.decoration,
      required this.controller});
  final bool obscureText;
  final InputDecoration decoration;
  final TextEditingController controller;

  Widget build(BuildContext context) => TextField(
      obscureText: obscureText, decoration: decoration, controller: controller);
}

class SmallButton extends StatelessWidget {
  const SmallButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: child,
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph({required this.content});
  final String content;

  Widget build(BuildContext context) =>
      Padding(padding: EdgeInsets.all(16.0), child: Text(content));
}
