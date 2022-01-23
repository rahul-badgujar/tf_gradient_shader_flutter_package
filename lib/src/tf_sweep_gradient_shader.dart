import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import '../tf_gradient_shader.dart';
import 'dart:math' as math;

class TfSweepGradientShader extends TfGradientShader {
  /// Shades the underlying child widget with Sweep Gradient.
  ///
  /// Creates a sweep gradient centered at `center` that starts at `startAngle`
  /// and ends at `endAngle`.
  ///
  /// `startAngle` and `endAngle` should be provided in radians, with zero
  /// radians being the horizontal line to the right of the `center` and with
  /// positive angles going clockwise around the `center`.
  ///
  /// If `colorStops` is provided, `colorStops[i]` is a number from 0.0 to 1.0
  /// that specifies where `color[i]` begins in the gradient.
  ///
  /// Note: The length of `colorStops` list must be equal to length of `colors` list.
  ///
  /// The [BlendMode] to use when applying the shader to the child.
  /// Defaults to, [BlendMode.srcIn]
  ///
  /// The behavior before `startAngle` and after `endAngle` is described by the
  /// `tileMode` argument. For details, see the [TileMode] enum.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_clamp_sweep.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_decal_sweep.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_sweep.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_repeated_sweep.png)
  ///
  /// If `center`, `colors`, `tileMode`, `startAngle`, or `endAngle` are null,
  /// or if `colors` or `colorStops` contain null values, this constructor will
  /// throw a [NoSuchMethodError].
  ///
  /// If `matrix4` is provided, the gradient fill will be transformed by the
  /// specified 4x4 matrix relative to the local coordinate system. `matrix4` must
  /// be a column-major matrix packed into a list of 16 values.
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
