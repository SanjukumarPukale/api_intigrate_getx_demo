import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class SplashServices {

  UserPreferences userPreferences = UserPreferences();

 void isLogin() {
 
  Timer(const Duration(seconds: 3), () {
     userPreferences.getUser().then((value) {
    print(value.accessToken);
    if(value.accessToken.toString() == 'null') {
      Get.offAllNamed(RouteName.loginView);
    } else {
      Get.offAllNamed(RouteName.homeView);
    }
  });
  },);
  }
}