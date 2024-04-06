import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeActions.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeState.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:get_it/get_it.dart';

import '../../domain/IHomeRepo.dart';

class HomePageBloc extends Bloc<IFoxIoTActions, HomeState> {
  IHomeRepo homeRepo = GetIt.I.get<IHomeRepo>();

  HomePageBloc() : super(const HomeState()) {
    {
      on<OnInit>((event, emit) async {
        emit(state.updateState(loadingState: const Loading()));
        await homeRepo
            .getHouses()
            .then((value) => emit(state.updateState(homes: value)));
        await homeRepo
            .getSelectedHome()
            .then((value) => emit(state.updateState(currentHome: value)));
        emit(state.updateState(loadingState: const NotLoading()));
      });
      on<OnChangeHomeClick>((event, emit) =>
          emit(state.updateState(isSelectHome: !state.isSelectHome)));
      on<OnEditHomeClick>(
          (event, emit) => emit(state.updateState(isEditHome: true)));
      on<OnRoomClick>((event, emit) {});
      on<ChangeHome>((event, emit) {
        emit(state.updateState(
            currentHome: state.homes.firstWhere(
                (element) => element.name == event.selectedHomeName)));
      });
      on<OnCreateHomeClick>((event, emit) {
        event.navigateToCreateHome();
      });
    }
  }
}
