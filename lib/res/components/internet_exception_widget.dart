import 'package:api_intigrate_getx_demo/res/routes/app_exports.dart';

class InternetExceptionWidget extends StatefulWidget {
  const InternetExceptionWidget({ Key? key, required this.onPress }) : super(key: key);

  final VoidCallback onPress;

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          Icon(Icons.cloud_off, color: AppColor.redColor, size: 50,),
          Padding(
            padding: EdgeInsets.all(30),
            child: Center(child: Text(Languages.internetExceptionText.tr, textAlign: TextAlign.center,),), 
            ),
            SizedBox(height: height * 0.15,),
            RoundButton(title: 'Retry', onPress: widget.onPress),
            
        ],
      ),
      );
  }
}