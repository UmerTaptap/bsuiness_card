import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color chatBubbleColor;

  CustomColors({
    required this.chatBubbleColor,
  });

  @override
  CustomColors copyWith({Color? chatBubbleColor}) {
    return CustomColors(
      chatBubbleColor: chatBubbleColor ?? this.chatBubbleColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      chatBubbleColor: Color.lerp(chatBubbleColor, other.chatBubbleColor, t)!,
    );
  }

}
