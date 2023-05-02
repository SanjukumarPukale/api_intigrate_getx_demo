import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';
import 'package:api_intigrate_getx_demo/view_model/controller/employee/employee_view_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {

  final employeeController = Get.put(EmployeeConroller());

  @override
  void initState() {
    super.initState();
    employeeController.employeeListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Employee List'),
      ),
      body: Obx(() {
        switch (employeeController.rxRequestStatus.value) {
          case Status.LOADING: 
            return Center(child: CircularProgressIndicator(),);
          case Status.ERROR: 
          if(employeeController.error.value == 'No internet: ') {
            return InternetExceptionWidget(onPress: () {
              employeeController.employeeListApi();
            },);
          } else {
            return Center(child: Text(employeeController.error.value),);
          }
            
          case Status.COMPLETED: 
            return ListView.builder(
              itemCount: employeeController.employeeList.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(employeeController.employeeList[index].id.toString()),
                  title: Text(employeeController.employeeList[index].title.toString()),
                  subtitle: Text(employeeController.employeeList[index].body.toString()),
                ),
              );
            },);
            
          default: return Container();
        }
      },),
      );
  }
}