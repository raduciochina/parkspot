import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/generated/l10n.dart';

class Address {
  String? title;
  String subtitle;
  IconData iconData;
  Address(this.title, this.subtitle, this.iconData);
}

class SearchLocation extends StatelessWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    List<Address> addresses = [
      Address(
          'New York', '1024, Central Park, Haniltone, New York', Icons.history),
      Address('Jordern Park', '1024, Central Park, Haniltone, New York',
          Icons.history),
      Address(
          'Illinois', '1024, Central Park, Haniltone, New York', Icons.history),
      Address(locale.home, 'M141, NY Food Center, Williamson st.',
          Icons.home_outlined),
      Address(locale.office, 'B1140, City Center, Hemiltone st.',
          Icons.work_outline),
      Address(locale.other, '1024, Cnetral Park, Hemiltone, New York',
          Icons.location_on_outlined),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/ic_back.png',
                      scale: 3.2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: VerticalDivider(
                      width: 7,
                      color: primaryColor,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.grey[500]),
                      decoration: InputDecoration(
                        // isDense: true,
                        border: InputBorder.none,
                        hintText: locale.searchLocation,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 13, color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/ic_search.png',
                    scale: 3.2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 10,
                color: Colors.grey[500],
              ),
            ),
            FadedSlideAnimation(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    //horizontalTitleGap: 0,
                    leading: Icon(
                      addresses[index].iconData,
                      color: primaryColor,
                      size: 20,
                    ),
                    title: Text(
                      addresses[index].title!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13),
                    ),
                    subtitle: Text(
                      addresses[index].subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13, color: Colors.grey[300]),
                    ),
                  );
                },
              ),
              beginOffset: const Offset(0.4, 0),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ],
        ),
      ),
    );
  }
}
