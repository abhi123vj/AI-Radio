import 'package:ai_radio/model/radio.dart';
import 'package:ai_radio/utils/aiutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
 // HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late List<MyRadio> radios;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRadios();
  }
  fetchRadios() async {

    final radioJson = await rootBundle.loadString('assets/Radio.json');
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         drawer: Drawer(),
         body: Stack(children: [
           VxAnimatedBox().size(context.screenWidth, context.screenHeight)
           .withGradient(LinearGradient(colors: [
             AIColors.primaryColor1,
             AIColors.primaryColor2
           ],begin: Alignment.topLeft,end: Alignment.bottomRight))
           .make(),
           AppBar(
              title: "AI Radio".text.xl4.bold.white.make().shimmer(
                  primaryColor: Vx.purple300, secondaryColor: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
            ).h(100.0).p16()
         ],),
       ),
    );
  }
}