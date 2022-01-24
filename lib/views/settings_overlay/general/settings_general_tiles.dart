import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_dropdown_trailing.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralLanguage);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralLanguageDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        AppLocalizations.of(context)!.settingsGeneralLanguageEnglish,
        AppLocalizations.of(context)!.settingsGeneralLanguageSpanish,
        AppLocalizations.of(context)!.settingsGeneralLanguageFrench,
        AppLocalizations.of(context)!.settingsGeneralLanguagePortuguese,
      ]),
    );
  }
}

class InterfaceSizeSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralUISize);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralUISizeDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        AppLocalizations.of(context)!.settingsGeneralUISizeSD,
        AppLocalizations.of(context)!.settingsGeneralUISizeHD,
        AppLocalizations.of(context)!.settingsGeneralUISize4K,
      ]),
    );
  }
}

class ThemeModeSettingTile implements SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralTheme);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralThemeDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        AppLocalizations.of(context)!.settingsGeneralThemeLight,
        AppLocalizations.of(context)!.settingsGeneralThemeDark,
      ]),
    );
  }
}

class StartupSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralStartupLaunch);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralStartupLaunchDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class ReduceInsteadCloseSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralReduceInsteadClose);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralReduceInsteadCloseDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: true);
  }
}

class ReduceInsteadMinimizeSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralReduceInsteadMinimize);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsGeneralReduceInsteadMinimizeDesc);
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: true);
  }
}
