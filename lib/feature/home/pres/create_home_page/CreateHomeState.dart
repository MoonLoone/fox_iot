
import '../../../../utils/models/LoadingState.dart';

class CreateHomeState{

  final String homeName;
  final String location;
  final LoadingState loading;

  CreateHomeState({
    this.homeName = "", this.location = "", this.loading = const NotLoading()
});

  CreateHomeState updateState({String? homeName, String? location, LoadingState? loadingState}) => CreateHomeState(
    homeName: homeName?? this.homeName, location: this.location, loading: loadingState?? loading
  );

}
