import 'package:flutter/cupertino.dart';

extension CustomPadding on num {
  SizedBox get pw => SizedBox(width: toDouble());
  SizedBox get ph => SizedBox(height: toDouble());
}
