import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/purchaseOrderViewModel.dart';
import 'package:jpmcompanion/view/homeView.dart';
import 'package:jpmcompanion/widget/purchaseOrderInputField.dart';
import 'package:stacked/stacked.dart';

import '../routeTransition.dart';

class PurchaseOrderView extends StatefulWidget {
  @override
  _PurchaseOrderViewState createState() => _PurchaseOrderViewState();
}

class _PurchaseOrderViewState extends State<PurchaseOrderView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PurchaseOrderViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          Navigator.pushAndRemoveUntil(
            context,
            RouteAnimationDurationFade(
              widget: HomeView(),
            ),
            (route) => false,
          );
          return;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow();
                return;
              },
              child: NestedScrollView(
                headerSliverBuilder: (context, box) {
                  return [
                    SliverAppBar(
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.arrowAltCircleLeft,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            RouteAnimationDurationFade(
                              widget: HomeView(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      title: Text(
                        'Purchase Order',
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
                                height: 0.05.hp,
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
                                height: 0.05.hp,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.white, Colors.white],
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      pinned: true,
                      flexibleSpace: Container(
                        alignment: Alignment.topRight,
                        width: 1.wp,
                        child: Image(
                          width: 0.5.wp,
                          image: AssetImage('assets/Asset 57300 1.png'),
                        ),
                      ),
                      expandedHeight: kToolbarHeight + 0.1.hp,
                    ),
                  ];
                },
                body: Container(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.02.wp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: 0.02.wp,
                                                    ),
                                                    child: Image(
                                                      width: 0.05.wp,
                                                      height: 0.05.wp,
                                                      image: AssetImage(
                                                        'assets/Asset 47300 2.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Delivery Order',
                                                  style: TextStyle(
                                                    color: purpleTheme,
                                                    fontSize: 45.ssp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          PurchaseOrderInputField(
                                            hintText: '5569384',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.04.wp,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: 0.02.wp,
                                                    ),
                                                    child: Image(
                                                      width: 0.05.wp,
                                                      height: 0.05.wp,
                                                      image: AssetImage(
                                                        'assets/Asset 77300 2.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Nopol',
                                                  style: TextStyle(
                                                    color: purpleTheme,
                                                    fontSize: 45.ssp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          PurchaseOrderInputField(
                                            hintText: 'L 8758 PO',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0.04.hp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: 0.02.wp,
                                                    ),
                                                    child: Image(
                                                      width: 0.05.wp,
                                                      height: 0.05.wp,
                                                      image: AssetImage(
                                                        'assets/Asset 50300 1.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Asal',
                                                  style: TextStyle(
                                                    color: purpleTheme,
                                                    fontSize: 45.ssp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          PurchaseOrderInputField(
                                            hintText: 'KOTA SURABAYA',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.04.wp,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: 0.02.wp,
                                                    ),
                                                    child: Image(
                                                      width: 0.05.wp,
                                                      height: 0.05.wp,
                                                      image: AssetImage(
                                                        'assets/Asset 67300 1.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Tujuan',
                                                  style: TextStyle(
                                                    color: purpleTheme,
                                                    fontSize: 45.ssp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          PurchaseOrderInputField(
                                            hintText: 'KAB. MALANG',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
