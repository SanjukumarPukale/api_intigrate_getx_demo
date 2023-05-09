import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';


class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    Map emptyData = {};
    dynamic response = await _apiService.postApi(emptyData, getLoginUrl(data));
    return response;
  }

  String getLoginUrl(data) {
    String baseUrl = AppUrl.baseUrl2;
    String password = data['password'];

    var bytesToHash = utf8.encode(password);
    var sha256DigestPassword = sha256.convert(bytesToHash).toString();  // converting password to sha256 format 

    String loginUrl = baseUrl+'/AuthBackEndGw/getToken'+'/'+data['associationId']+'/'+data['email']+'/'+sha256DigestPassword;
    return loginUrl;
  }
}