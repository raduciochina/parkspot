import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/assets/assets.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/parking/ui/spot_booked.dart';
import 'package:parkspot/features/vehicle/ui/my_vehicles.dart';
import 'package:parkspot/generated/l10n.dart';

class SelectHour {
  String title;
  String subtitle;
  SelectHour(this.title, this.subtitle);
}

class SelectPayment {
  String? title;
  String subtitle;
  String img;
  SelectPayment(this.title, this.subtitle, this.img);
}

class BookSpot extends StatefulWidget {
  const BookSpot({Key? key}) : super(key: key);

  @override
  _BookSpotState createState() => _BookSpotState();
}

class _BookSpotState extends State<BookSpot> {
  int timeIndex = 0;

  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    List<SelectHour> time = [
      SelectHour('30 ${locale.min}', '\$ 3.00'),
      SelectHour('1 ${locale.hours}', '\$ 6.00'),
      SelectHour('2 ${locale.hours}', '\$ 9.00'),
      SelectHour('4 ${locale.hours}', '\$ 12.00'),
    ];
    List<SelectPayment> payments = [
      SelectPayment(locale.wallet, '\$ 0.00', Assets.wallet),
      SelectPayment(locale.payOnSpot, '\$ 0.30', Assets.money),
      SelectPayment(locale.creditCard, '\$ 0.50', Assets.debitCard),
      SelectPayment(locale.paypal, '\$ 1.00', Assets.paypal),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Lawnfield Parks',
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
                        '1024, Lawnfield Road, New york',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 15,
                            color: iconColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          FadedSlideAnimation(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        locale.selectVehicle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13.5, color: Colors.grey[500]),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyVehicles()));
                        },
                        child: Text(
                          locale.change,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 13.5, color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), color: cardbg),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Toyota Matrix',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 13),
                            ),
                            Text(
                              '${locale.hatchback} | NYC55142',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 10,
                                      color: Theme.of(context).hintColor),
                            )
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          Assets.myCar1,
                          scale: 4,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        locale.selectHours,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13.5, color: Colors.grey[500]),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: primaryColor,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${locale.now} - 12:00 ${locale.pm}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 13.5, color: primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              timeIndex = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 90,
                            margin: const EdgeInsets.only(
                                right: 10, top: 20, bottom: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    timeIndex == index ? primaryColor : cardbg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(time[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 13.5,
                                            color: timeIndex == index
                                                ? Colors.white
                                                : Colors.black)),
                                Text(
                                  time[index].subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 10,
                                          color: timeIndex == index
                                              ? Colors.grey[300]
                                              : Colors.grey),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    locale.paymentMode,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13.5, color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 75, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            paymentIndex = index;
                          });
                        },
                        child: FadedScaleAnimation(
                          child: Container(
                            width: 120,
                            margin: const EdgeInsetsDirectional.only(
                                end: 10, top: 5, bottom: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: paymentIndex == index
                                    ? primaryColor
                                    : cardbg),
                            child: Row(
                              children: [
                                Image.asset(
                                  payments[index].img,
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(payments[index].title!,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 13.5,
                                                  color: paymentIndex == index
                                                      ? Colors.white
                                                      : Colors.black)),
                                      Text(
                                        payments[index].subtitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 10,
                                                color: paymentIndex == index
                                                    ? Colors.grey[300]
                                                    : Colors.grey),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          scaleDuration: const Duration(milliseconds: 600),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SpotBooked()));
                      },
                      child: FadedScaleAnimation(
                        child:
                            ColorButton('${locale.pay.toUpperCase()} \$6.00'),
                        scaleDuration: const Duration(milliseconds: 600),
                      ))
                ],
              ),
            ),
            beginOffset: const Offset(0, 0.4),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          )
        ],
      ),
    );
  }
}
