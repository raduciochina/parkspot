import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkspot/utils/helper.dart';

import 'map_utils.dart';
import 'order_map_state.dart';

class OrderMapCubit extends Cubit<OrderMapState> {
  OrderMapCubit() : super(const OrderMapState({}, {}));

  void loadMap() async {
    Set<Polyline> polylines = {};
    var polyline = await _getPolyLine();
    Set<Marker> markersSet = {};
    markersSet.addAll(_markers);
    polylines.add(polyline);
    emit(OrderMapState(polylines, markersSet));
  }

  Future<Polyline> _getPolyLine() async {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      width: 3,
      polylineId: id,
      points: await _getPolylineCoordinates(
        const LatLng(37.42796133580664, -122.085749655962),
        const LatLng(37.42796133580664, -122.085749655962),
      ),
    );
    return polyline;
  }

  Future<List<LatLng>> _getPolylineCoordinates(
      LatLng pickupLatLng, LatLng dropLatLng) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(pickupLatLng.latitude, pickupLatLng.longitude),
      PointLatLng(dropLatLng.latitude, dropLatLng.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    Helper.debugPrint(polylineCoordinates);
    return polylineCoordinates;
  }

  final List<Marker> _markers = [
    Marker(
      markerId: const MarkerId('mark1'),
      position: const LatLng(37.42796133580664, -122.085749655962),
      icon: markers.first,
    ),
    Marker(
      markerId: const MarkerId('mark2'),
      position: const LatLng(37.42796133580664, -122.085749655962),
      icon: markers.first,
    ),
  ];
}
