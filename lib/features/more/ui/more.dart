import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/assets/assets.dart';
import 'package:parkspot/features/language/bloc/language_cubit.dart';
import 'package:parkspot/generated/l10n.dart';
import 'package:parkspot/routes/routes.dart';

class MoreItems {
  final String image;
  final String? title;
  final String? subtitle;
  final String? pageRoute;

  MoreItems(this.image, this.title, this.subtitle, this.pageRoute);
}

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    var theme = Theme.of(context);
    List<MoreItems> _moreItems = [
      MoreItems(Assets.vehicle, locale.myVehicle, locale.addVehicleinfo,
          PageRoutes.myVehicles),
      MoreItems(Assets.address, locale.myAddresses, locale.presavedAddress,
          PageRoutes.manageAddress),
      MoreItems(Assets.support, locale.support, locale.connectUsFor,
          PageRoutes.support),
      MoreItems(Assets.privacy, locale.privacyPolicy, locale.knowPrivacy,
          PageRoutes.privacyPolicy),
      MoreItems(
          Assets.language, locale.changeLanguage, locale.setYourlanguage, null),
      MoreItems(
          Assets.faqs, locale.faq, locale.getYouranswers, PageRoutes.faqs),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        title: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5),
          child: Text(
            locale.account + '\n',
            style: theme.textTheme.subtitle1!.copyWith(fontSize: 17),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.myProfile);
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Samantha Smith',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headline5),
                            Text(
                              locale.myProfile,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.11,
                                fontWeight: FontWeight.w500,
                                color: iconColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(50),
                          child: FadedScaleAnimation(
                            child: Image.asset(
                              'assets/profiles/img1.png',
                              scale: 2,
                            ),
                            scaleDuration: const Duration(milliseconds: 600),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.wallet);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    horizontalTitleGap: 0,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 17),
                    leading: FadedScaleAnimation(
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: theme.backgroundColor,
                        size: 23,
                      ),
                      scaleDuration: const Duration(milliseconds: 600),
                    ),
                    title: Text(
                      locale.wallet,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        locale.quickPayments,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '\$159.50    ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _moreItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          horizontalTitleGap: 0,
                          // dense: true,
                          onTap: () {
                            var pageRoute = _moreItems[index].pageRoute;
                            if (pageRoute != null) {
                              Navigator.pushNamed(context, pageRoute);
                            } else {
                              context
                                  .read<LanguageCubit>()
                                  .openLanguageSheet(context);
                            }
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          leading: FadedScaleAnimation(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Image.asset(
                                _moreItems[index].image,
                                scale: 3,
                              ),
                            ),
                            scaleDuration: const Duration(milliseconds: 600),
                          ),
                          title: Text(
                            _moreItems[index].title!,
                            style: theme.textTheme.subtitle2,
                          ),
                          subtitle: Text(
                            _moreItems[index].subtitle!,
                            style: theme.textTheme.caption!
                                .copyWith(color: Theme.of(context).hintColor),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
