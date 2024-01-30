import 'package:flutter/material.dart';
import '/animated_container_one.dart';
import '/animated_container_two.dart';

import 'animated_container_three.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ContainerAnimatedOne(title: 'Animated Container One'),
      home: const ContainerAnimatedTwo(title: 'Animated Container Two'),
      // home: const ContainerAnimatedThree(title: 'Animated Container Three'),
    );
  }
}
