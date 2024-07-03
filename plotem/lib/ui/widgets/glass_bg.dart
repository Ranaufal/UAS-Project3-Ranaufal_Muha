// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plotem/utils/const.dart';

class GlassBackground extends StatefulWidget {
  final theChild;

  const GlassBackground({
    super.key,
    required this.theChild,
  });

  @override
  State<GlassBackground> createState() => _GlassBackgroundState();
}

class _GlassBackgroundState extends State<GlassBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
      ],
    ).animate(_controller);
    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
      ],
    ).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: _topAlignmentAnimation.value,
                end: _bottomAlignmentAnimation.value,
              ),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                // blur effect========================
                // BackdropFilter(
                //   filter: ImageFilter.blur(
                //     sigmaX: 1,
                //     sigmaY: 1,
                //   ),
                //   child: Container(),
                // ),
                // //gradient effect========================
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        bgColor.withOpacity(0.99),
                        bgColor.withOpacity(0.95),
                      ],
                    ),
                  ),
                ),
                widget.theChild,
              ],
            ),
          );
        });
  }
}

class MyGlassBox extends StatelessWidget {
  final theChild;
  const MyGlassBox({
    super.key,
    required this.theChild,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          // blur effect========================
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7,
              sigmaY: 5,
            ),
            child: Container(),
          ),
          //gradient effect========================
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  bgColor.withOpacity(0.99),
                  bgColor.withOpacity(0.95),
                ],
              ),
            ),
          ),
          theChild,
        ],
      ),
    );
  }
}
