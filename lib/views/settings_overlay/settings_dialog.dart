import 'package:animations/animations.dart';
import 'package:ankama_launcher/localization.dart';
import 'package:ankama_launcher/views/settings_overlay/chat/settings_chat_view.dart';
import 'package:ankama_launcher/views/settings_overlay/general/settings_general_view.dart';
import 'package:ankama_launcher/views/settings_overlay/help/settings_help_view.dart';
import 'package:ankama_launcher/views/settings_overlay/settings_legal_view.dart';
import 'package:ankama_launcher/views/settings_overlay/performance/settings_performance_view.dart';
import 'package:ankama_launcher/views/settings_overlay/video/settings_video_view.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/close_settings_button.dart';
import 'package:ankama_launcher/views/widgets/title_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
  )..forward();

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsTitleBar(),
      backgroundColor: Colors.black54,
      body: Row(
        children: [
          const Spacer(),
          FadeTransition(
            opacity: _animation,
            child: SlideTransition(
              position: _animation.drive(Tween(
                begin: const Offset(-1.0, .0),
                end: const Offset(.0, .0),
              )),
              child: RotationTransition(
                turns: _animation.drive(Tween(
                  begin: .0,
                  end: 0.25,
                )),
                child: CloseSettingsButton(
                  onTap: () {
                    _controller.reverse().then((_) {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            ),
          ),
          const Spacer(),
          SlideTransition(
            position: _animation.drive(Tween(
              begin: const Offset(1.0, .0),
              end: const Offset(.0, .0),
            )),
            child: Container(
              color: Theme.of(context).colorScheme.background,
              width: MediaQuery.of(context).size.width * 0.75,
              alignment: Alignment.center,
              child: _SettingsMenu(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsMenu extends StatefulWidget {
  @override
  State<_SettingsMenu> createState() => _SettingsMenuState();
}

enum _SettingsView { general, performance, chat, video, legal, help }

class _SettingsMenuState extends State<_SettingsMenu> {
  _SettingsView actualView = _SettingsView.general;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.3,
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        CommunityMaterialIcons.tune_variant,
                      ),
                      title: Text(
                        context.l10n.settings.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    _SettingsMenuListTile(
                      label: context.l10n.settingsGeneral,
                      selected: actualView == _SettingsView.general,
                      onTap: () {
                        if (actualView != _SettingsView.general) {
                          setState(() => actualView = _SettingsView.general);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: context.l10n.settingsPerformance,
                      selected: actualView == _SettingsView.performance,
                      onTap: () {
                        if (actualView != _SettingsView.performance) {
                          setState(() => actualView = _SettingsView.performance);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: context.l10n.settingsChat,
                      selected: actualView == _SettingsView.chat,
                      onTap: () {
                        if (actualView != _SettingsView.chat) {
                          setState(() => actualView = _SettingsView.chat);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: context.l10n.settingsVideoStream,
                      selected: actualView == _SettingsView.video,
                      onTap: () {
                        if (actualView != _SettingsView.video) {
                          setState(() => actualView = _SettingsView.video);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: context.l10n.settingsLegal,
                      selected: actualView == _SettingsView.legal,
                      onTap: () {
                        if (actualView != _SettingsView.legal) {
                          setState(() => actualView = _SettingsView.legal);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: context.l10n.settingsHelp,
                      selected: actualView == _SettingsView.help,
                      onTap: () {
                        if (actualView != _SettingsView.help) {
                          setState(() => actualView = _SettingsView.help);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  constraints: const BoxConstraints.expand(),
                  padding: const EdgeInsets.all(40.0),
                  child: PageTransitionSwitcher(
                    transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        child: child,
                      );
                    },
                    child: _menuView(actualView),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _menuView(_SettingsView view) {
    switch (view) {
      case _SettingsView.general:
        return SettingsGeneralView();
      case _SettingsView.performance:
        return SettingsPerformanceView();
      case _SettingsView.chat:
        return SettingsChatView();
      case _SettingsView.video:
        return SettingsVideoView();
      case _SettingsView.legal:
        return const SettingsLegalView();
      case _SettingsView.help:
        return SettingsHelpView();
    }
  }
}

class _SettingsMenuListTile extends StatelessWidget {
  const _SettingsMenuListTile({
    Key? key,
    required this.label,
    required this.onTap,
    this.selected = false,
  }) : super(key: key);

  final String label;
  final void Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(
        label.toUpperCase(),
      ),
      selected: selected,
      selectedTileColor: colorScheme.secondaryContainer,
      textColor: colorScheme.secondary,
      hoverColor: colorScheme.secondaryContainer,
      onTap: onTap,
    );
  }
}
