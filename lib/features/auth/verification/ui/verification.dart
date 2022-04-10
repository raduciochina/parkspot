import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/components/entry_field.dart';
import 'package:parkspot/generated/l10n.dart';

import 'verification_interator.dart';

class Verification extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  const Verification(this.verificationInteractor, {Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
    widget.verificationInteractor.verifyNumber();
  }

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      locale.verification,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      locale.inLessThanAmin,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14, color: Theme.of(context).hintColor),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: FadedScaleAnimation(
                    child: Image.asset("assets/img_verification.png"),
                    scaleDuration: const Duration(milliseconds: 600),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  locale.enterVerificationCodeWeveSent,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14, color: Theme.of(context).hintColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                EntryField(hint: locale.enter6digit, label: locale.enterCode),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    widget.verificationInteractor.verificationDone();
                  },
                  child: FadedScaleAnimation(
                    child: ColorButton(locale.getStarted),
                    scaleDuration: const Duration(milliseconds: 600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
