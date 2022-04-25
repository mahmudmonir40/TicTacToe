

import 'dart:ui';

import 'package:flutter/material.dart';

class GameButton {

  final id;
  String text;
  Color bg;
  bool enabled;

  GameButton({this.id,this.text = "",this.bg = Colors.blueGrey,this.enabled = true});
}