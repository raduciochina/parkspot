import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String apiKey = 'AIzaSyC4xQ0n-BwL_gODzdOTI6eqmzABT7XtF9Y';
List<BitmapDescriptor> markers = [];
String? mapStyle;
List<String> stops = [
  'Old Sawmill',
  'Seveehill Dr',
  'Trep Road',
  'Old Sawmill',
  'Seveehill Dr',
];

const CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

class MapUtils {
  static getMarkerPic() async {
    // var desc = await BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(devicePixelRatio: 5), Assets.icPin)
    //     .then((value) => icon = value);
    markers.add(
        await createBitmapDescriptorFromImage('assets/map_pin.png', '\$2'));
    markers.add(
        await createBitmapDescriptorFromImage('assets/pin_direction.png', ''));
    // markerss.add(await createBitmapDescriptorFromImage('assets/drop.png',''));
  }

  static Future<BitmapDescriptor> createBitmapDescriptorFromImage(
      String imagee, String alphabet) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas c = Canvas(recorder);

    double imageWidth = 70;
    double imageHeight = 70;

    // AssetBundle bundle = DefaultAssetBundle.of(context);
    ui.Image myImage = await load(imagee);
    /*await Util.getUiImage(bundle, "assets/images/image.png", imageWidth, imageHeight)*/

    paintImage(
        canvas: c, // c is the Canvas object in above code examples.
        image: myImage,
        rect: Rect.fromLTWH(0, 0, imageWidth, imageHeight * 1.1));

    TextPainter textPainter = TextPainter(
        text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
            ),
            text: alphabet),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);

    textPainter.layout();

    textPainter.paint(c, const Offset(20, 6));

    final picture = recorder.endRecording();
    final image = await picture.toImage(110, 110);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  static Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
