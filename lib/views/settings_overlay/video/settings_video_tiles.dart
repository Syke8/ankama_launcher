import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_button_trailing.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:ankama_launcher/localization.dart';

class AutoPlaySettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsVideoStreamAutoPlay);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsVideoStreamAutoPlayDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class StreamNotificationSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsVideoStreamStreamNotification);
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

class TwitchConnectionSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsVideoStreamTwitchConnection);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsVideoStreamTwitchConnectionDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonIconTrailing(
      onPressed: () {},
      label: context.l10n.settingsVideoStreamTwitchConnectionButton,
      iconData: CommunityMaterialIcons.twitch,
    );
  }
}
