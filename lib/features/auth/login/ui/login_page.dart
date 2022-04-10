import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkspot/features/language/bloc/language_cubit.dart';

import '../../login_navigator.dart';
import 'login_interactor.dart';
import 'login_ui.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  void initState() {
    super.initState();
    _showLanguageSheet();
  }

  _showLanguageSheet() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () => context.read<LanguageCubit>().openLanguageSheet(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginUI(this);
  }

  @override
  void loginWithGoogle() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }
}
