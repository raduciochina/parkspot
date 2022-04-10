// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter Phone Number`
  String get enterMobileNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue with`
  String get orContinueWith {
    return Intl.message(
      'Or Continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Back to sign in`
  String get backToSignIn {
    return Intl.message(
      'Back to sign in',
      name: 'backToSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in now`
  String get signInNow {
    return Intl.message(
      'Sign in now',
      name: 'signInNow',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get phoneCode {
    return Intl.message(
      'Enter Code',
      name: 'phoneCode',
      desc: '',
      args: [],
    );
  }

  /// `we've sent 6 digit verification code`
  String get enterVerificationCodeWeveSent {
    return Intl.message(
      'we\'ve sent 6 digit verification code',
      name: 'enterVerificationCodeWeveSent',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter Code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter 6 digit code`
  String get enter6digit {
    return Intl.message(
      'Enter 6 digit code',
      name: 'enter6digit',
      desc: '',
      args: [],
    );
  }

  /// `in less then a minute`
  String get inLessThanAmin {
    return Intl.message(
      'in less then a minute',
      name: 'inLessThanAmin',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get enterFullName {
    return Intl.message(
      'Enter Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email Address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter Email Address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `We'll send verification code`
  String get wellSendCode {
    return Intl.message(
      'We\'ll send verification code',
      name: 'wellSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Search Location`
  String get searchLocation {
    return Intl.message(
      'Search Location',
      name: 'searchLocation',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get now {
    return Intl.message(
      'Now',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get find {
    return Intl.message(
      'Find',
      name: 'find',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get bookings {
    return Intl.message(
      'Bookings',
      name: 'bookings',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Book Spot`
  String get bookSpot {
    return Intl.message(
      'Book Spot',
      name: 'bookSpot',
      desc: '',
      args: [],
    );
  }

  /// `Spots`
  String get spots {
    return Intl.message(
      'Spots',
      name: 'spots',
      desc: '',
      args: [],
    );
  }

  /// `Working Hours`
  String get workingHours {
    return Intl.message(
      'Working Hours',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Open Now`
  String get openNow {
    return Intl.message(
      'Open Now',
      name: 'openNow',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Facilities`
  String get facilities {
    return Intl.message(
      'Facilities',
      name: 'facilities',
      desc: '',
      args: [],
    );
  }

  /// `Covered Roof`
  String get coveredRoof {
    return Intl.message(
      'Covered Roof',
      name: 'coveredRoof',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Overnight`
  String get overnight {
    return Intl.message(
      'Overnight',
      name: 'overnight',
      desc: '',
      args: [],
    );
  }

  /// `Charging`
  String get charging {
    return Intl.message(
      'Charging',
      name: 'charging',
      desc: '',
      args: [],
    );
  }

  /// `Disabled Parking`
  String get disabledParking {
    return Intl.message(
      'Disabled Parking',
      name: 'disabledParking',
      desc: '',
      args: [],
    );
  }

  /// `Select Vehicle`
  String get selectVehicle {
    return Intl.message(
      'Select Vehicle',
      name: 'selectVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Select hours`
  String get selectHours {
    return Intl.message(
      'Select hours',
      name: 'selectHours',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message(
      'min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Payment Mode`
  String get paymentMode {
    return Intl.message(
      'Payment Mode',
      name: 'paymentMode',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Pay on Spot`
  String get payOnSpot {
    return Intl.message(
      'Pay on Spot',
      name: 'payOnSpot',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `PayPal`
  String get paypal {
    return Intl.message(
      'PayPal',
      name: 'paypal',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Yay !! Booked it.`
  String get yayBooked {
    return Intl.message(
      'Yay !! Booked it.',
      name: 'yayBooked',
      desc: '',
      args: [],
    );
  }

  /// `You've booked parking Spot.`
  String get youveBooked {
    return Intl.message(
      'You\'ve booked parking Spot.',
      name: 'youveBooked',
      desc: '',
      args: [],
    );
  }

  /// `Parking ID`
  String get parkingId {
    return Intl.message(
      'Parking ID',
      name: 'parkingId',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle`
  String get vehicle {
    return Intl.message(
      'Vehicle',
      name: 'vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Parking Spot`
  String get parkingSpot {
    return Intl.message(
      'Parking Spot',
      name: 'parkingSpot',
      desc: '',
      args: [],
    );
  }

  /// `Enter after`
  String get enterAfter {
    return Intl.message(
      'Enter after',
      name: 'enterAfter',
      desc: '',
      args: [],
    );
  }

  /// `Exit before`
  String get exitBefore {
    return Intl.message(
      'Exit before',
      name: 'exitBefore',
      desc: '',
      args: [],
    );
  }

  /// `Get Direction`
  String get getDirection {
    return Intl.message(
      'Get Direction',
      name: 'getDirection',
      desc: '',
      args: [],
    );
  }

  /// `My Bookings`
  String get myBookings {
    return Intl.message(
      'My Bookings',
      name: 'myBookings',
      desc: '',
      args: [],
    );
  }

  /// `Parking time ends in`
  String get parkingTimeEnds {
    return Intl.message(
      'Parking time ends in',
      name: 'parkingTimeEnds',
      desc: '',
      args: [],
    );
  }

  /// `Add Time`
  String get addTime {
    return Intl.message(
      'Add Time',
      name: 'addTime',
      desc: '',
      args: [],
    );
  }

  /// `Re-Park`
  String get repark {
    return Intl.message(
      'Re-Park',
      name: 'repark',
      desc: '',
      args: [],
    );
  }

  /// `Parked on`
  String get parkedOn {
    return Intl.message(
      'Parked on',
      name: 'parkedOn',
      desc: '',
      args: [],
    );
  }

  /// `Quick Payments`
  String get quickPayments {
    return Intl.message(
      'Quick Payments',
      name: 'quickPayments',
      desc: '',
      args: [],
    );
  }

  /// `My Vehicle`
  String get myVehicle {
    return Intl.message(
      'My Vehicle',
      name: 'myVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Hatchback`
  String get hatchback {
    return Intl.message(
      'Hatchback',
      name: 'hatchback',
      desc: '',
      args: [],
    );
  }

  /// `Manage Address`
  String get manageAddress {
    return Intl.message(
      'Manage Address',
      name: 'manageAddress',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faq {
    return Intl.message(
      'FAQs',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Preferred Language`
  String get preferredLanguage {
    return Intl.message(
      'Preferred Language',
      name: 'preferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Add Vehicle information`
  String get addVehicleinfo {
    return Intl.message(
      'Add Vehicle information',
      name: 'addVehicleinfo',
      desc: '',
      args: [],
    );
  }

  /// `Pre Saved Addresses`
  String get presavedAddress {
    return Intl.message(
      'Pre Saved Addresses',
      name: 'presavedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Connect us for issue &`
  String get connectUsFor {
    return Intl.message(
      'Connect us for issue &',
      name: 'connectUsFor',
      desc: '',
      args: [],
    );
  }

  /// `Know Our Privacy Policies`
  String get knowPrivacy {
    return Intl.message(
      'Know Our Privacy Policies',
      name: 'knowPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Set your Preferred language`
  String get setYourlanguage {
    return Intl.message(
      'Set your Preferred language',
      name: 'setYourlanguage',
      desc: '',
      args: [],
    );
  }

  /// `Get your questions answers`
  String get getYouranswers {
    return Intl.message(
      'Get your questions answers',
      name: 'getYouranswers',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Everything about you`
  String get everythingAboutyou {
    return Intl.message(
      'Everything about you',
      name: 'everythingAboutyou',
      desc: '',
      args: [],
    );
  }

  /// `Write your message`
  String get writeyourMessage {
    return Intl.message(
      'Write your message',
      name: 'writeyourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Available Balance`
  String get availableBalance {
    return Intl.message(
      'Available Balance',
      name: 'availableBalance',
      desc: '',
      args: [],
    );
  }

  /// `Add Money`
  String get addMoney {
    return Intl.message(
      'Add Money',
      name: 'addMoney',
      desc: '',
      args: [],
    );
  }

  /// `To Bank`
  String get sendToBank {
    return Intl.message(
      'To Bank',
      name: 'sendToBank',
      desc: '',
      args: [],
    );
  }

  /// `Paid for Parking`
  String get paidForParking {
    return Intl.message(
      'Paid for Parking',
      name: 'paidForParking',
      desc: '',
      args: [],
    );
  }

  /// `Added to Wallet`
  String get addedToWallet {
    return Intl.message(
      'Added to Wallet',
      name: 'addedToWallet',
      desc: '',
      args: [],
    );
  }

  /// `Received from Ride Taker`
  String get receivedFrom {
    return Intl.message(
      'Received from Ride Taker',
      name: 'receivedFrom',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles you own`
  String get vehiclesYouOwn {
    return Intl.message(
      'Vehicles you own',
      name: 'vehiclesYouOwn',
      desc: '',
      args: [],
    );
  }

  /// `Add New Vehicle`
  String get addNewWehicle {
    return Intl.message(
      'Add New Vehicle',
      name: 'addNewWehicle',
      desc: '',
      args: [],
    );
  }

  /// `Add Vehicle`
  String get addVehicle {
    return Intl.message(
      'Add Vehicle',
      name: 'addVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Type`
  String get vehicleType {
    return Intl.message(
      'Vehicle Type',
      name: 'vehicleType',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Name`
  String get vehicleName {
    return Intl.message(
      'Vehicle Name',
      name: 'vehicleName',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Reg. Number`
  String get vehicleReg {
    return Intl.message(
      'Vehicle Reg. Number',
      name: 'vehicleReg',
      desc: '',
      args: [],
    );
  }

  /// `Add Landmark`
  String get addLandmark {
    return Intl.message(
      'Add Landmark',
      name: 'addLandmark',
      desc: '',
      args: [],
    );
  }

  /// `Write Address Landmark`
  String get writeAddressLandmark {
    return Intl.message(
      'Write Address Landmark',
      name: 'writeAddressLandmark',
      desc: '',
      args: [],
    );
  }

  /// `Connect Us`
  String get connectUs {
    return Intl.message(
      'Connect Us',
      name: 'connectUs',
      desc: '',
      args: [],
    );
  }

  /// `Write Us`
  String get writeUs {
    return Intl.message(
      'Write Us',
      name: 'writeUs',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Save Address`
  String get saveAddress {
    return Intl.message(
      'Save Address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add your issue/feedback`
  String get addYourIssue {
    return Intl.message(
      'Add your issue/feedback',
      name: 'addYourIssue',
      desc: '',
      args: [],
    );
  }

  /// `Add Contact info`
  String get addContactInfo {
    return Intl.message(
      'Add Contact info',
      name: 'addContactInfo',
      desc: '',
      args: [],
    );
  }

  /// `How we work`
  String get howWeWork {
    return Intl.message(
      'How we work',
      name: 'howWeWork',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message(
      'Terms of use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Select Preferred Language`
  String get selectPreferredLanguage {
    return Intl.message(
      'Select Preferred Language',
      name: 'selectPreferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get enterName {
    return Intl.message(
      'Enter Name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message(
      'Enter Code',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Set Location`
  String get setLocation {
    return Intl.message(
      'Set Location',
      name: 'setLocation',
      desc: '',
      args: [],
    );
  }

  /// `View profile`
  String get viewProfile {
    return Intl.message(
      'View profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Saved Addresses`
  String get savedAddresses {
    return Intl.message(
      'Saved Addresses',
      name: 'savedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Add Location`
  String get addNewLocation {
    return Intl.message(
      'Add Location',
      name: 'addNewLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Address Type`
  String get selectAddressType {
    return Intl.message(
      'Select Address Type',
      name: 'selectAddressType',
      desc: '',
      args: [],
    );
  }

  /// `Enter Address Details`
  String get enterAddressDetails {
    return Intl.message(
      'Enter Address Details',
      name: 'enterAddressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Call Us`
  String get callUs {
    return Intl.message(
      'Call Us',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `Mail Us`
  String get mailUs {
    return Intl.message(
      'Mail Us',
      name: 'mailUs',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Quick Payments`
  String get quickPayment {
    return Intl.message(
      'Quick Payments',
      name: 'quickPayment',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get myAddresses {
    return Intl.message(
      'My Addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contactNumber {
    return Intl.message(
      'Contact Number',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }

  /// `Write your Number`
  String get writeYourNumber {
    return Intl.message(
      'Write your Number',
      name: 'writeYourNumber',
      desc: '',
      args: [],
    );
  }

  /// `How to book a Parking Spot?`
  String get howToBookAParking {
    return Intl.message(
      'How to book a Parking Spot?',
      name: 'howToBookAParking',
      desc: '',
      args: [],
    );
  }

  /// `How to add money in wallet`
  String get howToAddMoneyInWallet {
    return Intl.message(
      'How to add money in wallet',
      name: 'howToAddMoneyInWallet',
      desc: '',
      args: [],
    );
  }

  /// `How to change Language`
  String get howToChangeLanguage {
    return Intl.message(
      'How to change Language',
      name: 'howToChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `How to logout my Account?`
  String get howToLogoutMyAccount {
    return Intl.message(
      'How to logout my Account?',
      name: 'howToLogoutMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Let us know your query`
  String get letUsKnow {
    return Intl.message(
      'Let us know your query',
      name: 'letUsKnow',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `am`
  String get am {
    return Intl.message(
      'am',
      name: 'am',
      desc: '',
      args: [],
    );
  }

  /// `pm`
  String get pm {
    return Intl.message(
      'pm',
      name: 'pm',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sun {
    return Intl.message(
      'Sun',
      name: 'sun',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get mon {
    return Intl.message(
      'Mon',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tue {
    return Intl.message(
      'Tue',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wed {
    return Intl.message(
      'Wed',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `Thr`
  String get thr {
    return Intl.message(
      'Thr',
      name: 'thr',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fri {
    return Intl.message(
      'Fri',
      name: 'fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get sat {
    return Intl.message(
      'Sat',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// `Jun`
  String get jun {
    return Intl.message(
      'Jun',
      name: 'jun',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.`
  String get lorem {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      name: 'lorem',
      desc: '',
      args: [],
    );
  }

  /// `Indonesian`
  String get indonesian {
    return Intl.message(
      'Indonesian',
      name: 'indonesian',
      desc: '',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message(
      'Italian',
      name: 'italian',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `Swahili`
  String get swahili {
    return Intl.message(
      'Swahili',
      name: 'swahili',
      desc: '',
      args: [],
    );
  }

  /// `Turkish`
  String get turkish {
    return Intl.message(
      'Turkish',
      name: 'turkish',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
