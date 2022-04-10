import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/features/ad/ui/banner_ad.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/components/entry_field.dart';
import 'package:parkspot/generated/l10n.dart';

import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;

  const RegistrationUI(this.registrationInteractor, {Key? key})
      : super(key: key);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: theme.scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        locale.register,
                        style:
                            theme.textTheme.bodyText1!.copyWith(fontSize: 20),
                      ),
                      Text(
                        locale.inLessThanAmin,
                        style: theme.textTheme.bodyText2!
                            .copyWith(fontSize: 14, color: theme.hintColor),
                      )
                    ],
                  ),
                  const SizedBox(width: 36),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 44.0),
                      child: FadedScaleAnimation(
                        child: Image.asset("assets/img_signin.png"),
                        scaleDuration: const Duration(milliseconds: 600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  EntryField(
                    label: locale.fullName,
                    hint: locale.enterFullName,
                  ),
                  EntryField(
                    label: locale.emailAddress,
                    hint: locale.enterEmailAddress,
                  ),
                  EntryField(
                    label: locale.phoneNumber,
                    hint: locale.enterMobileNumber,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(locale.wellSendCode,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText1!
                          .copyWith(fontSize: 14, color: theme.hintColor)),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Verification()));
                      widget.registrationInteractor
                          .register('phoneNumber', 'name', 'email');
                    },
                    child: FadedScaleAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ColorButton(locale.continuee),
                      ),
                      scaleDuration: const Duration(milliseconds: 600),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
            const CustomBannerAd(),
          ],
        ),
      ),
    );
  }
}
