import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Languages.login.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             InputEmailWidget(),
              SizedBox(height: 40,),
              InputPasswordWidget(),
              SizedBox(height: 40,),
             LoginButtonWidget(formKey: _formKey)
            ],
          ),
        ),
      ),
    );
  }
}