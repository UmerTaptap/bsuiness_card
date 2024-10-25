class ApiResponse<T> {
  String? message;
  T? data;
  bool isSuccessful;
  bool authError;
  int? statusCode;

  ApiResponse({this.data, this.message, this.isSuccessful = false, this.authError = false, this.statusCode});

}