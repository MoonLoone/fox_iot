import 'models/Response.dart';

Future<Response<T>> safeApiRequest<T>(Future<T> Function() asyncFunction) async {
  try {
    T result = await asyncFunction();
    return SuccessResponse(result);
  } catch (e) {
    return ErrorResponse(e as Exception);
  }
}