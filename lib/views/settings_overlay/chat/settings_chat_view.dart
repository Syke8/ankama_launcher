import 'package:ankama_launcher/views/settings_overlay/chat/settings_chat_tiles.dart';
import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingsChatView extends StatelessWidget {
  SettingsChatView({Key? key}) : super(key: key);

  final List<SettingTile> tiles = List.of(
    [
      DenyFriendSettingTile(),
      EnableNotificationsSettingTile(),
      EnableMessageNotificationsSettingTile(),
      EnableFriendRequestNotificationsSettingTile(),
      EnableFriendConnectionNotificationsSettingTile(),
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
      separatorBuilder: (context, index) {
        return index == 0 ? const Divider() : const SizedBox();
      },
      itemCount: tiles.length,
    );
  }
}
