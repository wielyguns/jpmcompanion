import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/pickUpCourierViewModel.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:jpmcompanion/widget/shippingOrderInputField.dart';
import 'package:signature/signature.dart';
import 'package:stacked/stacked.dart';

class PickUpCourierView extends StatefulWidget {
  @override
  _PickUpCourierViewState createState() => _PickUpCourierViewState();
}

class _PickUpCourierViewState extends State<PickUpCourierView>
    with SingleTickerProviderStateMixin {
  var vsync;

  @override
  void initState() {
    setState(() {
      vsync = this;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PickUpCourierViewModel(),
      onModelReady: (model) => model.init(context, vsync),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: model.isBusy,
        showLoadingScreen: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            key: model.scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  FontAwesomeIcons.arrowAltCircleLeft,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Pick Up',
                style: TextStyle(
                  fontFamily: "PlexSans",
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.amber,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  width: 1.wp,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.amber, Colors.amber],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 0.07.hp,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.amber, Colors.amber],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        height: 0.07.hp,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.white, Colors.white],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: Container(
                alignment: Alignment.topRight,
                width: 1.wp,
                child: Image(
                  width: 0.5.wp,
                  image: AssetImage('assets/Asset 55300 1.png'),
                ),
              ),
            ),
            body: Container(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowGlow();
                  return;
                },
                child: SingleChildScrollView(
                  child: Form(
                    key: model.formKey,
                    child: Container(
                      height: 1.hp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.wp,
                            ),
                            color: Color(
                              hexStringToHexInt('#F5F5F5'),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 0.01.hp,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Nama',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 40.ssp,
                                            color: textGrey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlexSans",
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '${(model.user != null) ? model.user.nama : '-'}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 40.ssp,
                                            color: textGrey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlexSans",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 0.01.hp,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Nopol Kendaraan',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 40.ssp,
                                            color: textGrey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlexSans",
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '${(model.user.courier != null) ? model.user.courier.kendaraan.nopol : '-'}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 40.ssp,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlexSans",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 0.02.hp),
                              alignment: Alignment.topCenter,
                              child: TabBar(
                                controller: model.tabController,
                                tabs: [
                                  new Tab(
                                    icon: new Icon(
                                      Icons.circle,
                                      color: Colors.grey,
                                    ),
                                    child: Text(
                                      'Waiting list',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  new Tab(
                                    icon: new Icon(
                                      Icons.queue_music,
                                      color: Colors.grey,
                                    ),
                                    child: Text(
                                      'On Progress',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  new Tab(
                                    icon: new Icon(
                                      Icons.shopping_cart,
                                      color: Colors.grey,
                                    ),
                                    child: Text(
                                      'Completed',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
