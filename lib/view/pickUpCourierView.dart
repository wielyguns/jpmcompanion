import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/pickUpCourierViewModel.dart';
import 'package:jpmcompanion/widget/listPickUp.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      if (model.tabController != null)
                        Container(
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
                      if (model.tabController != null)
                        Expanded(
                          child: Container(
                            child: TabBarView(
                              controller: model.tabController,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.02.wp),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: model.onProgressPickUp
                                          .map<Widget>((e) {
                                        return ListPickUp(
                                          result: e,
                                          onPressed: () async {
                                            model.processing(e);
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                (!model.onProcessLoading)
                                    ? Container(
                                        child: SingleChildScrollView(
                                          child: (model.onProcessPickUp != null)
                                              ? Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 0.04.wp,
                                                        vertical: 0.02.hp,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: 100,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.02.wp,
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    child: Text(
                                                                      'Pick Up Code',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            45.ssp,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      '${model.onProcessPickUp.kode}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            45.ssp,
                                                                        color: Colors
                                                                            .black54,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      'Package Name',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            45.ssp,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      '${model.onProcessPickUp.keterangan}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            45.ssp,
                                                                        color: Colors
                                                                            .black54,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 0.04.wp,
                                                      ),
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Specifications',
                                                        style: TextStyle(
                                                          fontSize: 40.ssp,
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 0.04.wp,
                                                      ),
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                    child:
                                                                        Image(
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      image:
                                                                          AssetImage(
                                                                        'assets/Asset 87300.png',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' ${model.onProcessPickUp.panjang} X ${model.onProcessPickUp.lebar} X ${model.onProcessPickUp.tinggi} cm',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          40.ssp,
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                    child:
                                                                        Image(
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      image:
                                                                          AssetImage(
                                                                        'assets/Asset 85300.png',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' ${model.onProcessPickUp.berat} Kg',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          40.ssp,
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                    child:
                                                                        Image(
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                      image:
                                                                          AssetImage(
                                                                        'assets/Asset 88300.png',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' ${model.onProcessPickUp.koli} Koli',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          40.ssp,
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      width: 1.wp,
                                                      height: 20,
                                                      color: Color(
                                                        hexStringToHexInt(
                                                          '#f5f5f5',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 0.04.wp,
                                                      ),
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                0.02.wp,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                  hexStringToHexInt(
                                                                    '#d7e6ff',
                                                                  ),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Text(
                                                                'ON THE WAY',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                    hexStringToHexInt(
                                                                      '#7cadfe',
                                                                    ),
                                                                  ),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      width: 1.wp,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 0.04.wp,
                                                      ),
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          vertical: 0.02.hp,
                                                          horizontal: 0.02.wp,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 2,
                                                              offset: Offset(
                                                                4,
                                                                4,
                                                              ),
                                                              color: Color(
                                                                hexStringToHexInt(
                                                                  '#f2f2f2',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            (model.onProcessPickUp
                                                                        .customer ==
                                                                    null)
                                                                ? Container(
                                                                    child: Text(
                                                                      '${model.onProcessPickUp.namaPengirim}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                        fontFamily:
                                                                            "PlexSans",
                                                                        fontSize:
                                                                            35.ssp,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    child: Text(
                                                                      '${model.onProcessPickUp.customer.nama}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                        fontFamily:
                                                                            "PlexSans",
                                                                        fontSize:
                                                                            35.ssp,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Image(
                                                                    width: 20,
                                                                    height: 20,
                                                                    image: AssetImage(
                                                                        'assets/Asset 67300 1.png'),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Text(
                                                                        '${model.onProcessPickUp.alamatPengirim}',
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Image(
                                                                    width: 20,
                                                                    height: 20,
                                                                    image:
                                                                        AssetImage(
                                                                      'assets/Asset 86300.png',
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          child:
                                                                              Text(
                                                                            '${model.onProcessPickUp.telponPengirim}',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(
                                                                                hexStringToHexInt(
                                                                                  '#87b3fd',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            launch("tel://${model.onProcessPickUp.telponPengirim}");
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              horizontal: 0.04.wp,
                                                                              vertical: 0.01.hp,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(
                                                                                hexStringToHexInt(
                                                                                  '#f2f2f2',
                                                                                ),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'Call',
                                                                              style: TextStyle(
                                                                                color: Colors.black54,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                        ),
                                      )
                                    : Container(
                                        child: Column(
                                          children: [
                                            CircularProgressIndicator()
                                          ],
                                        ),
                                      ),
                                Container(
                                  child: Text('tes3'),
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
    );
  }
}
