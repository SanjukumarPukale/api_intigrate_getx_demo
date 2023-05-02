import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginUrl);
    return response;
  }
}