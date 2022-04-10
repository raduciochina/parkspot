import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/assets/assets.dart';
import 'package:parkspot/features/vehicle/ui/add_vehicle.dart';
import 'package:parkspot/generated/l10n.dart';

class MyVehicles extends StatefulWidget {
  const MyVehicles({Key? key}) : super(key: key);

  @override
  _MyVehiclesState createState() => _MyVehiclesState();
}

class _MyVehiclesState extends State<MyVehicles> {
  List title = ["Toyota Matrix", "RNX Dulex"];

  List img = [Assets.myCar1, Assets.myCar2];

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        locale.myVehicle,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(letterSpacing: 0),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          locale.vehiclesYouOwn,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: iconColor, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Expanded(
                    child: FadedScaleAnimation(
                      child: Image.asset(
                        "assets/head_myvehicle.png",
                        // scale: 3.5,
                      ),
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
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddVehicle()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                locale.addNewWehicle.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 14,
                                        letterSpacing: 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 16, bottom: 16),
                      trailing: Image.asset(img[index]),
                      //minVerticalPadding: 10,
                      title: Row(
                        children: [
                          Text(
                            title[index],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      subtitle: Text("${locale.hatchback} | NYC55142",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 13,
                                  color: Theme.of(context).hintColor,
                                  height: 2)),
                    );
                  },
                ),
              )
            ]),
            beginOffset: const Offset(0, 0.4),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ],
      ),
    );
  }
}
