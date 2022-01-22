import 'package:animations/animations.dart';
import 'package:ankama_launcher/views/settings_overlay/widgets/close_settings_button.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsOverlay extends StatefulWidget {
  const SettingsOverlay({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  final void Function() onClose;

  @override
  State<SettingsOverlay> createState() => _SettingsOverlayState();
}

class _SettingsOverlayState extends State<SettingsOverlay> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
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
      backgroundColor: Colors.black54,
      body: Row(
        children: [
          const Spacer(),
          FadeTransition(
            opacity: _animation,
            child: SlideTransition(
              position: _animation.drive(Tween(
                begin: const Offset(-0.5, .0),
                end: const Offset(.0, .0),
              )),
              child: RotationTransition(
                turns: _animation.drive(Tween(
                  begin: .0,
                  end: 0.25,
                )),
                child: CloseSettingsButton(
                  onTap: () {
                    _controller.reverse().then((_) => widget.onClose());
                  },
                ),
              ),
            ),
          ),
          const Spacer(),
          SlideTransition(
            position: _animation.drive(Tween(
              begin: const Offset(0.5, .0),
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

enum _SettingsView {
  general,
  performance,
}

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
                        AppLocalizations.of(context)!.settings.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    _SettingsMenuListTile(
                      label: AppLocalizations.of(context)!.settingsGeneral,
                      selected: actualView == _SettingsView.general,
                      onTap: () {
                        if (actualView != _SettingsView.general) {
                          setState(() => actualView = _SettingsView.general);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: AppLocalizations.of(context)!.settingsPerformance,
                      selected: actualView == _SettingsView.performance,
                      onTap: () {
                        if (actualView != _SettingsView.performance) {
                          setState(() => actualView = _SettingsView.performance);
                        }
                      },
                    ),
                    _SettingsMenuListTile(
                      label: AppLocalizations.of(context)!.settingsChat,
                      onTap: () {},
                    ),
                    _SettingsMenuListTile(
                      label: AppLocalizations.of(context)!.settingsVideoStream,
                      onTap: () {},
                    ),
                    _SettingsMenuListTile(
                      label: AppLocalizations.of(context)!.settingsLegal,
                      onTap: () {},
                    ),
                    _SettingsMenuListTile(
                      label: AppLocalizations.of(context)!.settingsHelp,
                      onTap: () {},
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
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                  constraints: const BoxConstraints.expand(),
                  padding: const EdgeInsets.all(32.0),
                  child: PageTransitionSwitcher(
                    transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.scaled,
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
        return Column(
          children: [
            const Text('Général'),
          ],
        );
      case _SettingsView.performance:
        return const Text('Performance');
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
    final color = Theme.of(context).colorScheme.primary;

    return ListTile(
      title: Text(
        label.toUpperCase(),
      ),
      selected: selected,
      selectedTileColor: color.withOpacity(0.2),
      textColor: color,
      hoverColor: color.withOpacity(0.2),
      onTap: onTap,
    );
  }
}
