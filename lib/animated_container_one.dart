import 'package:flutter/material.dart';

import 'dart:math';

class ContainerAnimatedOne extends StatefulWidget {
  const ContainerAnimatedOne({super.key, required this.title});

  final String title;

  @override
  State<ContainerAnimatedOne> createState() => _ContainerAnimatedOneState();
}

class _ContainerAnimatedOneState extends State<ContainerAnimatedOne> {
  double width = 50;
  double height = 50;
  Color color = Colors.green;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        tooltip: 'Increment',
        child: const Icon(Icons.change_circle, size: 50),
      ),
    );
  }

  void changeShape() {
    final random = Random();
    setState(() {
      width = random.nextDouble() * 300;
      height = random.nextDouble() * 300;

      color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );

      borderRadius = BorderRadius.circular(
        random.nextInt(100).toDouble(),
      );
    });
  }
}
