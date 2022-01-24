import 'package:ankama_launcher/views/settings_overlay/general/settings_general_tiles.dart';
import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingsGeneralView extends StatelessWidget {
  SettingsGeneralView({Key? key}) : super(key: key);

  final List<SettingTile> tiles = List.of(
    [
      LanguageSettingTile(),
      InterfaceSizeSettingTile(),
      ThemeModeSettingTile(),
      StartupSettingTile(),
      ReduceInsteadCloseSettingTile(),
      ReduceInsteadMinimizeSettingTile(),
    ],
    growable: false,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final tile = tiles.elementAt(index);

        final subtitle = tile.buildDescription(context);

        return ListTile(
          title: tile.buildTitle(context),
          subtitle: subtitle,
          isThreeLine: subtitle != null,
          trailing: tile.buildTrailing(context),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: tiles.length,
    );
  }
}
