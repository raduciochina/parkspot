import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/generated/l10n.dart';
import 'package:parkspot/routes/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        print(_currentUser?.displayName);
        Navigator.pushNamed(context, PageRoutes.addAddress);
      } else {
        _googleSignIn.signInSilently();
      }
    });
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  const Spacer(),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50,
                            color: backgroundColor,
                          ),
                          Image.asset("assets/img_sign.png"),
                        ],
                      ),
                      PositionedDirectional(
                        top: 0,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Image.asset("assets/logo1.png", scale: 3),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        Text(
                          locale.signInNow,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Container(
                          height: 70,
                          margin: EdgeInsets.all(15),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20)),
                          ),
                          child: socialButton(
                              context, 'assets/ic_google.png', locale.google),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ]))),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

TextButton socialButton(BuildContext context, String icon, String text) {
  return TextButton.icon(
    icon: ImageIcon(
      AssetImage(icon),
      color: Theme.of(context).backgroundColor,
      size: 20,
    ),
    onPressed: () async {
      await _handleSignIn(context);
      Navigator.pushNamed(context, PageRoutes.addAddress);
    },
    label: Text(
      text,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: Theme.of(context).backgroundColor),
    ),
  );
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> _handleSignIn(BuildContext context) async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

Future<void> _handleSignOut() => _googleSignIn.disconnect();
