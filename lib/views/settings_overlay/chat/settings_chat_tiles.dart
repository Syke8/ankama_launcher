import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DenyFriendSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsChatDenyFriend);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsChatDenyFriendDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class EnableNotificationsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsChatEnableAllNotifications);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsChatEnableAllNotificationsDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class EnableMessageNotificationsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsChatEnableMessageReceiveNotification);
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
    return Text(AppLocalizations.of(context)!.settingsChatEnableFriendRequestNotification);
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
    return Text(AppLocalizations.of(context)!.settingsChatEnableFriendConnectionNotification);
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
