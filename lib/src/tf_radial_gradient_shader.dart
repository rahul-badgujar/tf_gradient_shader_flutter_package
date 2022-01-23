import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import '../tf_gradient_shader.dart';

class TfRadialGradientShader extends TfGradientShader {
  const TfRadialGradientShader({
    Key? key,
    required Widget child,
    required List<Color> colors,
    required List<double> colorStops,
    BlendMode? blendMode,
    TileMode tileMode = TileMode.clamp,
    Float64List? float64list,
    required this.center,
    required this.radius,
    this.focal,
    this.focalRadius = 0.0,
  }) : super(
          key: key,
          child: child,
          colors: colors,
          colorStops: colorStops,
          tileMode: tileMode,
          blendMode: blendMode,
          float64list: float64list,
        );

  final Offset center;
  final double radius;
  final Offset? focal;
  final double focalRadius;

  @override
  Shader getShader(Rect bounds) {
    return ui.Gradient.radial(
      center,
      radius,
      colors,
      colorStops,
      tileMode,
      float64list,
      focal,
      focalRadius,
    );
  }
}
