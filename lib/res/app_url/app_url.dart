import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class AppUrl {

  final loginVM = Get.put(LoginViewModel());

  static const String baseUrl = 'https://reqres.in';
  static const String baseUrl2 = 'http://44.197.120.123:8080';
  // static const String loginUrl = '$baseUrl/api/login';
  // static const String loginUrl = '$baseUrl/AuthBackEndGw/getToken';
  static const String userListUrl = '$baseUrl/api/users?page=2';
  static const String employeeListUrl = 'https://jsonplaceholder.typicode.com/posts';
}