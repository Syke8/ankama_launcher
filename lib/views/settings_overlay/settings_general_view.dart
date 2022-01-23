import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:flutter/material.dart';

const _kTrailingWidth = 200.0;

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
      DropdownSettingTile(
        title: "Taille de l'interface",
        description: "Change la taille de tous les composants du launcher : boutons, police...",
        options: HashSet.from([
          'SD (petit)',
          'HD (classique)',
          '4K (grand)',
        ]),
      ),
      DropdownSettingTile(
        title: 'Thème',
        description: "Permet de personnaliser l'apparence du launcher.",
        options: HashSet.from([
          'Thème classique',
          'Thème sombre',
        ]),
      ),
      const SwitchSettingTile(
        title: "Exécuter au démarrage de l'ordinateur",
        description: 'Lancer le Launcher Ankama au démarrage de cet ordinateur.',
        state: true,
      ),
      const SwitchSettingTile(
        title: 'Réduire dans la zone de notification au lieu de fermer',
        description:
            "Réduire le Launcher Ankama dans la zone de notification au lieu de quitter l'application.",
        state: true,
      ),
      const SwitchSettingTile(
        title: 'Réduire dans la zone de notification au lieu de minimiser',
        description:
            'Réduire le Launcher Ankama dans la zone de notification plutôt que dans la barre de tâches.',
        state: false,
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
              : tile.type == SettingTileType.switchBox
                  ? _SwitchTrailing(state: (tile as SwitchSettingTile).state)
                  : tile.type == SettingTileType.button
                      ? _TrailingButton(
                          onPressed: (tile as ButtonSettingTile).onPressed,
                          label: (tile as ButtonSettingTile).label,
                        )
                      : const SizedBox(),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: tiles.length,
    );
  }
}

class _TrailingButton extends StatelessWidget {
  const _TrailingButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: _kTrailingWidth),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

class _SwitchTrailing extends StatefulWidget {
  const _SwitchTrailing({
    Key? key,
    required this.state,
  }) : super(key: key);

  final bool state;

  @override
  State<StatefulWidget> createState() => _SwitchTrailingState();
}

class _SwitchTrailingState extends State<_SwitchTrailing> {
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

// TODO: make custom dropdown because they don't "fit" into the design
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
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: _kTrailingWidth),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(16.0),
        dropdownColor: Theme.of(context).colorScheme.background,
        value: dropdownValue,
        items: widget.options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: _kTrailingWidth),
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
