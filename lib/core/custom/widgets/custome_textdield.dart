import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? maxLines;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputAction, this.focusNode, this.maxLines, this.onChanged, this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(context).brightness == Brightness.light
        ? Colors.blueAccent
        : Colors.blue[300]!;

    return TextField(
      cursorColor: borderColor,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction ?? TextInputAction.next,
      focusNode: focusNode,
      maxLines: maxLines,
    );
  }
}