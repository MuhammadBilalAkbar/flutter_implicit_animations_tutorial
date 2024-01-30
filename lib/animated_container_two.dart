import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimatedTwo extends StatefulWidget {
  const ContainerAnimatedTwo({super.key, required this.title});

  final String title;

  @override
  State<ContainerAnimatedTwo> createState() => _ContainerAnimatedTwoState();
}

class _ContainerAnimatedTwoState extends State<ContainerAnimatedTwo> {
  bool bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              width: bigger ? 100 : 500,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: const [Colors.purple, Colors.transparent],
                  stops: [bigger ? 0.2 : 0.5, 1.0],
                ),
              ),
              duration: const Duration(seconds: 1),
              // curve: Curves.easeInOutQuint,
              curve: const SineCurve(),
              child: Image.asset('assets/star.png'),
            ),
          ),
          ElevatedButton(
            onPressed: changeShape,
            child: const Icon(Icons.star, size: 50),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        tooltip: 'Increment',
        child: const Icon(Icons.change_circle, size: 50),
      ),
    );
  }

  void changeShape() {
    setState(() {
      bigger = !bigger;
    });
  }
}

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) => sin(count * 2 * pi * t) * 0.5 + 0.5;
}
