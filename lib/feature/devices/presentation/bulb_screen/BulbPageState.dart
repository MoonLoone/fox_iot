import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

@immutable
class BulbPageState {
  final String bulbId;
  final Color color;
  final LoadingState loading;
  final bool bulbState;

  const BulbPageState(
      {this.color = Colors.white,
      this.loading = const NotLoading(),
      this.bulbState = false,
      this.bulbId = ""});

  BulbPageState updateState(
          {Color? color,
          LoadingState? loading,
          bool? bulbState,
          String? bulbId}) =>
      BulbPageState(
          color: color ?? this.color,
          loading: loading ?? this.loading,
          bulbState: bulbState ?? this.bulbState,
          bulbId: bulbId ?? this.bulbId);
}

class InitialBulbState extends BulbPageState{}
