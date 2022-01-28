import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/widgets/dropdown_outlined_button.dart';
import 'package:flutter/material.dart';

class SettingDropdownTrailing extends StatefulWidget {
  const SettingDropdownTrailing({
    Key? key,
    required this.options,
  }) : super(key: key);

  final HashSet<String> options;

  @override
  State<SettingDropdownTrailing> createState() => _SettingDropdownTrailingState();
}

class _SettingDropdownTrailingState extends State<SettingDropdownTrailing> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: kTrailingWidth),
      child: DropdownOutlinedButton<String>(
        value: widget.options.first,
        items: widget.options
            .map((e) => DropdownButtonItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (String? value) {
          debugPrint(value);
        },
      ),
    );
  }
}
