import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/updateDoViewModel.dart';
import 'package:jpmcompanion/widget/shippingOrderInputField.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class UpdateDoView extends StatefulWidget {
  @override
  _UpdateDoViewState createState() => _UpdateDoViewState();
}

class _UpdateDoViewState extends State<UpdateDoView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UpdateDoViewModel(),
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => GestureDetector(
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
              'Update Status DO',
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
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.wp),
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
                                      'Nama Akun',
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
                                      'Adi wielijarni',
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
                                      'Akun Hak Akses',
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
                                      'Operasional',
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
                      Container(
                        margin: EdgeInsets.only(top: 0.04.wp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        image: AssetImage(
                                          'assets/Asset 47300 2.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Deskripsi',
                                    style: TextStyle(
                                      color: purpleTheme,
                                      fontSize: 45.ssp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ShippingOrderInputField(
                              onTap: () async {},
                              hintText: 'Paket dalam proses sorting',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.04.wp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        image: AssetImage(
                                          'assets/Asset 67300 1.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Lokasi Update',
                                    style: TextStyle(
                                      color: purpleTheme,
                                      fontSize: 45.ssp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ShippingOrderInputField(
                              readOnly: true,
                              controller: model.kota,
                              onTap: () {
                                model.getOrigin(context);
                              },
                              hintText: 'KOTA SURABAYA',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.04.wp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        FontAwesomeIcons.calendar,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ShippingOrderInputField(
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
                      Container(
                        margin: EdgeInsets.only(top: 0.02.hp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(
                              50.0,
                            ),
                          ),
                        ),
                        child: Container(
                          child: RaisedButton(
                            color: purpleTheme,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            onPressed: () {
                              model.openQrCode(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(0.02.wp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Image(
                                      color: Colors.white,
                                      width: 0.08.wp,
                                      image: AssetImage('assets/qrcode.png'),
                                    ),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
