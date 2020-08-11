import 'package:flutter/material.dart';

class ShakeTansitions extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offSet;

  const ShakeTansitions(
      {Key key,
      this.duration = const Duration(milliseconds: 500),
      this.offSet = 140.0,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.bounceInOut,
      tween: Tween(begin: 0.5, end: 0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            value * offSet,
            0.0,
          ),
          child: child,
        );
      },
    );
  }
}
