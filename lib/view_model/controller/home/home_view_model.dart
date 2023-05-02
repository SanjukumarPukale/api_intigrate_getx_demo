import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs; 

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUrlList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUrlList(value);

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}