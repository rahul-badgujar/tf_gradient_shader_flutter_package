import 'package:flutter/material.dart';
import 'package:tf_gradient_shaded_widget/tf_gradient_shaded_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildGradientFlutterLogo(),
      ),
    );
  }

  Widget buildGradientFlutterLogo() {
    return const TfGradientShadedWidget(
      child: FlutterLogo(
        size: 100,
      ),
      offsetFrom: Offset(0, 24),
      offsetTo: Offset(24, 0),
      colors: [
        Color.fromARGB(255, 245, 56, 68),
        Color.fromARGB(255, 212, 65, 142),
        Color.fromARGB(255, 66, 55, 143)
      ],
      colorStops: [
        0.0,
        0.3,
        0.8,
      ],
      blendMode: BlendMode.modulate,
      tileMode: TileMode.clamp,
    );
  }
}
