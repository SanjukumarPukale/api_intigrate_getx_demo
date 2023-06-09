
import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.erroe(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status \n Data: $data \n Message: $message';
  }
}