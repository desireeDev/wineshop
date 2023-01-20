import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSceen extends StatefulWidget {
  const MapsSceen({Key? key}) : super(key: key);

  @override
  State<MapsSceen> createState() => _MapsSceenState();
}

class _MapsSceenState extends State<MapsSceen> {
  static const LatLng currentLocation = LatLng(5.3510144, -3.997696);
  late GoogleMapController _mapController;
  final Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps example'),
      ),
      body: GoogleMap(
          initialCameraPosition: const CameraPosition(
              target: currentLocation,
            zoom: 14
          ),
        onMapCreated: (controller){
          _mapController = controller;

          addMarker('wineshop', currentLocation);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }
  
  addMarker(String id, LatLng location) async{
    var markerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/wine.png");
    var marker = Marker(
        markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Title of place',
        snippet: "Some description of the place",
      ),
      icon: markerIcon,
    );

    _markers[id] = marker;
    setState(() {

    });
  }
}
