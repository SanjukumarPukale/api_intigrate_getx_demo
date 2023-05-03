import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  UserPreferences userPreferences = UserPreferences();

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
          userPreferences.removeUser().then((value) {
            Get.offAllNamed(RouteName.loginView);
          });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING: 
            return Center(child: CircularProgressIndicator(),);
          case Status.ERROR: 
          if(homeController.error.value == AppException.noInternetError) {           //  'No internet: '
            return InternetExceptionWidget(onPress: () {
              homeController.userListApi();
            },);
          } else {
            return Center(child: Text(homeController.error.value),);
          }
            
          case Status.COMPLETED: 
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                  ),
                  title: Text(homeController.userList.value.data![index].firstName.toString()),
                  subtitle: Text(homeController.userList.value.data![index].email.toString()),
                ),
              );
            },);
            
          default: return Container();
        }
      },),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Get.toNamed(RouteName.employeeView);
        print('clicked+++++++++++++++++++++++++++');
      }, child: Text('User List'),
      ),
      );
  }
}