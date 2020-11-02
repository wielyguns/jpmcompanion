import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/provider/homeViewModel.dart';
import 'package:jpmcompanion/view/dashboardTabView.dart';
import 'package:jpmcompanion/view/mapTabView.dart';
import 'package:jpmcompanion/widget/customBottomNavigationBar.dart';

import 'package:stacked/stacked.dart';

import '../const.dart';

import '../widget/loadingScreen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context, this),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LoadingScreen(
          showLoadingApi: false,
          showLoadingScreen: model.isBusy,
          child: Scaffold(
            key: model.scaffoldKey,
            drawer: model.drawer(context),
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
                  child: Icon(
                    FontAwesomeIcons.bars,
                    color: textGrey,
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
                    child: Stack(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: textGrey,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            FontAwesomeIcons.solidCircle,
                            color: Colors.red,
                            size: 25.ssp,
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              height: 1.hp,
              color: Colors.white,
              child: (model.tabController != null)
                  ? TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: model.tabController,
                      children: [
                        Container(
                          child: DashboardTabView(),
                        ),
                        Container(
                          child: MapTabView(
                            result: model.activeTracking,
                          ),
                        ),
                        Container(
                          child: Text('Tab 3'),
                        ),
                        Container(
                          child: Text('Tab 3'),
                        ),
                      ],
                    )
                  : Container(),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onTap: (index) {
                model.changeTab(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
