import 'package:flutter/material.dart';
import 'package:tf_gradient_shaded_widget/tf_gradient_shaded_widget.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TfGradientShadedWidget(
          child: CircleAvatar(
            radius: 100,
          ),
          offsetFrom: const Offset(0, 24),
          offsetTo: const Offset(24, 0),
          colors: const [Colors.blue, Colors.green, Colors.red],
          colorStops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
