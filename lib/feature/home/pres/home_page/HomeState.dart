import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';
import '../../domain/FoxIoTHome.dart';

@immutable
class HomeState {
  final bool isEditHome;
  final bool isSelectHome;
  final LoadingState loadingState;
  final List<FoxIoTHome> homes;
  final FoxIoTHome? currentHome;

  const HomeState({this.isEditHome = false,
    this.isSelectHome = false,
    this.loadingState = const NotLoading(),
    this.homes = const [],
    this.currentHome});

  HomeState updateState({bool? isEditHome,
    bool? isSelectHome,
    LoadingState? loadingState,
    List<FoxIoTHome>? homes,
    FoxIoTHome? currentHome}) =>
      HomeState(
          isEditHome: isEditHome ?? this.isEditHome,
          loadingState: loadingState ?? this.loadingState,
          homes: homes ?? this.homes,
          currentHome: currentHome ?? this.currentHome,
          isSelectHome: isSelectHome ?? this.isSelectHome);

}
