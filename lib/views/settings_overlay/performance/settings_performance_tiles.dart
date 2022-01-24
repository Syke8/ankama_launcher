import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_dropdown_trailing.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneralPerformanceSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceGeneral);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceGeneralDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        AppLocalizations.of(context)!.settingsPerformanceGeneralHigh,
        AppLocalizations.of(context)!.settingsPerformanceGeneralMedium,
        AppLocalizations.of(context)!.settingsPerformanceGeneralLow,
      ]),
    );
  }
}

class ImageQualitySettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceImageQuality);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceImageQualityDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        AppLocalizations.of(context)!.settingsPerformanceImageQualityHigh,
        AppLocalizations.of(context)!.settingsPerformanceImageQualityMedium,
        AppLocalizations.of(context)!.settingsPerformanceImageQualityLow,
      ]),
    );
  }
}

class DownloadBandwidthSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceDownloadBandwidth);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceDownloadBandwidthDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class UIAnimationsSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceUIAnimations);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceUIAnimationsDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class VideoCarouselSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceVideoCarousel);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceVideoCarouselDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class KeepLauncherOpenedSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceKeepLauncherOpened);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(AppLocalizations.of(context)!.settingsPerformanceKeepLauncherOpenedDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}
