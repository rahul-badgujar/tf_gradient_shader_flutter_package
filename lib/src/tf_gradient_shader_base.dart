import 'dart:typed_data';

import 'package:flutter/material.dart';

abstract class TfGradientShader extends StatelessWidget {
  /// The underlying child widget to shade gradient on.
  final Widget child;

  /// The behavior before and after the radius is described by the `tileMode`
  /// argument. For details, see the [TileMode] enum.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_clamp_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_decal_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_repeated_radial.png)
  final TileMode tileMode;

  /// The list of colors to use for gradient.
  final List<Color> colors;

  /// If `colorStops` is provided, `colorStops[i]` is a number from 0.0 to 1.0
  /// that specifies where `color[i]` begins in the gradient.
  ///
  /// Note: The length of `colorStops` list must be equal to length of `colors` list.
  final List<double> colorStops;

  /// The [BlendMode] to use when applying the shader to the child.
  ///
  /// The default, [BlendMode.modulate], is useful for applying an alpha blend
  /// to the child. Other blend modes can be used to create other effects.
  final BlendMode blendMode;

  /// If `matrix4` is provided, the gradient fill will be transformed by the
  /// specified 4x4 matrix relative to the local coordinate system. `matrix4` must
  /// be a column-major matrix packed into a list of 16 values.
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
      blendMode: blendMode,
      shaderCallback: (Rect bounds) {
        return getShader(bounds);
      },
      child: child,
    );
  }

  /// The implementation of shader
  Shader getShader(Rect bounds);
}
