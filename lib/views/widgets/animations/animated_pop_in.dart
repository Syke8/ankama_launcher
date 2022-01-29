import 'package:flutter/material.dart';

class AnimatedPopIn extends StatefulWidget {
  const AnimatedPopIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final Duration duration;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _AnimatedPopInState();
}

class _AnimatedPopInState extends State<AnimatedPopIn> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..forward();

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
