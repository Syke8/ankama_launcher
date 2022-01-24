import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_button_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetLauncherSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpResetLauncher);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpResetLauncherDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: AppLocalizations.of(context)!.settingsHelpResetLauncherButton,
    );
  }
}

class FAQSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpFAQ);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpFAQDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: AppLocalizations.of(context)!.settingsHelpFAQButton,
    );
  }
}

class HelpSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpHelp);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpHelpDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: AppLocalizations.of(context)!.settingsHelpHelpButton,
    );
  }
}

class LogsSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpLogs);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsHelpLogsDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingButtonTrailing(
      onPressed: () {},
      label: AppLocalizations.of(context)!.settingsHelpLogsButton,
    );
  }
}
