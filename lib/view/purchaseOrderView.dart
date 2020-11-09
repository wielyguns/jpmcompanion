import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/purchaseOrderViewModel.dart';
import 'package:jpmcompanion/view/homeView.dart';
import 'package:jpmcompanion/widget/purchaseOrderInputField.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

import '../routeTransition.dart';

class PurchaseOrderView extends StatefulWidget {
  final result;

  const PurchaseOrderView({Key key, this.result}) : super(key: key);
  @override
  _PurchaseOrderViewState createState() => _PurchaseOrderViewState();
}

class _PurchaseOrderViewState extends State<PurchaseOrderView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PurchaseOrderViewModel(),
      onModelReady: (model) => model.init(context, widget.result),
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
            key: model.scaffoldKey,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  child: NotificationListener<OverscrollIndicatorNotification>(
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
                        margin: EdgeInsets.symmetric(horizontal: 0.02.wp),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 1.wp,
                                child: Row(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.amber,
                                      highlightColor: Colors.red,
                                      child: Container(
                                        child: Icon(
                                          FontAwesomeIcons.exclamationCircle,
                                          size: 0.05.wp,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 0.02.wp),
                                        child: Text(
                                          'DO ini harus dilengkapi saat ingin membiayakan atau invoice.',
                                          softWrap: true,
                                          style: TextStyle(
                                            color: purpleTheme,
                                            fontSize: 35.ssp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.02.hp),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PurchaseOrderInputField(
                                              controller: model.deliveryOrder,
                                              onTap: () {},
                                              hintText: '5569384',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.02.hp),
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
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .calendar,
                                                        color: purpleTheme,
                                                        size: 0.05.wp,
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Tanggal',
                                                    style: TextStyle(
                                                      color: purpleTheme,
                                                      fontSize: 45.ssp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PurchaseOrderInputField(
                                              controller: model.tanggal,
                                              readOnly: true,
                                              onTap: () async {
                                                model.changeDate(context);
                                              },
                                              hintText:
                                                  '${DateFormat("d/m/y").format(DateTime.now())}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.02.hp),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PurchaseOrderInputField(
                                              readOnly: true,
                                              controller: model.asal,
                                              onTap: () {
                                                model.getOrigin(context);
                                              },
                                              hintText: 'KOTA SURABAYA',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.02.hp),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PurchaseOrderInputField(
                                              readOnly: true,
                                              controller: model.tujuan,
                                              onTap: () {
                                                model.getDestination(context);
                                              },
                                              hintText: 'KAB. MALANG',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.02.hp),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PurchaseOrderInputField(
                                              controller: model.nopol,
                                              readOnly: true,
                                              onTap: () {
                                                model.getNopol(context);
                                              },
                                              hintText: 'L 8758 PO',
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
                                                          'assets/Asset 68300 1.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Jumlah Unit',
                                                    style: TextStyle(
                                                      color: purpleTheme,
                                                      fontSize: 45.ssp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PurchaseOrderInputField(
                                              onTap: () {},
                                              hintText: '1000',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0.02.hp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(
                                              50.0,
                                            ),
                                          ),
                                        ),
                                        child: RaisedButton(
                                          color: purpleTheme,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          onPressed: () {},
                                          child: Container(
                                            child: Text(
                                              'PROSES',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: Colors.white,
                                                fontSize: 45.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
