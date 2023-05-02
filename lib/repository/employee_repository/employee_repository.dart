import 'package:api_intigrate_getx_demo/models/employee/employee_list.dart';
import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class EmployeeRepository {
  final _apiService = NetworkApiService();
  List<EmployeeListModel>  employeeList = [];
  Future<List<EmployeeListModel>> employeeListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.employeeListUrl);
    for (var i in response) {
      employeeList.add(EmployeeListModel.fromJson(i));
    }
    return employeeList;
  }
}