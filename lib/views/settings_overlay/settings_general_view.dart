import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingsGeneralView extends StatelessWidget {
  SettingsGeneralView({Key? key}) : super(key: key);

  final List<SettingTile> tiles = List.of(
    [
      DropdownSettingTile(
        title: 'Langue',
        description: "La langue utilisée dans l'interface du Launcher.",
        options: HashSet.from([
          'English',
          'Español',
          'Français',
          'Português',
        ]),
      ),
    ],
    growable: false,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final tile = tiles.elementAt(index);

        return ListTile(
          title: Text(tile.title),
          subtitle: Text(tile.description),
          isThreeLine: true,
          trailing: tile.type == SettingTileType.dropdown
              ? _DropdownTrailing(options: (tile as DropdownSettingTile).options)
              : const SizedBox(),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: tiles.length,
    );
  }
}

class _DropdownTrailing extends StatefulWidget {
  const _DropdownTrailing({
    Key? key,
    required this.options,
  }) : super(key: key);

  final HashSet<String> options;

  @override
  State<_DropdownTrailing> createState() => _DropdownTrailingState();
}

class _DropdownTrailingState extends State<_DropdownTrailing> {
  late String dropdownValue = widget.options.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        dropdownColor: Theme.of(context).colorScheme.background,
        value: dropdownValue,
        items: widget.options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (String? option) => setState(() => dropdownValue = option!),
      ),
    );
  }
}
