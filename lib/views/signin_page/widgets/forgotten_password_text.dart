import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        AppLocalizations.of(context)!.signInForgottenPassword,
        style: TextStyle(decoration: hovering ? TextDecoration.underline : null),
      ),
    );
  }
}
