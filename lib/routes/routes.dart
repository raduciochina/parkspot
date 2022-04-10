import 'package:flutter/material.dart';
import 'package:parkspot/features/address/ui/add_address.dart';
import 'package:parkspot/features/address/ui/manage_address.dart';
import 'package:parkspot/features/app_navigation/ui/app_navigation.dart';
import 'package:parkspot/features/more/ui/faqs.dart';
import 'package:parkspot/features/more/ui/privacy_policy.dart';
import 'package:parkspot/features/more/ui/support.dart';
import 'package:parkspot/features/parking/ui/book_spot.dart';
import 'package:parkspot/features/profile/ui/my_profile.dart';
import 'package:parkspot/features/vehicle/ui/add_vehicle.dart';
import 'package:parkspot/features/vehicle/ui/my_vehicles.dart';
import 'package:parkspot/features/wallet/ui/wallet.dart';

class PageRoutes {
  static const String appNavigation = "appNavigation";
  static const String addAddress = "addAddress";
  static const String addVehicle = "addVehicle";
  static const String faqs = "faqs";
  static const String manageAddress = "manageAddress";
  static const String myProfile = "myProfile";
  static const String myVehicles = "myVehicles";
  static const String privacyPolicy = "privacyPolicy";
  static const String support = "support";
  static const String wallet = "wallet";
  static const String bookSpot = "bookSpot";

  Map<String, WidgetBuilder> routes() {
    return {
      appNavigation: (context) => const AppNavigation(),
      addAddress: (context) => const AddAddress(),
      addVehicle: (context) => const AddVehicle(),
      faqs: (context) => const Faqs(),
      manageAddress: (context) => const ManageAddress(),
      myProfile: (context) => const MyProfile(),
      myVehicles: (context) => const MyVehicles(),
      privacyPolicy: (context) => const PrivacyPolicy(),
      support: (context) => const Support(),
      wallet: (context) => const Wallet(),
      bookSpot: (context) => const BookSpot(),
    };
  }
}
