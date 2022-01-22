import 'package:flutter/material.dart';

class ForgottenPasswordText extends StatefulWidget {
  const ForgottenPasswordText({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  State<ForgottenPasswordText> createState() => _ForgottenPasswordTextState();
}

class _ForgottenPasswordTextState extends State<ForgottenPasswordText> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      onHover: (value) => setState(() => hovering = value),
      child: Text(
        'Mot de passe oublié ?',
        style: TextStyle(decoration: hovering ? TextDecoration.underline : null),
      ),
    );
  }
}
