// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:upgrader/upgrader.dart' as upg;

class UpgraderWidget extends StatefulWidget {
  const UpgraderWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _UpgraderWidgetState createState() => _UpgraderWidgetState();
}

class _UpgraderWidgetState extends State<UpgraderWidget> {
  @override
  Widget build(BuildContext context) {
    final appcastURL =
        'https://doniczzz.github.io/guiaMedicaVenezuela/appcast.xml';
    final cfg =
        upg.AppcastConfiguration(url: appcastURL, supportedOS: ['android']);
    return upg.UpgradeAlert(
      upgrader: upg.Upgrader(
          appcastConfig: cfg,
          canDismissDialog: false,
          showIgnore: false,
          showLater: false),
    );
  }
}
