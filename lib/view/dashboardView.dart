import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/provider/dashboardViewModel.dart';
import 'package:stacked/stacked.dart';

import '../const.dart';
import '../const.dart';
import '../const.dart';
import '../const.dart';
import '../const.dart';
import '../widget/loadingScreen.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: false,
        showLoadingScreen: model.isBusy,
        child: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            elevation: 0,
            leading: Container(
              width: 0.1.wp,
              height: 0.1.wp,
              alignment: Alignment.center,
              child: MaterialButton(
                splashColor: purpleLightTheme,
                onPressed: () {},
                elevation: 0,
                color: Colors.white,
                child: Image(
                  width: 0.06.wp,
                  image: AssetImage('assets/Asset 36300 1.png'),
                ),
                padding: EdgeInsets.all(0),
                shape: CircleBorder(),
              ),
            ),
            backgroundColor: Colors.white,
            actions: [
              Container(
                width: 0.1.wp,
                height: 0.1.wp,
                margin: EdgeInsets.only(right: 0.03.wp),
                alignment: Alignment.center,
                child: MaterialButton(
                  splashColor: purpleLightTheme,
                  onPressed: () {},
                  elevation: 0,
                  color: Colors.white,
                  child: Image(
                    width: 0.06.wp,
                    image: AssetImage('assets/Asset 35300 1.png'),
                  ),
                  padding: EdgeInsets.only(
                      right: 0.01.hp, left: 0.01.hp, top: 0.01.hp),
                  shape: CircleBorder(),
                ),
              ),
              Container(
                width: 0.1.wp,
                height: 0.1.wp,
                margin: EdgeInsets.only(right: 0.03.wp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: textGrey,
                      blurRadius: 3,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/face23.jpg'),
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Text('hello'),
          ),
        ),
      ),
    );
  }
}
