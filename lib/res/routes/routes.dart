import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';
import 'package:api_intigrate_getx_demo/view/employee/employee_view.dart';

class AppRoute {
  static appRoute() => [

        GetPage(
          name: RouteName.splashScreen, 
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade, 
          ),

          GetPage(
          name: RouteName.loginView,
          page: () => LoginView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade, 
          ),

          GetPage(
          name: RouteName.homeView,
          page: () => HomeView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade, 
          ),

          GetPage(
          name: RouteName.employeeView,
          page: () => EmployeeView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade, 
          ),

      ];
}
