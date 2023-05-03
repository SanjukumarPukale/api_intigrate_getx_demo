import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs; 

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUrlList(UserListModel value) => userList.value = value;
  void setError(String value) => error.value = value;

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