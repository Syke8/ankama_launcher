import 'package:flutter/material.dart';

const kTrailingWidth = 200.0;

abstract class SettingTile {
  Widget buildTitle(BuildContext context);

  Widget? buildDescription(BuildContext context);

  Widget? buildTrailing(BuildContext context);
}
