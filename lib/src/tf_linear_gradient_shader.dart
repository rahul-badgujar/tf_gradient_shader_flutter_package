import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import '../tf_gradient_shader.dart';

class TfLinearGradientShader extends TfGradientShader {
  /// Shades the underlying child widget with Linear Gradient.
  ///
  /// Creates a linear gradient from `from` to `to`.
  ///
  /// If `colorStops` is provided, `colorStops[i]` is a number from 0.0 to 1.0
  /// that specifies where `color[i]` begins in the gradient.
  ///
  /// Note: The length of `colorStops` list must be equal to length of `colors` list.
  ///
  /// The [BlendMode] to use when applying the shader to the child.
  /// Defaults to, [BlendMode.srcIn]
  ///
  /// The behavior before `from` and after `to` is described by the `tileMode`
  /// argument. For details, see the [TileMode] enum.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_clamp_linear.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_decal_linear.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_linear.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_repeated_linear.png)
  ///
  /// If `from`, `to`, `colors`, or `tileMode` are null, or if `colors` or
  /// `colorStops` contain null values, this constructor will throw a
  /// [NoSuchMethodError].
  ///
  /// If `matrix4` is provided, the gradient fill will be transformed by the
  /// specified 4x4 matrix relative to the local coordinate system. `matrix4` must
  /// be a column-major matrix packed into a list of 16 values.
  const TfLinearGradientShader({
    Key? key,
    required Widget child,
    required List<Color> colors,
    required List<double> colorStops,
    BlendMode? blendMode,
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
