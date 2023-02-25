// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'package:image_downloader/image_downloader.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

Future descargaImagen(
  String? imageURL,
  bool? platformIsiOS,
  bool? platformIsAndroid,
) async {
  if (platformIsAndroid == true || platformIsiOS == true) {
    //code for Android and iOS
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(imageURL!);
      if (imageId == null) {
        return;
      }
    } on PlatformException catch (error) {
      print(error);
    }
  }
  //return successful message once the download finishes
  //this can be used as a action output variable to show a snackbar.
  return "Download Successful";
}
