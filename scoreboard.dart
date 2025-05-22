import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const Scoreboard({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < totalQuestions; i++)
            AnimatedStar(                                      // NEW
              isActive: score > i,                             // NEW
            )
        ],
      ),
    );
  }
}
class AnimatedStar extends StatelessWidget {                   // Add from here...
  final bool isActive;
  final Duration _duration = const Duration(milliseconds: 1000);
  final Color _deactivatedColor = Colors.grey.shade400;
  final Color _activatedColor = Colors.yellow.shade700;
  final Curve _curve = Curves.elasticOut;

  AnimatedStar({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
        scale: isActive ? 1.0 : 0.5,
      curve: _curve,
      duration: _duration,
        child: TweenAnimationBuilder(         // Add from here...
          curve: _curve,
          duration: _duration,
          tween: ColorTween(
            begin: _deactivatedColor,
            end: isActive ? _activatedColor : _deactivatedColor,
    ),
    builder: (context, value, child) { // To here.
    return Icon(
    Icons.star,
    size: 50,
    color: value,
        );
       },
      ),
    );
  }
}