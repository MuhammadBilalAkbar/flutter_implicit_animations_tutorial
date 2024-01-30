import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimatedThree extends StatefulWidget {
  const ContainerAnimatedThree({super.key, required this.title});

  final String title;

  @override
  State<ContainerAnimatedThree> createState() => _ContainerAnimatedThreeState();
}

class _ContainerAnimatedThreeState extends State<ContainerAnimatedThree> {
  bool isExpanded = false;

  // bool isIconClicked = false;

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 250);
    const opacityDuration = Duration(milliseconds: 150);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          height: 48,
          duration: animationDuration,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: isExpanded ? Colors.blue : Colors.transparent,
              width: isExpanded ? 1 : 0,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                // onTapDown: (_) => setState(() => isIconClicked = true),
                // onTapUp: (_) => setState(() => isIconClicked = false),
                // onTapUp: (_) => setState(() => isIconClicked = !isIconClicked),
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: AnimatedOpacity(
                  duration: opacityDuration,
                  // opacity: isIconClicked ? 0.7 : 1,
                  opacity: isExpanded ? 0.5 : 1,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: AnimatedContainer(
                  duration: animationDuration,
                  curve: Curves.easeInOut,
                  width: isExpanded ? 200 : 0,
                  child: TextField(
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Start typing to search',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
