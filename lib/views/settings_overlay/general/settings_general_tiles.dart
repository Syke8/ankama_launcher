import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_dropdown_trailing.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:flutter/material.dart';
import 'package:ankama_launcher/localization.dart';

class LanguageSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsGeneralLanguage);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsGeneralLanguageDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        context.l10n.settingsGeneralLanguageEnglish,
        context.l10n.settingsGeneralLanguageSpanish,
        context.l10n.settingsGeneralLanguageFrench,
        context.l10n.settingsGeneralLanguagePortuguese,
      ]),
    );
  }
}

class InterfaceSizeSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsGeneralUISize);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsGeneralUISizeDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        context.l10n.settingsGeneralUISizeSD,
        context.l10n.settingsGeneralUISizeHD,
        context.l10n.settingsGeneralUISize4K,
      ]),
    );
  }
}

class ThemeModeSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsGeneralTheme);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsGeneralThemeDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        context.l10n.settingsGeneralThemeLight,
        context.l10n.settingsGeneralThemeDark,
      ]),
    );
  }
}

class StartupSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsGeneralStartupLaunch);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsGeneralStartupLaunchDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class ReduceInsteadCloseSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsGeneralReduceInsteadClose);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsGeneralReduceInsteadCloseDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: true);
  }
}

class ReduceInsteadMinimizeSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsGeneralReduceInsteadMinimize);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsGeneralReduceInsteadMinimizeDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: true);
  }
}
