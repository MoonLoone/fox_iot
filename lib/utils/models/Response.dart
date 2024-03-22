
abstract class Response<T>{}

class SuccessResponse<T> extends Response<T>{
    T? data;
    SuccessResponse(this.data);
}

class ErrorResponse<T> extends Response<T>{
  Exception error;
  ErrorResponse(this.error);
}
