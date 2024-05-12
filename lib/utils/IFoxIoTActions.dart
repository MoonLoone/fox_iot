abstract class IFoxIoTActions {}

class OnBackClick extends IFoxIoTActions {}

class OnInit<T> extends IFoxIoTActions {
  final T? arg;

  OnInit({this.arg});
}
