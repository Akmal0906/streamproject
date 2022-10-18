class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.initial(this.message) : status = Status.INITIAl;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;
}

enum Status { INITIAl, LOADING, COMPLETED, ERROR }