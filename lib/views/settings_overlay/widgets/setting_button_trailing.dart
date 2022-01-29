import 'package:ankama_launcher/style.dart';
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
    return SizedBox(
      width: kTrailingWidth,
      height: AppStyle.secondaryButtonHeight,
      child: OutlinedButton(
        style: OutlinedButtonTheme.of(context).style!.copyWith(
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).colorScheme.onSecondaryContainer),
            ),
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
    return SizedBox(
      width: kTrailingWidth,
      height: AppStyle.secondaryButtonHeight,
      child: OutlinedButton.icon(
        style: OutlinedButtonTheme.of(context).style!.copyWith(
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).colorScheme.onSecondaryContainer),
            ),
        onPressed: onPressed,
        label: FittedBox(child: Text(label)),
        icon: Icon(iconData),
      ),
    );
  }
}
