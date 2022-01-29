import 'package:flutter/material.dart';
import 'package:ankama_launcher/localization.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 66, 103, 178),
        onPrimary: Colors.white,
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.facebook_rounded),
      label: Text(context.l10n.signInFacebook.toUpperCase()),
    );
  }
}
