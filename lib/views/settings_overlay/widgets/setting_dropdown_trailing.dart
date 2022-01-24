import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:flutter/material.dart';

// TODO: make custom dropdown because they don't "fit" into the design
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
  late String dropdownValue = widget.options.first;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: kTrailingWidth),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(16.0),
        dropdownColor: Theme.of(context).colorScheme.background,
        value: dropdownValue,
        items: widget.options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: kTrailingWidth),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
        onChanged: (String? option) => setState(() => dropdownValue = option!),
      ),
    );
  }
}
