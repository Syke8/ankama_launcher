import 'package:ankama_launcher/views/settings_overlay/settings_overlay.dart';
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
  bool settingsOpened = false;

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
                if (!settingsOpened) {
                  setState(() {
                    barColor = widget.backgroundColor ?? Theme.of(context).colorScheme.background;
                  });
                }
              },
              onExit: (_) {
                if (!settingsOpened) {
                  setState(() {
                    barColor = Colors.transparent;
                  });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _SettingsButton(
                    onClose: () => setState(() {
                      barColor = Colors.transparent;
                      settingsOpened = false;
                    }),
                    onOpen: () => setState(() {
                      barColor = widget.backgroundColor ?? Theme.of(context).colorScheme.background;
                      settingsOpened = true;
                    }),
                  ),
                  const _MinimizeButton(),
                  const _MaximizeButton(),
                  const _CloseButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsButton extends StatefulWidget {
  const _SettingsButton({
    Key? key,
    required this.onOpen,
    required this.onClose,
  }) : super(key: key);

  final void Function() onOpen;
  final void Function() onClose;

  @override
  State<_SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<_SettingsButton> {
  late OverlayEntry entry;
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return _TitleBarButton(
      backgroundColor: opened ? Theme.of(context).colorScheme.primary : null,
      iconData: CommunityMaterialIcons.tune_variant,
      onTap: () {
        if (opened) {
          return;
        }

        entry = OverlayEntry(
          builder: (context) => Positioned(
            top: kTitleBarHeight,
            height: MediaQuery.of(context).size.height - kTitleBarHeight,
            width: MediaQuery.of(context).size.width,
            child: SettingsOverlay(
              onClose: () {
                entry.remove();

                widget.onClose();

                setState(() {
                  opened = false;
                });
              },
            ),
          ),
        );

        Overlay.of(context)!.insert(entry);

        widget.onOpen();

        setState(() {
          opened = true;
        });
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
