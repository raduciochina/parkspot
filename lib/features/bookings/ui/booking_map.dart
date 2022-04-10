import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/assets/assets.dart';
import 'package:parkspot/features/app_navigation/ui/app_navigation.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/map/bloc/map_utils.dart';
import 'package:parkspot/features/map/bloc/order_map_cubit.dart';
import 'package:parkspot/features/map/bloc/order_map_state.dart';
import 'package:parkspot/generated/l10n.dart';
import 'package:parkspot/routes/routes.dart';
import 'package:parkspot/utils/helper.dart';

int? timeSelected = 0;

class BookingMap extends StatelessWidget {
  const BookingMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapCubit>(
      create: (context) => OrderMapCubit()..loadMap(),
      child: const BookingMapBody(),
    );
  }
}

class BookingMapBody extends StatefulWidget {
  const BookingMapBody({Key? key}) : super(key: key);

  @override
  _BookingMapBodyState createState() => _BookingMapBodyState();
}

class _BookingMapBodyState extends State<BookingMapBody> {
  bool isExpanded = false;
  final Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<OrderMapCubit, OrderMapState>(
                builder: (context, state) {
              Helper.debugPrint('polyyyy' + state.polylines.toString());
              return GoogleMap(
                // polylines: state.polylines,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) async {
                  _mapController.complete(controller);
                  mapStyleController = controller;
                  mapStyleController!.setMapStyle(mapStyle);
                  setState(() {
                    _markers.add(
                      Marker(
                        markerId: const MarkerId('mark1'),
                        position:
                            const LatLng(37.42796133580664, -122.085749655962),
                        icon: markers.first,
                      ),
                    );
                    _markers.add(
                      Marker(
                        markerId: const MarkerId('mark2'),
                        position:
                            const LatLng(37.42496133180663, -122.081743655960),
                        icon: markers[1],
                      ),
                    );
                    _markers.add(
                      Marker(
                        markerId: const MarkerId('mark3'),
                        position:
                            const LatLng(37.42196183580660, -122.089743655967),
                        icon: markers[2],
                      ),
                    );
                  });
                },
              );
            }),
          ),
          isExpanded
              ? const SizedBox.shrink()
              : FadedSlideAnimation(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/ic_search.png',
                                scale: 3.2,
                              ),
                              const SizedBox(
                                width: 15,
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
                                        .copyWith(
                                            fontSize: 13,
                                            color: Colors.grey[500]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                            height: 47,
                            width: 53,
                            // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Image.asset(
                              'assets/icons/ic_filter.png',
                              scale: 3,
                            ))
                      ],
                    ),
                  ),
                  beginOffset: const Offset(0, -0.4),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
          isExpanded
              ? Positioned(
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: 60,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    child: Container(
                        height: 47,
                        width: 53,
                        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Image.asset(
                          'assets/icons/ic_close.png',
                          scale: 3,
                        )),
                  ),
                )
              : const SizedBox.shrink(),
          isExpanded
              ? const SizedBox.shrink()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: FadedSlideAnimation(
                          child: const BookingBox(),
                          beginOffset: const Offset(0, 0.4),
                          endOffset: const Offset(0, 0),
                          slideCurve: Curves.linearToEaseOut,
                        ),
                      )),
                ),
          isExpanded
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: FadedSlideAnimation(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.692,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height: 161,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 145),
                                    child: Divider(
                                      thickness: 4,
                                      color: Color(0xff17d37e),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20, top: 10),
                                    child: Text(
                                      locale.parkingTimeEnds,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13,
                                              color: Colors.grey[300]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 7),
                                                child: Text(
                                                  '00:20:12 ' + locale.min,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: cardbg,
                                                    size: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Lawnfield Parks',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                            fontSize: 13,
                                                            color: cardbg),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Image.asset(
                                              'assets/pole_light.png',
                                              scale: 4.5,
                                            ),
                                            FadedScaleAnimation(
                                              child: SizedBox(
                                                height: 50,
                                                child:
                                                    Image.asset(Assets.myCar1),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.bookSpot);
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff17d37e),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Center(
                                          child: Text(
                                        locale.addTime.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 2,
                                                color: Colors.white),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  height: MediaQuery.of(context).size.height *
                                          0.69 -
                                      160,
                                  child: ListView(
                                    padding: const EdgeInsets.only(bottom: 60),
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Parking ID',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 13.5,
                                                          color:
                                                              Colors.grey[500]),
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
                                                          fontSize: 13.5,
                                                          color: Colors.black),
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
                                                          color:
                                                              Colors.grey[500]),
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
                                                          fontSize: 13.5,
                                                          color: Colors.black),
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
                                                  child: Image.asset(
                                                      Assets.qrCode),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Payment',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 13.5,
                                                          color:
                                                              Colors.grey[500]),
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
                                                          fontSize: 13.5,
                                                          color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Parking Spot',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 13.5,
                                                          color:
                                                              Colors.grey[500]),
                                                ),
                                                Text(
                                                  'AB-30',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 20,
                                                          color: Colors.black),
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
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
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                      Text(
                                                        '12:30 pm',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                fontSize: 20),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Mon, Jun 25',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                fontSize: 13.5,
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                      Text(
                                                        '1:30 pm',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                fontSize: 20),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Mon, Jun 25',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                fontSize: 13.5,
                                                                color: Colors
                                                                    .grey[500]),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
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
                                                    fontSize: 13.5,
                                                    color: Colors.grey[500]),
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
                                                    fontSize: 13.5,
                                                    color: Colors.grey[500]),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isExpanded = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AppNavigation(
                                                      currentIndex: 1)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: ColorButton(locale.getDirection),
                                    )),
                              ],
                            ),
                          ],
                        )),
                    beginOffset: const Offset(0, 0.4),
                    endOffset: const Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

Future bottomTimeSheet(BuildContext context, S locale) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setModalState) {
          return SizedBox(
            height: 250,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    children: [
                      Text(
                        "Select Time",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 17,
                            color: iconColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            'DONE',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 15,
                                    letterSpacing: 2.5,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: primaryColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${locale.now} - 12:00 ${locale.pm}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const Spacer(),
                      Radio(
                        activeColor: primaryColor,
                        value: 1,
                        groupValue: timeSelected,
                        onChanged: (dynamic value) {
                          setModalState(() {
                            timeSelected = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Later',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Spacer(),
                          Radio(
                            activeColor: primaryColor,
                            value: 2,
                            groupValue: timeSelected,
                            onChanged: (dynamic value) {
                              setModalState(() {
                                timeSelected = value;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            hintText: "Select Date",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 13.5, color: Colors.grey[500]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!)),
                            hintText: "Select Time",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 13.5, color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
      });
}

class BookingBox extends StatelessWidget {
  const BookingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Container(
      height: 145,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 10),
            child: Text(
              locale.parkingTimeEnds,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 13, color: Colors.grey[300]),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Text(
                          '00:20:12 ${locale.min}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: cardbg,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Lawnfield Parks',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13, color: cardbg),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/pole_light.png',
                      scale: 4.5,
                    ),
                    SizedBox(
                      height: 50,
                      child: Image.asset(Assets.myCar1),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.bookSpot);
            },
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Color(0xff17d37e),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                  child: Text(
                locale.addTime.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
