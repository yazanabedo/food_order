import 'package:bot_toast/bot_toast.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import '../../ui/shared/utils.dart';

class LocationService {
  Location location = new Location();

  Future<LocationData?> getCurrentLocation({bool? hideLoader = true}) async {
    LocationData _locationData;

    if (!await isLocationEnabled()) return null;

    if (!await isPermissionGranted()) return null;

    customLoader();

    _locationData = await location.getLocation();

    if (hideLoader!) BotToast.closeAllLoading();

    return _locationData;
  }

  Future<geo.Placemark?> getLocationInfo(LocationData locationData,
      {bool? showLoader = true}) async {
    if (showLoader!) customLoader();

    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
    BotToast.closeAllLoading();

    if (placemarks.isNotEmpty)
      return placemarks[0];
    else
      return null;
  }

  Future<geo.Placemark?> getCurrentLocationInfo() async {
    return await getLocationInfo(
        await getCurrentLocation() ?? LocationData.fromMap({}));
  }

  Future<bool> isLocationEnabled() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    return _serviceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return _permissionGranted == PermissionStatus.granted;
  }
}