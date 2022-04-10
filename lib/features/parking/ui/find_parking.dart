import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/map/bloc/map_utils.dart';
import 'package:parkspot/features/map/bloc/order_map_cubit.dart';
import 'package:parkspot/features/map/bloc/order_map_state.dart';
import 'package:parkspot/features/parking/ui/filter.dart';
import 'package:parkspot/features/parking/ui/search_location.dart';
import 'package:parkspot/generated/l10n.dart';
import 'package:parkspot/utils/helper.dart';

import 'book_spot.dart';

class FindParking extends StatelessWidget {
  const FindParking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapCubit>(
      create: (context) => OrderMapCubit()..loadMap(),
      child: const FindParkingBody(),
    );
  }
}

class FindParkingBody extends StatefulWidget {
  const FindParkingBody({Key? key}) : super(key: key);

  @override
  _FindParkingBodyState createState() => _FindParkingBodyState();
}

class _FindParkingBodyState extends State<FindParkingBody> {
  int? timeSelected = 0;
  bool expandInfo = false;
  bool locationSelected = false;
  final Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
  }

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
                onTap: (latLng) {
                  bookingSpotDetail(context, locale);
                },
                // polylines: state.polylines,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                markers: _markers,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) async {
                  _mapController.complete(controller);
                  mapStyleController = controller;
                  mapStyleController!.setMapStyle(mapStyle);
                  setState(() {
                    _markers.add(
                      Marker(
                          markerId: const MarkerId('mark1'),
                          position: const LatLng(
                              37.42796133580664, -122.085749655962),
                          icon: markers.first,
                          onTap: () {
                            bookingSpotDetail(context, locale);
                          }),
                    );
                    _markers.add(
                      Marker(
                          markerId: const MarkerId('mark2'),
                          position: const LatLng(
                              37.42496133180663, -122.081743655960),
                          icon: markers[1],
                          onTap: () {
                            bookingSpotDetail(context, locale);
                          }),
                    );
                    _markers.add(
                      Marker(
                          markerId: const MarkerId('mark3'),
                          position: const LatLng(
                              37.42196183580660, -122.089743655967),
                          icon: markers[0],
                          onTap: () {
                            bookingSpotDetail(context, locale);
                          }),
                    );
                  });
                },
              );
            }),
          ),
          FadedSlideAnimation(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/ic_search.png',
                            scale: 3.2,
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  locationSelected = true;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchLocation()));
                              },
                              readOnly: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.grey[500]),
                              decoration: InputDecoration(
                                // isDense: true,
                                border: InputBorder.none,
                                hintText: locationSelected
                                    ? 'New York'
                                    : locale.searchLocation,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        color: locationSelected
                                            ? Colors.black
                                            : Colors.grey[500]),
                              ),
                            ),
                          ),
                          locationSelected
                              ? Image.asset(
                                  'assets/icons/ic_close.png',
                                  scale: 3.2,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Filter()));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Image.asset(
                          'assets/icons/ic_filter.png',
                          scale: 2.8,
                        )),
                  )
                ],
              ),
            ),
            beginOffset: const Offset(0, -0.4),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          !locationSelected
              ? Positioned(
                  left: 100,
                  bottom: 40,
                  child: FadedScaleAnimation(
                    child: GestureDetector(
                      onTap: () {
                        bottomTimeSheet(context, locale);
                      },
                      child: Container(
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: primaryColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('${locale.now} - 12:00 ${locale.pm}')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future bookingSpotDetail(BuildContext context, S? locale) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return GestureDetector(
                onTap: () {
                  setModalState(() {
                    expandInfo = !expandInfo;
                  });
                },
                child: FadedSlideAnimation(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: expandInfo ? 519 : 210,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Wrap(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 150),
                          child: Divider(
                            thickness: 5,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Lawnfield Parks',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                          subtitle: Text(
                            '1024, Lawnfield Road, New York',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 11,
                                    color: Theme.of(context).hintColor),
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/img1.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/oncard/ic_distance.png',
                                scale: 3.2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  '750m',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13.5,
                                      ),
                                ),
                              ),
                              Image.asset(
                                'assets/oncard/ic_spots.png',
                                scale: 3.2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  '28 ${locale!.spots}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13.5,
                                      ),
                                ),
                              ),
                              Image.asset(
                                'assets/oncard/ic_rate.png',
                                scale: 3.2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  '\$3.00/hr',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        expandInfo
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          locale.workingHours,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 13.5,
                                                  color: Colors.grey[600]),
                                        ),
                                        const Spacer(),
                                        Text(
                                          locale.openNow,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 13.5,
                                                  color: primaryColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '08:00 ${locale.am} - 11:00  ${locale.pm}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 12,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      locale.info,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[600]),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      locale.lorem,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 12,
                                              color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      locale.facilities,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[600]),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Wrap(
                                      children: [
                                        TextBox(locale.coveredRoof),
                                        TextBox(locale.camera),
                                        TextBox(locale.overnight),
                                        TextBox(locale.charging),
                                        TextBox(locale.disabledParking),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BookSpot()));
                              },
                              child: FadedScaleAnimation(
                                child:
                                    ColorButton(locale.bookSpot.toUpperCase()),
                                scaleDuration:
                                    const Duration(milliseconds: 600),
                              )),
                        )
                      ],
                    ),
                  ),
                  beginOffset: const Offset(0, 0.4),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ));
          });
        });
  }

  Future bottomTimeSheet(BuildContext context, S? locale) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return SizedBox(
              height: 250,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      children: [
                        Text(
                          "Select Time",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                          '${locale!.now} - 12:00 ${locale.pm}',
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
                              hintText: "16-06-2021",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 13.5, color: Colors.black),
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
                              hintText: "5:00 p.m.",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 13.5, color: Colors.black),
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
}

class TextBox extends StatefulWidget {
  final String? title;

  const TextBox(this.title, {Key? key}) : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5, top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        decoration: BoxDecoration(
            color: isSelected ? primaryColor : cardbg,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          widget.title!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 13.5, color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
