import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class NetworkApiService extends BaseApiService {

  dynamic responseJson;

  @override
  Future<dynamic> getApi(String url) async {

    print(url);
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200: 
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:  
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException('Error occured while communicating with server '+ response.statusCode.toString());
    }
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
     try {
      final response = await http.post(Uri.parse(url),
      body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }
}