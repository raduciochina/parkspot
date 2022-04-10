import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/assets/assets.dart';
import 'package:parkspot/features/app_navigation/ui/app_navigation.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/generated/l10n.dart';

class SpotBooked extends StatelessWidget {
  const SpotBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                'CLOSE',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Image.asset(
                    'assets/booked.png',
                    scale: 3,
                  ),
                ),
                Text(
                  'Yay !! Booked it.',
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
                    'You\'ve booked parking Spot.',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15, color: iconColor),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          FadedSlideAnimation(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.69,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parking ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'XW15434332',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Vehicle',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Toyota Matrix',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        // Spacer(),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 110,
                                child: Image.asset(Assets.qrCode),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$6.00 (Wallet)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parking Spot',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              Text(
                                'AB-30',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Enter after',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    Text(
                                      '12:30 pm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Mon, Jun 25',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Exit before',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    Text(
                                      '1:30 pm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Mon, Jun 25',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey[500],
                              size: 5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/oncard/ic_spots.png',
                              scale: 2.5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey[500],
                              size: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Parking Spot',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.5, color: Colors.grey[500]),
                        ),
                        Text(
                          'Lawnfield Parks',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '1024, Lawnfield Road, New york',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 13.5, color: Colors.grey[500]),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    FadedScaleAnimation(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AppNavigation(currentIndex: 1)));
                        },
                        child: ColorButton(locale.getDirection.toUpperCase()),
                      ),
                      scaleDuration: const Duration(milliseconds: 600),
                    ),
                  ],
                )),
            beginOffset: const Offset(0, 0.4),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          )
        ],
      ),
    );
  }
}
