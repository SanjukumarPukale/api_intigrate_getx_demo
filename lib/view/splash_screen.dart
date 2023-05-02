import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashService = SplashServices();   

  @override
  void initState() {
    super.initState();
    splashService.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.tealColor,
      body: Center(child: Text(Languages.welcomeBackText.tr, textAlign: TextAlign.center,)),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(Languages.emailHint.tr),
    //   ),
    //   body: InternetExceptionWidget(onPress: () {
    //     Utils.toastMessageCenter("Lion");
    //   },),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Utils.toastMessageCenter("Lion");
    //     },
    //   ),
    // );
  }
}
