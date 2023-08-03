import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;

  const OnHoverButton({Key? key, required this.child}) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    /*final hoveredTransform = Matrix4.identity()..translate(-3,-3,0);*/
    TransformationController _transformationController =
        TransformationController();
    final currentScale = _transformationController.value.getMaxScaleOnAxis();
    _transformationController.value = Matrix4.identity()
      ..scale(currentScale * 1.1);
    final transform =
        isHovered ? _transformationController.value : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        /*curve: Sprung.underDamped,*/
          duration: Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        log("IsHovered : $isHovered");
        this.isHovered = isHovered;
      });
}
