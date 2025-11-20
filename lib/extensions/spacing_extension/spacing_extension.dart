import 'package:flutter/material.dart';

extension SpacingExtension on double {
  /// Vertical space
  SizedBox get height => SizedBox(height: this);

  /// Horizontal space
  SizedBox get width => SizedBox(width: this);
}
