import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_button_trailing.dart';
import 'package:flutter/material.dart';
import 'package:ankama_launcher/localization.dart';

class ResetLauncherSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsHelpResetLauncher);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsHelpResetLauncherDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: context.l10n.settingsHelpResetLauncherButton,
    );
  }
}

class FAQSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsHelpFAQ);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsHelpFAQDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: context.l10n.settingsHelpFAQButton,
    );
  }
}

class HelpSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsHelpHelp);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsHelpHelpDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: context.l10n.settingsHelpHelpButton,
    );
  }
}

class LogsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsHelpLogs);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsHelpLogsDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: context.l10n.settingsHelpLogsButton,
    );
  }
}
