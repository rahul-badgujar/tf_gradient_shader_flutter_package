import 'package:flutter/material.dart';
import 'package:tf_gradient_shader/tf_gradient_shader.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final demoColors = const <Color>[
    Color.fromARGB(255, 245, 56, 68),
    Color.fromARGB(255, 212, 65, 142),
    Color.fromARGB(255, 66, 55, 143)
  ];

  final demoColorStops = const <double>[0.0, 0.3, 0.8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TfLinearGradientShader(
                child: getDemoWidgetToShade(context, "Linear Gradient Shader"),
                offsetFrom: const Offset(0, 0),
                offsetTo: const Offset(130, 130),
                colors: demoColors,
                colorStops: demoColorStops,
                blendMode: BlendMode.modulate,
                tileMode: TileMode.clamp,
              ),
              TfRadialGradientShader(
                child: getDemoWidgetToShade(context, "Radial Gradient Shader"),
                center: const Offset(80, 80),
                colors: demoColors,
                colorStops: demoColorStops,
                blendMode: BlendMode.modulate,
                tileMode: TileMode.clamp,
                radius: 80,
              ),
              TfSweepGradientShader(
                child: getDemoWidgetToShade(context, "Sweep Gradient Shader"),
                center: const Offset(100, 80),
                colors: demoColors,
                colorStops: demoColorStops,
                blendMode: BlendMode.modulate,
                tileMode: TileMode.clamp,
                startAngle: 0,
                endAngle: 2 * 3.14, // 2*pi
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDemoWidgetToShade(BuildContext context, String label) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 80,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
