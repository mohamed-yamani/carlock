import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:print_color/print_color.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? _controller;

  void _onMapCreated(GoogleMapController controller) {
    // ! check if _controller is null assign it to controller
    _controller ??= controller;
    setState(() {
      _markers.add(const Marker(
        markerId: MarkerId(
          'marker_id_1',
        ),
        position: LatLng(32.8821743, -6.897816),
        infoWindow: InfoWindow(
          title: '1337',
          snippet: 'This is my home',
        ),
      ));
    });
  }

  final _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(32.8821743, -6.897816),
              zoom: 14,
            ),
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(_markers),
            onTap: (LatLng latLng) {
              setState(() {
                Print.red('Tapped on $latLng');
                // _markers.add(Marker(
                //   markerId: MarkerId(
                //     'marker_id_${_markers.length + 1}',
                //   ),
                //   position: latLng,
                //   infoWindow: InfoWindow(
                //     title: 'Marker',
                //     snippet: 'This is my home',
                //   ),
                // ));
              });
            },
          ),
          const ReturnButton(),
          const ButtonText(),
        ],
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          'carlock',

          // '1337 future is loading',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 40, left: 10),
      height: 45.0,
      width: 45.0,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
          elevation: 0,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
    );
  }
}
