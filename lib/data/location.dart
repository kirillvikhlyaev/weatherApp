import 'package:geolocator/geolocator.dart';

class Location {
  static Future<Position> getPos() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('No permission');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
