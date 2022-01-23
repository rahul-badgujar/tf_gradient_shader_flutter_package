import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import '../tf_gradient_shader.dart';

class TfLinearGradientShader extends TfGradientShader {
  const TfLinearGradientShader({
    Key? key,
    required Widget child,
    required List<Color> colors,
    required List<double> colorStops,
    BlendMode blendMode = BlendMode.modulate,
    TileMode tileMode = TileMode.clamp,
    Float64List? float64list,
    required this.offsetFrom,
    required this.offsetTo,
  }) : super(
          key: key,
          child: child,
          colors: colors,
          colorStops: colorStops,
          tileMode: tileMode,
          blendMode: blendMode,
          float64list: float64list,
        );

  final Offset offsetFrom;
  final Offset offsetTo;

  @override
  Shader getShader(Rect bounds) {
    return ui.Gradient.linear(
      offsetFrom,
      offsetTo,
      colors,
      colorStops,
      tileMode,
      float64list,
    );
  }
}
