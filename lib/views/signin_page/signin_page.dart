import 'package:ankama_launcher/assets.dart';
import 'package:ankama_launcher/localization.dart';
import 'package:ankama_launcher/style.dart';
import 'package:ankama_launcher/views/signin_page/widgets/facebook_signin_button.dart';
import 'package:ankama_launcher/views/signin_page/widgets/forgotten_password_text.dart';
import 'package:ankama_launcher/views/widgets/labeled_checkbox.dart';
import 'package:ankama_launcher/views/signin_page/widgets/password_text_field.dart';
import 'package:ankama_launcher/views/widgets/title_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

const kMenuBackgroundWidth = 500.0;
const kMenuPadding = 50.0;

// TODO: add Form validation to textfields
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TitleBar(),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.background),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: const BoxConstraints(maxWidth: kMenuBackgroundWidth),
              padding: const EdgeInsets.symmetric(
                horizontal: kMenuPadding,
                vertical: 16.0,
              ),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black12, Colors.black45],
                  stops: [.6, 1.0],
                ),
              ),
              child: SafeArea(
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
                          context.l10n.connection.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: context.l10n.identifier,
                          suffixIcon: const Icon(
                            Icons.help_outline_rounded,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: PasswordTextField(),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ForgottenPasswordText(
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          LabeledCheckbox(
                            label: context.l10n.rememberMe,
                            onChecked: () {},
                            onUnchecked: () {},
                          ),
                          LabeledCheckbox(
                            label: context.l10n.stayLoggedIn,
                            onChecked: () {},
                            onUnchecked: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox.fromSize(
                        size: const Size.fromHeight(AppStyle.primaryButtonHeight),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(context.l10n.signIn.toUpperCase()),
                        ),
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
                          Text(context.l10n.or.toUpperCase()),
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
                      child: SizedBox.fromSize(
                        size: const Size.fromHeight(AppStyle.primaryButtonHeight),
                        child: FacebookSignInButton(
                          onPressed: () {},
                        ),
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
                              label: Text(context.l10n.signInConnectionProblem),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(CommunityMaterialIcons.arrow_right_circle_outline),
                              label: Text(context.l10n.signIncreateAnkamaAccount),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
