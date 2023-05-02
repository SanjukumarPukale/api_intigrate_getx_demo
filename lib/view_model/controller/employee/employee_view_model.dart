import 'package:api_intigrate_getx_demo/models/employee/employee_list.dart';
import 'package:api_intigrate_getx_demo/repository/employee_repository/employee_repository.dart';
import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class EmployeeConroller extends GetxController {

  final _api = EmployeeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final employeeList = <EmployeeListModel>[].obs;
  RxString error = ''.obs; 

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setEmployeeList(List<EmployeeListModel> _value) => employeeList.value = _value;
  void setError(String _value) => error.value = _value;

  void employeeListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.employeeListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setEmployeeList(value);

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}