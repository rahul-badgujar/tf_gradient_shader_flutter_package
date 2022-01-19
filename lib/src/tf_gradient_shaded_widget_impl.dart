import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TfGradientShadedWidget extends StatelessWidget {
  const TfGradientShadedWidget({
    Key? key,
    required this.child,
    required this.offsetFrom,
    required this.offsetTo,
    required this.colors,
    required this.colorStops,
    this.blendMode = BlendMode.modulate,
    this.tileMode = TileMode.clamp,
  }) : super(key: key);

  final Widget child;
  final BlendMode blendMode;
  final Offset offsetFrom;
  final Offset offsetTo;
  final List<Color> colors;
  final List<double> colorStops;
  final TileMode tileMode;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
          offsetFrom,
          offsetTo,
          colors,
          colorStops,
        );
      },
      child: child,
    );
  }
}
