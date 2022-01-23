# tf_gradient_shader

tf_gradient_shader package provides widgets which can be used to shade underlying child widget with gradient. Support linear, radial, and sweep gradient types.

## Supported Dart Versions

**Dart SDK version ">=2.15.1 <3.0.0"**

**Flutter SDK version ">=1.17.0"**

## Installation

Add the Package

```yaml
dependencies:
  tf_gradient_shader: ^1.0.0
```

## How to use

Import the package in your dart file

```dart
import 'package:tf_gradient_shader/tf_gradient_shader.dart';
```

There are different widgets available to shade an underlying child widget with gradient.

### **To apply Linear Gradient to a widget**

```dart
TfLinearGradientShader(
    child: Column(
      children: [
        const CircleAvatar(
          radius: 80,
        ),
        const SizedBox(height: 8),
        Text(
          "Linear Gradient Shader",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    ),
    offsetFrom: const Offset(0, 0),
    offsetTo: const Offset(130, 130),
    colors: demoColors,
    colorStops: demoColorStops,
    blendMode: BlendMode.modulate,
    tileMode: TileMode.clamp,
),
```

<img src="readme-assets\linear_gradient_example.png" alt="Output: TfLinearGradientShader" width="320"/>

</br>

### **To apply Radial Gradient to a widget**

```dart
TfRadialGradientShader(
    child: Column(
      children: [
        const CircleAvatar(
          radius: 80,
        ),
        const SizedBox(height: 8),
        Text(
          "Radial Gradient Shader",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    ),
    center: const Offset(80, 80),
    colors: demoColors,
    colorStops: demoColorStops,
    blendMode: BlendMode.modulate,
    tileMode: TileMode.clamp,
    radius: 80,
),
```

<img src="readme-assets\radial_gradient_example.png" alt="Output: TfRadialGradientShader" width="320"/>

</br>

### **To apply Sweep Gradient to a widget**

```dart
TfSweepGradientShader(
    child: Column(
      children: [
        const CircleAvatar(
          radius: 80,
        ),
        const SizedBox(height: 8),
        Text(
          "Sweep Gradient Shader",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    ),
    center: const Offset(100, 80),
    colors: demoColors,
    colorStops: demoColorStops,
    blendMode: BlendMode.modulate,
    tileMode: TileMode.clamp,
    startAngle: 0,
    endAngle: 2 * math.pi,
),
```

<img src="readme-assets\sweep_gradient_example.png" alt="Output: TfSweepGradientShader" width="320"/>

</br>
