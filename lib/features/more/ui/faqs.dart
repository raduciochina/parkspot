import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/generated/l10n.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  List isExpanded = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    List questions = [
      locale.howToBookAParking,
      locale.howToAddMoneyInWallet,
      locale.howToChangeLanguage,
      locale.howToChangeLanguage,
      locale.howToLogoutMyAccount,
      locale.howToAddMoneyInWallet,
      locale.howToBookAParking,
      locale.howToChangeLanguage,
      locale.howToLogoutMyAccount,
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.faq,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(letterSpacing: 0, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      locale.howWeWork,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: iconColor, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Expanded(
                  child: FadedScaleAnimation(
                    child: Image.asset(
                      "assets/head_faq.png",
                    ),
                    scaleDuration: const Duration(milliseconds: 600),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FadedSlideAnimation(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(questions[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 15)),
                                  IconButton(
                                      icon: Icon(
                                        isExpanded[index]
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: Colors.grey[400],
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isExpanded[index] =
                                              !isExpanded[index];
                                        });
                                      })
                                ],
                              ),
                              isExpanded[index]
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(locale.lorem,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  color: Colors.grey[600],
                                                  fontSize: 13,
                                                  height: 1.7)),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ));
                    },
                  )),
              beginOffset: const Offset(0, 0.4),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          )
        ],
      ),
    );
  }
}
