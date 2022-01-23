import 'package:ankama_launcher/views/settings_overlay/settings_dialog.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

const kTitleBarHeight = 50.0;

// TODO: add provider to change TitleBar buttons depending of user state
class TitleBar extends StatefulWidget with PreferredSizeWidget {
  const TitleBar({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;

  @override
  State<TitleBar> createState() => _TitleBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kTitleBarHeight);
}

class _TitleBarState extends State<TitleBar> {
  Color barColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      color: barColor,
      height: kTitleBarHeight,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(),
            ),
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  barColor = widget.backgroundColor ?? Theme.of(context).colorScheme.background;
                });
              },
              onExit: (_) {
                setState(() {
                  barColor = Colors.transparent;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _SettingsButton(),
                  _MinimizeButton(),
                  _MaximizeButton(),
                  _CloseButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTitleBar extends StatelessWidget with PreferredSizeWidget {
  const SettingsTitleBar({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).colorScheme.background,
      height: kTitleBarHeight,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const [
                _SettingsButtonOpened(),
                _MinimizeButton(),
                _MaximizeButton(),
                _CloseButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTitleBarHeight);
}

class _SettingsButtonOpened extends StatelessWidget {
  const _SettingsButtonOpened({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      onTap: () {},
      backgroundColor: Theme.of(context).colorScheme.primary,
      iconData: CommunityMaterialIcons.tune_variant,
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      iconData: CommunityMaterialIcons.tune_variant,
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          builder: (context) {
            return const SettingsDialog();
          },
        );
      },
    );
  }
}

class _MinimizeButton extends StatelessWidget {
  const _MinimizeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      iconData: Icons.minimize_rounded,
      onTap: () => appWindow.minimize(),
    );
  }
}

class _MaximizeButton extends StatelessWidget {
  const _MaximizeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      iconData: CommunityMaterialIcons.square_rounded_outline,
      onTap: () => appWindow.maximizeOrRestore(),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      iconData: Icons.close_rounded,
      hoverColor: Theme.of(context).colorScheme.primary,
      onTap: () => appWindow.close(),
    );
  }
}

class _TitleBarButton extends StatelessWidget {
  const _TitleBarButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    this.backgroundColor,
    this.splashColor,
    this.hoverColor,
  }) : super(key: key);

  final void Function() onTap;
  final IconData iconData;
  final Color? backgroundColor;
  final Color? splashColor;
  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: kTitleBarHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(color: backgroundColor),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            splashColor: splashColor,
            hoverColor: hoverColor ?? Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            child: Icon(iconData),
          ),
        ),
      ),
    );
  }
}
