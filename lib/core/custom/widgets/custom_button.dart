import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    this.isLoading = false, // Default is not loading
    this.isEnabled = true,  // Default is enabled
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.buttonColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        style: buttonColor != null
            ? ElevatedButton.styleFrom().copyWith(backgroundColor: WidgetStateProperty.all(buttonColor))
            : null,
        child: isLoading
            ? const SizedBox(
          width: 24.0,
          height: 24.0,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              Icon(prefixIcon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: textStyle,
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 8),
              Icon(suffixIcon, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
