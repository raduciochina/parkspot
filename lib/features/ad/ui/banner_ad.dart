import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomBannerAd extends StatefulWidget {
  const CustomBannerAd({Key? key}) : super(key: key);

  @override
  _CustomBannerAdState createState() => _CustomBannerAdState();
}

class _CustomBannerAdState extends State<CustomBannerAd> {
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      _print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          _print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          _print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => _print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => _print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  void _print(String text) {
    if (kDebugMode) {
      print(text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!_loadingAnchoredBanner) {
        _loadingAnchoredBanner = true;
        _createAnchoredBanner(context);
      }
      if (_anchoredBanner != null) {
        return SizedBox(
          width: _anchoredBanner!.size.width.toDouble(),
          height: _anchoredBanner!.size.height.toDouble(),
          child: AdWidget(ad: _anchoredBanner!),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
