import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();
  UserPreferences userPreferences = UserPreferences();
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if(value['error'] == 'user not found' || value['error'] == 'Missing email or username') {
        Utils.SnackBar('Login', value['error']);
      } else {
         userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
         Get.delete<LoginViewModel>();    // delete LoginViewModel memory
         Get.offAllNamed(RouteName.homeView);
         }).onError((error, stackTrace) {

         });

         Utils.SnackBar('Login', 'Login Successful!');
      }
     
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}