import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class Utils {
  static void fieldfocusChange(BuildContext context, FocusNode curerrent, FocusNode nextFocus) {
    curerrent.unfocus();
    Focus.of(context).requestFocus(nextFocus); 
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      backgroundColor: AppColor.blackColor,
      msg: message,
      gravity: ToastGravity.BOTTOM,
      );
  }

   static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      backgroundColor: AppColor.blackColor,
      msg: message,
      gravity: ToastGravity.CENTER,
      );
  }

  static SnackBar(String title, String message) {
    Get.snackbar(title, message);
  }

  static bool validateEmail(String email) {
    return true;
  }
}