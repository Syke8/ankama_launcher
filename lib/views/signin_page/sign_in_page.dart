import 'package:ankama_launcher/assets.dart';
import 'package:ankama_launcher/views/signin_page/widgets/close_settings_button.dart';
import 'package:ankama_launcher/views/widgets/labeled_checkbox.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

const _kMenuBackgroundWidth = 500.0;
const _kMenuPadding = 50.0;
const _kTitleBarHeight = 50.0;
const _kIconSize = 26.0;

// TODO: refactor in one page = titlebar + indexedstack (views)

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool displaySettings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: _Background()),
          const _SignInMenu(),
          if (displaySettings)
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.only(top: _kTitleBarHeight),
                color: Colors.black87,
                child: Row(
                  children: [
                    const Spacer(),
                    /** bouton fermer animation venant de la gauche, menu des options animation venant de la droite */
                    CloseSettingsButton(
                      onTap: () => setState(() => displaySettings = false),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                        ),
                        child: Column(
                          children: const [
                            Text('data'),
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          _TitleBar(
            onOpenSettings: () {
              if (displaySettings) {
                return;
              }

              setState(() => displaySettings = true);
            },
          ),
        ],
      ),
    );
  }
}

class _TitleBar extends StatefulWidget {
  const _TitleBar({
    Key? key,
    required this.onOpenSettings,
  }) : super(key: key);

  final void Function() onOpenSettings;

  @override
  State<_TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<_TitleBar> {
  Color barColor = Colors.transparent;

  // TODO: juste changer la couleur du bouton settings en orange et fuck tout ce truc de focus
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _kTitleBarHeight,
      duration: const Duration(milliseconds: 200),
      color: barColor,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(),
            ),
            MouseRegion(
              onEnter: (_) => setState(() => barColor = Colors.black),
              onExit: (_) => setState(() => barColor = Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _TitleBarButton(
                    icon: CommunityMaterialIcons.tune_variant,
                    focusColor: Theme.of(context).colorScheme.primary,
                    onPressed: widget.onOpenSettings,
                  ),
                  _TitleBarButton(
                    icon: Icons.minimize_rounded,
                    onPressed: () => appWindow.minimize(),
                  ),
                  _TitleBarButton(
                    icon: CommunityMaterialIcons.square_rounded_outline,
                    onPressed: () => appWindow.maximizeOrRestore(),
                  ),
                  _TitleBarButton(
                    icon: Icons.close_rounded,
                    hoverColor: Theme.of(context).colorScheme.primary,
                    splashColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () => appWindow.close(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleBarButton extends StatelessWidget {
  const _TitleBarButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.hoverColor,
    this.splashColor,
    this.focusColor,
    this.focus,
  }) : super(key: key);

  final IconData icon;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? focusColor;
  final void Function() onPressed;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: _kTitleBarHeight,
      child: Material(
        type: MaterialType.transparency,
        child: IconButton(
          hoverColor: hoverColor ?? Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
          splashColor: splashColor ?? Theme.of(context).colorScheme.primary,
          focusColor: focusColor,
          onPressed: onPressed,
          iconSize: _kIconSize,
          icon: Icon(icon),
          focusNode: focus,
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.background,
      fit: BoxFit.cover,
    );
  }
}

class _SignInMenu extends StatelessWidget {
  const _SignInMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: _kMenuBackgroundWidth),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black12, Colors.black45],
          stops: [.6, 1.0],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: _kMenuPadding,
        vertical: _kTitleBarHeight,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(
              'https://static.ankama.com/ankama/www/modules/assets/logo.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Connexion'.toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Identifiant',
                suffixIcon: Icon(
                  Icons.help_outline_rounded,
                  size: _kIconSize,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: _PasswordTextField(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _ForgottenPasswordText(
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                LabeledCheckbox(
                  label: 'Se souvenir de moi',
                  onChecked: () {},
                  onUnchecked: () {},
                ),
                LabeledCheckbox(
                  label: 'Rester connecté',
                  onChecked: () {},
                  onUnchecked: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Se connecter'.toUpperCase()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 2.0,
                    endIndent: 16.0,
                    color: Colors.white,
                  ),
                ),
                Text('Ou'.toUpperCase()),
                const Expanded(
                  child: Divider(
                    thickness: 2.0,
                    indent: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _FacebookSignInButton(
              onPressed: () {},
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(CommunityMaterialIcons.arrow_right_circle_outline),
                    label: const Text('Impossible de se connecter ?'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(CommunityMaterialIcons.arrow_right_circle_outline),
                    label: const Text('Créer un compte Ankama'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Mot de passe',
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          iconSize: _kIconSize,
          onPressed: () => setState(() => obscure = !obscure),
        ),
      ),
      obscureText: obscure,
    );
  }
}

class _ForgottenPasswordText extends StatefulWidget {
  const _ForgottenPasswordText({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  State<_ForgottenPasswordText> createState() => _ForgottenPasswordTextState();
}

class _ForgottenPasswordTextState extends State<_ForgottenPasswordText> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      onHover: (value) => setState(() => hovering = value),
      child: Text(
        'Mot de passe oublié ?',
        style: TextStyle(decoration: hovering ? TextDecoration.underline : null),
      ),
    );
  }
}

class _FacebookSignInButton extends StatelessWidget {
  const _FacebookSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 66, 103, 178),
        onPrimary: Colors.white,
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.facebook_rounded),
      label: Text('Se connecter avec Facebook'.toUpperCase()),
    );
  }
}
