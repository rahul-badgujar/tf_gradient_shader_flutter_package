import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import '../tf_gradient_shader.dart';
import 'dart:math' as math;

class TfSweepGradientShader extends TfGradientShader {
  const TfSweepGradientShader({
    Key? key,
    required Widget child,
    required List<Color> colors,
    required List<double> colorStops,
    BlendMode? blendMode,
    TileMode tileMode = TileMode.clamp,
    Float64List? float64list,
    required this.center,
    this.startAngle = 0.0,
    this.endAngle = 2 * math.pi,
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
  final double startAngle;
  final double endAngle;

  @override
  Shader getShader(Rect bounds) {
    return ui.Gradient.sweep(
      center,
      colors,
      colorStops,
      tileMode,
      startAngle,
      endAngle,
      float64list,
    );
  }
}
