import 'package:flutter/material.dart';

class SettingSwitchTrailing extends StatefulWidget {
  const SettingSwitchTrailing({
    Key? key,
    required this.state,
  }) : super(key: key);

  final bool state;

  @override
  State<StatefulWidget> createState() => _SettingSwitchTrailingState();
}

class _SettingSwitchTrailingState extends State<SettingSwitchTrailing> {
  late bool switchState = widget.state;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: switchState,
      onChanged: (state) {
        setState(() {
          switchState = state;
        });
      },
    );
  }
}
