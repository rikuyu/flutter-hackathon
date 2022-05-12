import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/search/search_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/utils/utils.dart';
import '../../domain/entities/event.dart';
import '../utils/utils.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  final Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchViewModelProvider);
    final notifier = ref.read(searchViewModelProvider.notifier);

    final eventSpots = state.events
        .whereType<Event>()
        .toList()
        .map((e) {
          if (e.lat == null ||
              e.lng == null ||
              e.lat!.isEmpty ||
              e.lng!.isEmpty) {
            return null;
          }
          return Marker(
            markerId: MarkerId(e.eventId.toString()),
            infoWindow: InfoWindow(title: e.title),
            icon: BitmapDescriptor.defaultMarkerWithHue(30),
            position: LatLng(
                double.parse(e.lat.toString()), double.parse(e.lng.toString())),
          );
        })
        .whereType<Marker>()
        .toSet();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
                mapType: MapType.normal,
                markers: eventSpots,
                initialCameraPosition: CameraPosition(
                  target: Utils.getPrefecturePrimarySpot(state.prefecture),
                  zoom: 11,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
                mapToolbarEnabled: false,
                myLocationEnabled: false),
            if (state.isLoading)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                      child:
                          CircularProgressIndicator(color: Colors.cyanAccent),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: FloatingActionButton(
          onPressed: () async {
            await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) {
                return AlertDialog(
                    title: const Text("都道府県を選択",
                        style: TextStyle(color: Colors.orange)),
                    content: SizedBox(
                        width: double.maxFinite,
                        child: ListView.builder(
                          itemCount: 47,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                Utils.createPrefectureName(index + 1),
                                style: TextStyle(
                                    color: state.prefecture == index + 1
                                        ? Colors.orange
                                        : Colors.black),
                              ),
                              onTap: () {
                                notifier.setEventPrefecture(index + 1);
                                Navigator.pop(context);
                              },
                            );
                          },
                        )));
              },
            );
            final result = await notifier.getEvents();
            if (result is Success) {
              await moveCameraPosition(result.data);
            }
          },
          child: const Icon(Icons.search_rounded, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> moveCameraPosition(int prefecture) async {
    final place = Utils.getPrefecturePrimarySpot(prefecture);
    final GoogleMapController mapController = await _mapController.future;
    await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: place, zoom: 11)));
  }
}
