import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';


class InputAssociationId extends StatelessWidget {
  InputAssociationId({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: loginVM.associationIdController.value,
                focusNode: loginVM.associationIdFocusNode.value,
                validator: (value) {
                  if(value!.isEmpty) {
                    Utils.SnackBar('Association Id', 'Enter Association Id');
                  }
                },
                onFieldSubmitted: (value) {
                  Utils.fieldfocusChange(context, loginVM.associationIdFocusNode.value, loginVM.emailFocusNode.value,);
                },
                decoration: InputDecoration(
                  hintText: Languages.associationIdHint.tr,  
                  border: OutlineInputBorder()
                ),
              );
  }
}