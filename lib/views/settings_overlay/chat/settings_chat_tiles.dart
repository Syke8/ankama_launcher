import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:flutter/material.dart';
import 'package:ankama_launcher/localization.dart';

class DenyFriendSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsChatDenyFriend);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsChatDenyFriendDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class EnableNotificationsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsChatEnableAllNotifications);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsChatEnableAllNotificationsDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class EnableMessageNotificationsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsChatEnableMessageReceiveNotification);
  }

  @override
  Widget? buildDescription(BuildContext context) {
    return null;
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class EnableFriendRequestNotificationsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsChatEnableFriendRequestNotification);
  }

  @override
  Widget? buildDescription(BuildContext context) {
    return null;
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class EnableFriendConnectionNotificationsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsChatEnableFriendConnectionNotification);
  }

  @override
  Widget? buildDescription(BuildContext context) {
    return null;
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}
