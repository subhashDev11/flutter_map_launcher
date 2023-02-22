import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:test_today/core/route/navigation_service.dart';
import 'package:test_today/services/overlay_service.dart';
import 'locator.dart';
import 'logger_utils.dart';

class LocationUtility {
  static Future<Position?> fetchLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppLogger.e('Location service not enabled!');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await showPermissionAccessDialog();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await showPermissionAccessDialog();
    }
    final position = await Geolocator.getCurrentPosition();
    AppLogger.i('Current Location Position - ${position.toJson()}');
    return position;
  }

  static Future<Address?> getAddressFromPosition(double? lat, double? long) async {
    if (lat != null && long != null) {
      try {
        final coordinates = Coordinates(lat, long);
        final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        AppLogger.i('Fetch Address - ${addresses.first.toMap()}');
        return addresses.first;
      } catch (e) {
        AppLogger.e('Failed to get address from position - $e');
        return null;
      }
    } else {
      try {
        bool serviceEnabled;
        LocationPermission permission;
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          AppLogger.e('Location service not enabled!');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            await Geolocator.openAppSettings();
          }
        }

        if (permission == LocationPermission.deniedForever) {
          await Geolocator.openAppSettings();
        }
        final position = await Geolocator.getCurrentPosition();
        final coordinates = Coordinates(position.latitude, position.longitude);
        final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        AppLogger.i('Fetch Address - ${addresses.first.toMap()}');
        return addresses.first;
      } catch (e) {
        AppLogger.e('Failed to get address from position - $e');
        return null;
      }
    }
  }

  static Future<LatLng?> positionFromAddress(String add) async {
    final loc = await locationFromAddress(add);
    final pos = LatLng(loc.first.latitude, loc.first.longitude);
    return pos;
  }

  static Future<void> showPermissionAccessDialog() async {
    final context = getIt<NavigationService>().navigatorKey.currentState?.context;
    if (context != null) {
      await getIt<OverlayService>().showAwesomeDialog(
        title: 'Location permission denied',
        subTitle: 'Please enable location permission from app setting',
        primaryText: 'Ok',
        secondaryText: 'Cancel',
        onPrimaryTap: () async {
          await Geolocator.requestPermission();
        },
      );
    }
  }
}
