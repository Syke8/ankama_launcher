import 'dart:collection';

import 'package:ankama_launcher/views/settings_overlay/setting_tile.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_dropdown_trailing.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/setting_switch_trailing.dart';
import 'package:flutter/material.dart';
import 'package:ankama_launcher/localization.dart';

class GeneralPerformanceSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsPerformanceGeneral);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsPerformanceGeneralDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        context.l10n.settingsPerformanceGeneralHigh,
        context.l10n.settingsPerformanceGeneralMedium,
        context.l10n.settingsPerformanceGeneralLow,
      ]),
    );
  }
}

class ImageQualitySettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsPerformanceImageQuality);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsPerformanceImageQualityDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return SettingDropdownTrailing(
      options: HashSet.from([
        context.l10n.settingsPerformanceImageQualityHigh,
        context.l10n.settingsPerformanceImageQualityMedium,
        context.l10n.settingsPerformanceImageQualityLow,
      ]),
    );
  }
}

class DownloadBandwidthSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsPerformanceDownloadBandwidth);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsPerformanceDownloadBandwidthDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class UIAnimationsSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsPerformanceUIAnimations);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsPerformanceUIAnimationsDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class VideoCarouselSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsPerformanceVideoCarousel);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsPerformanceVideoCarouselDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}

class KeepLauncherOpenedSettingTile extends SettingTile {
  @override
  Widget buildTitle(BuildContext context) {
    return Text(context.l10n.settingsPerformanceKeepLauncherOpened);
  }

  @override
  Widget buildDescription(BuildContext context) {
    return Text(context.l10n.settingsPerformanceKeepLauncherOpenedDesc);
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const SettingSwitchTrailing(state: false);
  }
}
