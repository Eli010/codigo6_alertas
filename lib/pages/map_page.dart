import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> myMarkers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff98DBB0),
      //reamos la llamada a nuestro paque de google_maps_flutter
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-15.493567, -70.130997),
          zoom: 14,
        ),
        markers: myMarkers,

        //con darle click podemos tener nustra latitud y longitud
        onTap: (LatLng position) {
          //muestro mi position con un click
          // print(position);
          Marker marker = Marker(
            //un valor unico de id
            markerId: MarkerId(myMarkers.length.toString()),
            //la posistion lo capturo desde mi ontap
            position: position,
          );
          myMarkers.add(marker);
          setState(() {});
        },
      ),
    );
  }
}
