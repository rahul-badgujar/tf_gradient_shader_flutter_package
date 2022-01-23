import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import '../tf_gradient_shader.dart';

class TfRadialGradientShader extends TfGradientShader {
  /// Shades the underlying child widget with Radial Gradient.
  ///
  /// Creates a radial gradient centered at `center` that ends at `radius`
  /// distance from the center.
  ///
  /// If `colorStops` is provided, `colorStops[i]` is a number from 0.0 to 1.0
  /// that specifies where `color[i]` begins in the gradient.
  ///
  /// Note: The length of `colorStops` list must be equal to length of `colors` list.
  ///
  /// The [BlendMode] to use when applying the shader to the child.
  /// Defaults to, [BlendMode.srcIn]
  ///
  /// The behavior before and after the radius is described by the `tileMode`
  /// argument. For details, see the [TileMode] enum.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_clamp_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_decal_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_radial.png)
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_repeated_radial.png)
  ///
  /// If `center`, `radius`, `colors`, or `tileMode` are null, or if `colors` or
  /// `colorStops` contain null values, this constructor will throw a
  /// [NoSuchMethodError].
  ///
  /// If `matrix4` is provided, the gradient fill will be transformed by the
  /// specified 4x4 matrix relative to the local coordinate system. `matrix4` must
  /// be a column-major matrix packed into a list of 16 values.
  ///
  /// If `focal` is provided and not equal to `center` and `focalRadius` is
  /// provided and not equal to 0.0, the generated shader will be a two point
  /// conical radial gradient, with `focal` being the center of the focal
  /// circle and `focalRadius` being the radius of that circle. If `focal` is
  /// provided and not equal to `center`, at least one of the two offsets must
  /// not be equal to [Offset.zero].
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
