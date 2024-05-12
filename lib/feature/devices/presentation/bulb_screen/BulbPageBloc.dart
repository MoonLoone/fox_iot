import 'package:flutter/material.dart';
import 'package:color_type_converter/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/domain/models/BulbHSVColor.dart';
import 'package:fox_iot/feature/devices/presentation/bulb_screen/BulbPageActions.dart';
import 'package:fox_iot/feature/devices/presentation/bulb_screen/BulbPageState.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:get_it/get_it.dart';

import '../../domain/IDeviceRepo.dart';

class BulbPageBloc extends Bloc<IFoxIoTActions, BulbPageState> {
  final _repo = GetIt.I.get<IDeviceRepo>();

  BulbPageBloc() : super(InitialBulbState()) {
    on<OnInit<String>>((event, emit) async {
      emit(state.updateState(bulbId: event.arg));
    });
    on<OnOnOffBulbClick>((event, emit) async {
      bool result = await _repo.onOffBulb(state.bulbId, !state.bulbState);
      emit(state.updateState(bulbState: result));
    });
    on<OnColorChange>((event, emit) async {
      emit(state.updateState(color: event.newColor));
      print(event.newColor);
      final convertedToLibModel = HSVColor.fromColor(event.newColor);
      final convertedToDomain = BulbHSVColor(
          h: convertedToLibModel.hue.toInt(),
          s: (convertedToLibModel.saturation*1000).toInt(),
          v: (convertedToLibModel.value*1000).toInt());
      print(convertedToDomain);
      _repo.changeBulbColor(state.bulbId, convertedToDomain);
    });
  }
}
