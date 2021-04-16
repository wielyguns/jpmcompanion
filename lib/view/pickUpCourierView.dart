import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/pickUpCourierViewModel.dart';
import 'package:jpmcompanion/widget/listPickUp.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jpmcompanion/main.dart' as main;

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
            resizeToAvoidBottomPadding: false,
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
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 1.wp,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 0.01.hp,
                                          horizontal: 0.04.wp,
                                        ),
                                        child: Text(
                                          '${model.onProgressPickUp.length} Order Waiting to be pick up today',
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: RefreshIndicator(
                                            onRefresh: () {
                                              return model.refreshWaitingList();
                                            },
                                            child: SingleChildScrollView(
                                              physics:
                                                  AlwaysScrollableScrollPhysics(),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                (main.onProcessPickUp != null)
                                    ? Stack(
                                        children: [
                                          Container(
                                            child: SingleChildScrollView(
                                              child:
                                                  (main.onProcessPickUp != null)
                                                      ? Column(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                                vertical:
                                                                    0.02.hp,
                                                              ),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      return model
                                                                          .onImageButtonPressed(
                                                                        context,
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      child: model.image ==
                                                                              null
                                                                          ? Icon(
                                                                              Icons.camera_alt,
                                                                              size: 70.ssp,
                                                                              color: purpleTheme,
                                                                            )
                                                                          : Image
                                                                              .file(
                                                                              model.image,
                                                                            ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .grey,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100,
                                                                      padding:
                                                                          EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            0.02.wp,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            child:
                                                                                Text(
                                                                              'Pick Up Code',
                                                                              style: TextStyle(
                                                                                fontSize: 45.ssp,
                                                                                color: Colors.grey,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Text(
                                                                              '${main.onProcessPickUp.kode}',
                                                                              style: TextStyle(
                                                                                fontSize: 45.ssp,
                                                                                color: Colors.black54,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Text(
                                                                              'Package Name',
                                                                              style: TextStyle(
                                                                                fontSize: 45.ssp,
                                                                                color: Colors.grey,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Text(
                                                                              '${main.onProcessPickUp.keterangan}',
                                                                              style: TextStyle(
                                                                                fontSize: 45.ssp,
                                                                                color: Colors.black54,
                                                                                fontWeight: FontWeight.bold,
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
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                'Specifications',
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
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
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
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          WidgetSpan(
                                                                            child:
                                                                                Image(
                                                                              width: 20,
                                                                              height: 20,
                                                                              image: AssetImage(
                                                                                'assets/Asset 87300.png',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ${main.onProcessPickUp.panjang} X ${main.onProcessPickUp.lebar} X ${main.onProcessPickUp.tinggi} cm',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 40.ssp,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    RichText(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          WidgetSpan(
                                                                            child:
                                                                                Image(
                                                                              width: 20,
                                                                              height: 20,
                                                                              image: AssetImage(
                                                                                'assets/Asset 85300.png',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ${main.onProcessPickUp.berat} Kg',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 40.ssp,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    RichText(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          WidgetSpan(
                                                                            child:
                                                                                Image(
                                                                              width: 20,
                                                                              height: 20,
                                                                              image: AssetImage(
                                                                                'assets/Asset 88300.png',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ${main.onProcessPickUp.koli} Koli',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 40.ssp,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.w600,
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
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                'Pickup Type',
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
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
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
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                '${main.onProcessPickUp.tujuanId == null ? 'MULTI DROP' : 'MEMBER'}',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 40.ssp,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.w600,
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
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      '${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                                        color:
                                                                            Color(
                                                                          hexStringToHexInt(
                                                                            '#d7e6ff',
                                                                          ),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'ON THE WAY',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(
                                                                            hexStringToHexInt(
                                                                              '#7cadfe',
                                                                            ),
                                                                          ),
                                                                          fontWeight:
                                                                              FontWeight.bold,
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
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      0.02.hp,
                                                                  horizontal:
                                                                      0.02.wp,
                                                                ),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            0.1.hp),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                        0,
                                                                        2,
                                                                      ),
                                                                      color:
                                                                          Color(
                                                                        hexStringToHexInt(
                                                                          '#dfebff',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    (main.onProcessPickUp.customer ==
                                                                            null)
                                                                        ? Container(
                                                                            child:
                                                                                Text(
                                                                              '${main.onProcessPickUp.namaPengirim}',
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w800,
                                                                                fontFamily: "PlexSans",
                                                                                fontSize: 35.ssp,
                                                                                color: Colors.black54,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            child:
                                                                                Text(
                                                                              '${main.onProcessPickUp.customer.nama}',
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w800,
                                                                                fontFamily: "PlexSans",
                                                                                fontSize: 35.ssp,
                                                                                color: Colors.black54,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Image(
                                                                            width:
                                                                                20,
                                                                            height:
                                                                                20,
                                                                            image:
                                                                                AssetImage('assets/Asset 67300 1.png'),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              child: Text(
                                                                                '${main.onProcessPickUp.alamatPengirim}',
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Image(
                                                                            width:
                                                                                20,
                                                                            height:
                                                                                20,
                                                                            image:
                                                                                AssetImage(
                                                                              'assets/Asset 86300.png',
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  child: Text(
                                                                                    '${main.onProcessPickUp.telponPengirim}',
                                                                                    style: TextStyle(
                                                                                      color: Color(
                                                                                        hexStringToHexInt(
                                                                                          '#87b3fd',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    launch("tel://${main.onProcessPickUp.telponPengirim}");
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: EdgeInsets.symmetric(
                                                                                      horizontal: 0.04.wp,
                                                                                      vertical: 0.01.hp,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(
                                                                                        hexStringToHexInt(
                                                                                          '#f2f2f2',
                                                                                        ),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                    ),
                                                                                    child: Text(
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
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              width: 1.wp,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0.04.wp,
                                              ),
                                              height: 0.08.hp,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RaisedButton(
                                                    focusElevation: 0,
                                                    hoverElevation: 0,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.blue[50],
                                                    padding: EdgeInsets.zero,
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    onPressed: () {
                                                      model.cancelPickUp(
                                                        context,
                                                      );
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 0.015.hp,
                                                        horizontal: 0.04.wp,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Color(
                                                            hexStringToHexInt(
                                                                '#126afc'),
                                                          ),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Text(
                                                        'CANCEL PICKUP',
                                                        style: TextStyle(
                                                          color: Color(
                                                            hexStringToHexInt(
                                                                '#126afc'),
                                                          ),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  RaisedButton(
                                                    focusElevation: 0,
                                                    hoverElevation: 0,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.blue[50],
                                                    padding: EdgeInsets.zero,
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    onPressed: () {
                                                      model.permissionDialog(
                                                        context,
                                                      );
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 0.015.hp,
                                                        horizontal: 0.04.wp,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                          hexStringToHexInt(
                                                              '#126afc'),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Text(
                                                        'ITEM RECEIVED',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (model.darken)
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                width: 1.wp,
                                                height: 1.hp,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              width: 1.wp,
                                              height: 1.hp,
                                              child: SnappingSheet(
                                                snappingSheetController: model
                                                    .snappingSheetController,
                                                sheetBelow:
                                                    SnappingSheetContent(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 0.04.wp,
                                                      vertical: 0.02.hp,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                          10,
                                                        ),
                                                        topRight:
                                                            Radius.circular(
                                                          10,
                                                        ),
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 0.01.hp,
                                                            ),
                                                            child: Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Alasan Cancel',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          50.ssp,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    color: Colors
                                                                            .blue[
                                                                        100],
                                                                    onPressed:
                                                                        () {
                                                                      model
                                                                          .collapseSnapping();
                                                                    },
                                                                    icon: Icon(
                                                                      FontAwesomeIcons
                                                                          .times,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: Colors
                                                                .blue[200],
                                                          ),
                                                          Container(
                                                            child:
                                                                TextFormField(
                                                              controller: model
                                                                  .alasanCancel,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'cth:Pengirim tidak merespon',
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 0.02.hp,
                                                          ),
                                                          RaisedButton(
                                                            focusElevation: 0,
                                                            hoverElevation: 0,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            splashColor:
                                                                Colors.blue[50],
                                                            padding:
                                                                EdgeInsets.zero,
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 0,
                                                            onPressed: () {
                                                              return model
                                                                  .submitCancelPickUp(
                                                                      context);
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 1.wp,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical:
                                                                    0.015.hp,
                                                                horizontal:
                                                                    0.04.wp,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                  hexStringToHexInt(
                                                                      '#126afc'),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Text(
                                                                'SUBMIT CANCEL',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  heightBehavior:
                                                      SnappingSheetHeight.fit(),
                                                ),
                                                snapPositions: [
                                                  SnapPosition(
                                                    positionPixel: 0,
                                                    snappingCurve:
                                                        Curves.elasticOut,
                                                    snappingDuration: Duration(
                                                      milliseconds: 300,
                                                    ),
                                                  ),
                                                  SnapPosition(
                                                    positionPixel: 0.5.hp,
                                                    snappingCurve:
                                                        Curves.elasticOut,
                                                    snappingDuration: Duration(
                                                      milliseconds: 300,
                                                    ),
                                                  ),
                                                ],
                                                grabbingHeight: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        height: 1.hp,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RaisedButton(
                                              focusElevation: 0,
                                              hoverElevation: 0,
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.blue[50],
                                              padding: EdgeInsets.zero,
                                              color: Colors.transparent,
                                              elevation: 0,
                                              onPressed: () {
                                                model.toWaitingListTab();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 0.015.hp,
                                                  horizontal: 0.04.wp,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                    hexStringToHexInt(
                                                        '#126afc'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  'MULAI PROGRESS PICKUP',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 1.wp,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 0.01.hp,
                                          horizontal: 0.04.wp,
                                        ),
                                        child: Text(
                                          '${model.completedPickUp.length} Order Completed today',
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: RefreshIndicator(
                                            onRefresh: () {
                                              return model.refreshWaitingList();
                                            },
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: model.completedPickUp
                                                    .map<Widget>((e) {
                                                  return ListPickUp(
                                                    result: e,
                                                    status: e.status,
                                                    onPressed: () async {
                                                      // model.processing(e);
                                                    },
                                                  );
                                                }).toList(),
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
