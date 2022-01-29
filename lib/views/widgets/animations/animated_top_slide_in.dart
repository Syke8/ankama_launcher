import 'package:flutter/widgets.dart';

const int _kDefaultDuration = 200;

class AnimatedTopSlideIn extends StatefulWidget {
  const AnimatedTopSlideIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: _kDefaultDuration),
    this.offset = -0.1,
  })  : assert(offset < .0),
        super(key: key);

  final Duration duration;
  final Widget child;
  final double offset;

  @override
  State<StatefulWidget> createState() => _AnimatedTopSlideInState();
}

class _AnimatedTopSlideInState extends State<AnimatedTopSlideIn>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..forward();

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late final _transitionTween = Tween(
    begin: Offset(.0, widget.offset),
    end: const Offset(.0, .0),
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
      child: SlideTransition(
        position: _animation.drive(_transitionTween),
        child: widget.child,
      ),
    );
  }
}

class TopSlideIn extends StatelessWidget {
  TopSlideIn({Key? key, required this.child, required this.controller})
      : assert(controller.lowerBound >= .0),
        assert(controller.upperBound <= 1.0),
        super(key: key);

  final AnimationController controller;
  final Widget child;

  late final _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );

  final _transitionTween = Tween(
    begin: const Offset(.0, -0.1),
    end: const Offset(.0, .0),
  );

  static AnimationController defaultController(TickerProvider vsync) => AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: _kDefaultDuration),
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(_transitionTween),
        child: child,
      ),
    );
  }
}
