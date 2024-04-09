abstract class LoadingState {
  const LoadingState();
}

class Loading extends LoadingState {
  const Loading();
}

class LoadingError extends LoadingState {
  final String message;

  LoadingError(this.message);
}

class NotLoading extends LoadingState{
  const NotLoading();
}

class SuccessLoading extends LoadingState{
  const SuccessLoading();
}
