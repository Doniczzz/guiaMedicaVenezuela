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

import 'package:upgrader/upgrader.dart';

class Upgrader extends StatefulWidget {
  const Upgrader({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _UpgraderState createState() => _UpgraderState();
}

class _UpgraderState extends State<Upgrader> {
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert();
  }
}
