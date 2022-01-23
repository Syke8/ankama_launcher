import 'dart:collection';

enum SettingTileType { dropdown, switchBox, button }

// TODO: implement internationalization for them
abstract class SettingTile {
  const SettingTile({
    required this.title,
    required this.description,
    required this.type,
  });

  final String title;
  final String description;
  final SettingTileType type;
}

class DropdownSettingTile extends SettingTile {
  const DropdownSettingTile({
    required String title,
    required String description,
    required this.options,
  }) : super(
          title: title,
          description: description,
          type: SettingTileType.dropdown,
        );

  final HashSet<String> options;
}

class SwitchSettingTile extends SettingTile {
  const SwitchSettingTile({
    required String title,
    required String description,
    required this.state,
  }) : super(
          title: title,
          description: description,
          type: SettingTileType.switchBox,
        );

  final bool state;
}

class ButtonSettingTile extends SettingTile {
  const ButtonSettingTile({
    required String title,
    required String description,
    required this.onPressed,
    required this.label,
  }) : super(
          title: title,
          description: description,
          type: SettingTileType.button,
        );

  final void Function() onPressed;
  final String label;
}
