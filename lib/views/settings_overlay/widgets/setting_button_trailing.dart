import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingButtonTrailing extends StatelessWidget {
  const SettingButtonTrailing({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: kTrailingWidth),
      child: OutlinedButton(
        onPressed: onPressed,
        child: FittedBox(child: Text(label)),
      ),
    );
  }
}

class SettingButtonIconTrailing extends StatelessWidget {
  const SettingButtonIconTrailing({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: kTrailingWidth),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: FittedBox(child: Text(label)),
        icon: Icon(iconData),
      ),
    );
  }
}
