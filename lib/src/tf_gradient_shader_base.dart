import 'dart:typed_data';

import 'package:flutter/material.dart';

abstract class TfGradientShader extends StatelessWidget {
  final Widget child;
  final TileMode tileMode;
  final List<Color> colors;
  final List<double> colorStops;
  final BlendMode blendMode;
  final Float64List? float64list;

  const TfGradientShader({
    Key? key,
    required this.child,
    required this.colors,
    required this.colorStops,
    this.blendMode = BlendMode.modulate,
    this.tileMode = TileMode.clamp,
    this.float64list,
  })  : assert(colors.length == colorStops.length,
            'Length of colors list and colorStops list must be equal.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return getShader();
      },
      child: child,
    );
  }

  Shader getShader();
}
