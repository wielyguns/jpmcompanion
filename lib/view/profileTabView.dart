import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/apiConst.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/provider/dashboardTabViewModel.dart';
import 'package:jpmcompanion/provider/profileTabViewModel.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;
import 'package:stacked/stacked.dart';

class ProfileTabView extends StatefulWidget {
  final List<Map> shortcut;
  final Function generateShortcut;
  final Function(dynamic) onRouteChanged;
  const ProfileTabView({
    Key key,
    this.shortcut,
    this.generateShortcut,
    this.onRouteChanged,
  }) : super(key: key);
  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(context),
      viewModelBuilder: () => ProfileTabViewModel(),
      builder: (context, model, child) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return;
          },
          child: RefreshIndicator(
            onRefresh: () {
              return model.onRefresh();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.wp,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: AssetImage('assets/4853433.jpg'),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.04.wp,
                          vertical: 0.02.hp,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.4),
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      model.onImageButtonPressed(context);
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              color: textGrey,
                                              blurRadius: 5,
                                              spreadRadius: 0,
                                            )
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: (!model.isBusy)
                                            ? Image(
                                                width: 75,
                                                height: 75,
                                                fit: BoxFit.cover,
                                                image: (model.user.image !=
                                                        null)
                                                    ? NetworkImage(
                                                        '$baseApi${model.user.image}')
                                                    : AssetImage(
                                                        'assets/download.jpg',
                                                      ),
                                              )
                                            : Shimmer.fromColors(
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                                baseColor: Colors.grey[300],
                                                highlightColor:
                                                    Colors.grey[200],
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.04.wp,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 75,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          (!model.isBusy)
                                              ? Text(
                                                  '${model.user.nama}',
                                                  style: TextStyle(
                                                    color: textBlack,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 50.ssp,
                                                  ),
                                                )
                                              : Shimmer.fromColors(
                                                  child: Container(
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                  ),
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[200],
                                                ),
                                          (!model.isBusy)
                                              ? Text(
                                                  '${model.user.email}',
                                                  style: TextStyle(
                                                    color: textBlack,
                                                    fontSize: 40.ssp,
                                                  ),
                                                )
                                              : Shimmer.fromColors(
                                                  child: Container(
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        40,
                                                      ),
                                                    ),
                                                  ),
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[200],
                                                ),
                                          (!model.isBusy)
                                              ? Text(
                                                  '${model.user.telpon}',
                                                  style: TextStyle(
                                                    color: textBlack,
                                                    fontSize: 40.ssp,
                                                  ),
                                                )
                                              : Shimmer.fromColors(
                                                  child: Container(
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                  ),
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[200],
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      splashColor: Colors.blue,
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.grey[800],
                                      ),
                                      onPressed: () {
                                        widget.onRouteChanged('user');
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.04.hp,
                            ),
                            if (!model.isBusy && model.user.courier != null)
                              Container(
                                child: Text(
                                  'Courier Route',
                                  style: TextStyle(
                                    color: textBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50.ssp,
                                  ),
                                ),
                              ),
                            if (!model.isBusy && model.user.courier != null)
                              SizedBox(
                                height: 0.02.hp,
                              ),
                            if (!model.isBusy && model.user.courier != null)
                              Container(
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.02.hp,
                                    horizontal: 0.04.wp,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.grey[100]),
                                  ),
                                  onPressed: () {
                                    widget.onRouteChanged('rute');
                                  },
                                  color: Colors.white,
                                  textColor: textBlack,
                                  child: Row(
                                    children: [
                                      ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (Rect bounds) {
                                          return ui.Gradient.linear(
                                            Offset(4.0, 24.0),
                                            Offset(24.0, 4.0),
                                            [
                                              Colors.blue[300],
                                              Colors.blue,
                                            ],
                                          );
                                        },
                                        child: Icon(FontAwesomeIcons.route),
                                      ),
                                      SizedBox(
                                        width: 0.04.wp,
                                      ),
                                      Expanded(
                                        child: (!model.isBusy)
                                            ? Text(
                                                '${model.user.courier.rute}',
                                                style: TextStyle(
                                                  color: textBlack,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40.ssp,
                                                ),
                                              )
                                            : Shimmer.fromColors(
                                                child: Container(
                                                  width: 1.wp,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                ),
                                                baseColor: Colors.grey[300],
                                                highlightColor:
                                                    Colors.grey[200],
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            if (!model.isBusy && model.user.courier != null)
                              SizedBox(
                                height: 0.04.hp,
                              ),
                            if (!model.isBusy && model.user.courier != null)
                              Container(
                                child: Row(
                                  children: [
                                    Image(
                                      width: 80.ssp,
                                      image:
                                          AssetImage('assets/trophy-dark.gif'),
                                    ),
                                    SizedBox(
                                      width: 0.02.wp,
                                    ),
                                    Text(
                                      'Courier Progress',
                                      style: TextStyle(
                                        color: textBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50.ssp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (!model.isBusy && model.user.courier != null)
                              SizedBox(
                                height: 0.02.hp,
                              ),
                            if (!model.isBusy && model.user.courier != null)
                              Container(
                                width: 1.wp,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey[300],
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 0.02.hp,
                                  horizontal: 0.04.wp,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: (!model.isBusy)
                                          ? Container(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ShaderMask(
                                                        blendMode:
                                                            BlendMode.srcIn,
                                                        shaderCallback:
                                                            (Rect bounds) {
                                                          return ui.Gradient
                                                              .linear(
                                                            Offset(4.0, 24.0),
                                                            Offset(24.0, 4.0),
                                                            [
                                                              Colors.blue[300],
                                                              Colors
                                                                  .greenAccent,
                                                            ],
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.bar_chart,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Pickup Completed',
                                                        style: TextStyle(
                                                          color: textGrey,
                                                          fontSize: 30.ssp,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${model.user.courier.total}',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 40.ssp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Shimmer.fromColors(
                                              child: Container(
                                                width: 1.wp,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              baseColor: Colors.grey[300],
                                              highlightColor: Colors.grey[200],
                                            ),
                                    ),
                                    Container(
                                      height: 40,
                                      child: VerticalDivider(
                                        width: 1,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: (!model.isBusy)
                                          ? Container(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ShaderMask(
                                                        blendMode:
                                                            BlendMode.srcIn,
                                                        shaderCallback:
                                                            (Rect bounds) {
                                                          return ui.Gradient
                                                              .linear(
                                                            Offset(4.0, 24.0),
                                                            Offset(24.0, 4.0),
                                                            [
                                                              Colors.blue[300],
                                                              Colors
                                                                  .greenAccent,
                                                            ],
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.motorcycle,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Pickup Active',
                                                        style: TextStyle(
                                                          color: textGrey,
                                                          fontSize: 30.ssp,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${model.user.courier.totalOnProgress}',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 40.ssp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Shimmer.fromColors(
                                              child: Container(
                                                width: 1.wp,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              baseColor: Colors.grey[300],
                                              highlightColor: Colors.grey[200],
                                            ),
                                    ),
                                    Container(
                                      height: 40,
                                      child: VerticalDivider(
                                        width: 1,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: (!model.isBusy)
                                          ? Container(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ShaderMask(
                                                        blendMode:
                                                            BlendMode.srcIn,
                                                        shaderCallback:
                                                            (Rect bounds) {
                                                          return ui.Gradient
                                                              .linear(
                                                            Offset(4.0, 24.0),
                                                            Offset(24.0, 4.0),
                                                            [
                                                              Colors.red[500],
                                                              Colors.blueAccent,
                                                            ],
                                                          );
                                                        },
                                                        child: Icon(Icons
                                                            .cancel_schedule_send),
                                                      ),
                                                      Text(
                                                        'Pickup Failure',
                                                        style: TextStyle(
                                                          color: textGrey,
                                                          fontSize: 30.ssp,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${model.user.courier.totalFail}',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 40.ssp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Shimmer.fromColors(
                                              child: Container(
                                                width: 1.wp,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              baseColor: Colors.grey[300],
                                              highlightColor: Colors.grey[200],
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.02.hp,
                        horizontal: 0.04.wp,
                      ),
                      child: Text(
                        'Pengaturan Akun',
                        style: TextStyle(
                          color: textBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.ssp,
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          widget.onRouteChanged('password');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 0.02.hp),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.shieldAlt,
                                size: 80.ssp,
                              ),
                              SizedBox(
                                width: 0.04.wp,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Keamanan Akun',
                                      style: TextStyle(
                                        color: textBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45.ssp,
                                      ),
                                    ),
                                    Text(
                                      'Kata Sandi & verifikasi data diri',
                                      style: TextStyle(
                                        color: textBlack,
                                        fontSize: 30.ssp,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          model.logout(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 0.02.hp),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.powerOff,
                                size: 80.ssp,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 0.04.wp,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Keluar Akun',
                                      style: TextStyle(
                                        color: textBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45.ssp,
                                      ),
                                    ),
                                    Text(
                                      'Keluar dari akun sekarang',
                                      style: TextStyle(
                                        color: textBlack,
                                        fontSize: 30.ssp,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
