import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/components/entry_field.dart';
import 'package:parkspot/generated/l10n.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            // alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            locale.support,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 22),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              locale.connectUs,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16, color: iconColor),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 6,
                        child: FadedScaleAnimation(
                          child: Image.asset("assets/head_support.png"),
                          scaleDuration: const Duration(milliseconds: 600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FadedSlideAnimation(
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  locale.callUs,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  locale.mailUs,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  locale.writeUs,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  locale.letUsKnow,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 15,
                                          color: Theme.of(context).hintColor),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                EntryFieldR(
                                    locale.phoneNumber + '/' + locale.email,
                                    locale.addContactInfo,
                                    false),
                                EntryFieldR(locale.addYourIssue,
                                    locale.addContactInfo, false)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: FadedScaleAnimation(
                                  child: ColorButton(locale.submit),
                                  scaleDuration:
                                      const Duration(milliseconds: 600),
                                )),
                          )
                        ],
                      ))
                ]),
                beginOffset: const Offset(0, 0.4),
                endOffset: const Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              )
            ],
          ),
        ),
      ),
    );
  }
}
