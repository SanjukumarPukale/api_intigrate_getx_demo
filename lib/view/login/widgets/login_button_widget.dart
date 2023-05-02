import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  LoginButtonWidget({ Key? key, required this.formKey }) : super(key: key);

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  RoundButton(
                loading: loginVM.loading.value,
                width: 200,
                title: 'Login', 
                onPress: () {
                  if(formKey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                }),);
  }
}