import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/generated/l10n.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(locale.myProfile,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(letterSpacing: 0)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(locale.everythingAboutyou,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Theme.of(context).hintColor)),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            FadedScaleAnimation(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 90,
                                child: Image.asset("assets/profiles/img1.png"),
                              ),
                              scaleDuration: const Duration(milliseconds: 600),
                            ),
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 13,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 13,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(150)),
      ),
      body: FadedSlideAnimation(
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.fullName,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey, fontSize: 13.5),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Samantha Smith",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 13.5),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                locale.emailAddress,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey, fontSize: 13.5),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "samantha@mail.com",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 13.5),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                locale.phoneNumber,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey, fontSize: 13.5),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "+1 98 654 3210",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 13.5),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Phoenix.rebirth(context);
                },
                child: Text(
                  locale.logout,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: primaryColor, fontSize: 13.5),
                ),
              ),
            ],
          ),
        ),
        beginOffset: const Offset(0.4, 0),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
