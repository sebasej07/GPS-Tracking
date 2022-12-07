

import 'package:get/get.dart';
import 'package:location/location.dart';

class ControlGps extends GetxController{
  final Rx<dynamic> _lat= "".obs;
  final Rx<dynamic> _long = "".obs;

  String get Lat => _lat.value;
  String get Lon => _long.value;

  Future<void> obtenerUbicacion() async {
    final LocationData _posicion;
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled){
      _serviceEnabled = await location.serviceEnabled();
      if(!_serviceEnabled){
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted!=PermissionStatus.granted){
        return;
      }
    }

    _posicion = await location.getLocation();

    _long.value = _posicion.longitude.toString();
    _lat.value = _posicion.latitude.toString();


  }
}