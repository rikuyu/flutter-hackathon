import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/event.dart';

class EventLocationPage extends StatelessWidget {
  EventLocationPage({Key? key, required this.event}) : super(key: key);

  final Completer<GoogleMapController> _mapController = Completer();

  final Event event;

  @override
  Widget build(BuildContext context) {
    final eventLocation = LatLng(
        double.parse(event.lat.toString()), double.parse(event.lng.toString()));

    Set<Marker> _markers = <Marker>{}..add(Marker(
        markerId: MarkerId(event.eventId.toString()),
        infoWindow: InfoWindow(title: event.title),
        icon: BitmapDescriptor.defaultMarkerWithHue(0),
        position: eventLocation));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "イベント開催地",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                  mapType: MapType.normal,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: eventLocation,
                    zoom: 12,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController.complete(controller);
                  },
                  mapToolbarEnabled: false,
                  myLocationEnabled: false),
            ],
          ),
        ));
  }
}
