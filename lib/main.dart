import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parkspot/app_config/styles.dart';
import 'package:parkspot/features/auth/login_navigator.dart';
import 'package:parkspot/features/language/bloc/language_cubit.dart';
import 'package:parkspot/generated/l10n.dart';
import 'package:parkspot/routes/routes.dart';
import 'features/map/bloc/map_utils.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  MapUtils.getMarkerPic();
  MobileAds.instance.initialize();
  Firebase.initializeApp();
  runApp(
    Phoenix(
      child: BlocProvider(
        create: (context) => LanguageCubit()..getCurrentLanguage(),
        child: const Parkspot(),
      ),
    ),
  );
}

class Parkspot extends StatefulWidget {
  const Parkspot({Key? key}) : super(key: key);

  @override
  State<Parkspot> createState() => _ParkspotState();
}

class _ParkspotState extends State<Parkspot> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (_, locale) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: locale,
          theme: appTheme,
          home: const LoginNavigator(),
          routes: PageRoutes().routes(),
        );
      },
    );
  }
}
