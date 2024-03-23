import 'package:flutter/cupertino.dart';

import '../../../../utils/models/LoadingState.dart';

@immutable
class MainInfoState {
  final String imageUrl;
  final String name;
  final String bio;
  final LoadingState loadingState;

  const MainInfoState({
    this.imageUrl = "",
    this.name = "",
    this.bio = "",
    this.loadingState = const NotLoading(),
  });

  MainInfoState updateState({
    String? imageUrl,
    String? name,
    String? bio,
    LoadingState? loadingState,
  }) {
    return MainInfoState(
        bio: bio ?? this.bio,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        loadingState: loadingState ?? this.loadingState);
  }
}

abstract class MainInfoActions {}

class NextClick extends MainInfoActions {
  String? imageUrl;
  String? name;
  String? bio;
  String? userId;
  late Function() navigateNext;

  NextClick({this.imageUrl, this.name, this.bio, this.userId, required this.navigateNext});
}

class AddImageClick extends MainInfoActions {}

class PreviousClick extends MainInfoActions {
  late Function() navigatePrev;

  PreviousClick({required this.navigatePrev});

}
