import 'package:flutter/material.dart';

class CloseSettingsButton extends StatelessWidget {
  const CloseSettingsButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 120.0,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: const CircleBorder(),
          hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: CustomPaint(
            painter: _CircleBackground(Theme.of(context).colorScheme.primary),
            child: const Center(
              child: Icon(
                Icons.close_rounded,
                size: 42.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleBackground extends CustomPainter {
  _CircleBackground(this.circleColor);

  final Color circleColor;

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = circleColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2.0, size.height / 2.0),
      size.shortestSide / 2.0,
      painter,
    );
  }

  @override
  bool shouldRepaint(covariant _CircleBackground oldDelegate) {
    return oldDelegate.circleColor != circleColor;
  }
}
