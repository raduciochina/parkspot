import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkspot/app_config/colors.dart';
import 'package:parkspot/assets/assets.dart';
import 'package:parkspot/features/components/color_button.dart';
import 'package:parkspot/features/components/entry_field.dart';
import 'package:parkspot/generated/l10n.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  int currentIndex = -1;
  String? car = "Hatchback";
  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          locale.addVehicle,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 60),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            locale.vehicleType,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey, fontSize: 13.5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  // isDense: true,
                                  value: car,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.black, fontSize: 13.5),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  items: <String>[
                                    "Hatchback",
                                    "Sedan",
                                    "Lowrider",
                                    "SUV"
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      car = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Image.asset(
                                  Assets.myCar1,
                                  scale: 2.8,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          EntryFieldR(
                              locale.vehicleName, 'Toyota Matrix', false),
                          EntryFieldR(locale.vehicleReg, 'NYC55142', false),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 15),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                      height: 55,
                      child: FadedScaleAnimation(
                        child: const ColorButton('Save'),
                        scaleDuration: const Duration(milliseconds: 600),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
