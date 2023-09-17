import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtil {
  static Future<BitmapDescriptor> getImageFromAsset(
      {required String imageName}) async {
    return await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "images/$imageName",
    );
  }

  static Future<BitmapDescriptor> getImageFromNetwork(
      {required String imageUrl}) async {
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
            .buffer
            .asUint8List();

    return BitmapDescriptor.fromBytes(bytes);
  }
}