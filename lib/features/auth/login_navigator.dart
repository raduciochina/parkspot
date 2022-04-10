import 'package:flutter/material.dart';
import 'package:parkspot/features/auth/verification/ui/verifiaction_page.dart';
import 'package:parkspot/routes/routes.dart';

import 'login/ui/login_page.dart';
import 'register/ui/registration_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  // static const String loginRoot = 'login/language';
  static const String loginPage = 'login/login';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
}

class LoginNavigator extends StatelessWidget {
  const LoginNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: LoginRoutes.loginPage,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            // case LoginRoutes.loginRoot:
            //  builder = (BuildContext _) => Settings(true);
            //   break;
            case LoginRoutes.loginPage:
              builder = (BuildContext _) => const LoginPage();
              break;
            case LoginRoutes.registration:
              builder = (BuildContext _) =>
                  RegistrationPage(settings.arguments as String?);
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage(() =>
                  Navigator.popAndPushNamed(context, PageRoutes.appNavigation));
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
