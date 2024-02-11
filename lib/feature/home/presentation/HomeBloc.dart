import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/home/domain/models/HomePresRoom.dart';
import 'package:fox_iot/feature/home/presentation/contracts/HomePageState.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';

class HomeBloc extends Bloc<IFoxIoTActions, HomePageState> {
  HomeBloc() : super(const HomePageState()) {
    on((event, emit) {
      switch (event) {
        case OnInit:
          {
            emit(state.updateState(rooms: [
              const HomePresRoom("Kitchen", "1", 5),
              const HomePresRoom("Living", "2", 6),
              const HomePresRoom("Bath", "3", 2),
              const HomePresRoom("Bath2", "4", 1)
            ]));
          }
      }
    });
  }
}
