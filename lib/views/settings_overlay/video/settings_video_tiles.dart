import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_button_trailing.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AutoPlaySettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsVideoStreamAutoPlay);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsVideoStreamAutoPlayDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class StreamNotificationSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsVideoStreamStreamNotification);
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
    return Text(AppLocalizations.of(context)!.settingsVideoStreamTwitchConnection);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsVideoStreamTwitchConnectionDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonIconTrailing(
      onPressed: () {},
      label: AppLocalizations.of(context)!.settingsVideoStreamTwitchConnectionButton,
      iconData: CommunityMaterialIcons.twitch,
    );
  }
}
