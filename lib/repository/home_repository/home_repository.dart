import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class HomeRepository {
  final _apiService = NetworkApiService();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListUrl);
    return UserListModel.fromJson(response);
  }
}