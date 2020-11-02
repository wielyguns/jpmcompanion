import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';

class MapDrawer extends StatefulWidget {
  final List<TrackingResult> result;
  final Function() onRefresh;
  final Function(TrackingResult) onTap;

  const MapDrawer({Key key, this.result, this.onRefresh, this.onTap})
      : super(key: key);
  @override
  _MapDrawerState createState() => _MapDrawerState();
}

class _MapDrawerState extends State<MapDrawer> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(
          top: 0.04.hp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 0.02.wp,
                right: 0.02.wp,
              ),
              child: Text(
                'List Kendaraan',
                style: TextStyle(
                  color: Color(
                    hexStringToHexInt('#6B6B6B'),
                  ),
                  fontSize: 60.ssp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.02.hp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 0.02.wp,
                      right: 0.02.wp,
                    ),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.result.length}',
                                style: TextStyle(
                                  color: Color(
                                    hexStringToHexInt('#FF5373'),
                                  ),
                                  fontSize: 40.ssp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' Dalam list',
                                style: TextStyle(
                                  color: Color(
                                    hexStringToHexInt('#6B6B6B'),
                                  ),
                                  fontSize: 40.ssp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Row(
                    children: [
                      Bubble(
                        elevation: 2,
                        color: Color(hexStringToHexInt('#C5FEF3')),
                        radius: Radius.circular(20),
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Image(
                                    width: 50.ssp,
                                    height: 50.ssp,
                                    image:
                                        AssetImage('assets/Asset 59300 1.png'),
                                  ),
                                ),
                                TextSpan(
                                  text: '  Sort',
                                  style: TextStyle(
                                    color: Color(
                                      hexStringToHexInt('#6B6B6B'),
                                    ),
                                    fontSize: 40.ssp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Bubble(
                        elevation: 2,
                        color: Color(hexStringToHexInt('#C5FEF3')),
                        radius: Radius.circular(20),
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Image(
                                    width: 50.ssp,
                                    height: 50.ssp,
                                    image: AssetImage('assets/Asset 52 1.png'),
                                  ),
                                ),
                                TextSpan(
                                  text: '  Filter',
                                  style: TextStyle(
                                    color: Color(
                                      hexStringToHexInt('#6B6B6B'),
                                    ),
                                    fontSize: 40.ssp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 0.02.hp,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return widget.onRefresh();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.result.map(
                      (TrackingResult e) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.01.hp, horizontal: 0.02.wp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.02.wp),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 2),
                                color: borderBox,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {
                              widget.onTap(e);
                            },
                            padding: EdgeInsets.symmetric(
                              vertical: 0.01.hp,
                              horizontal: 0.02.wp,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 0.11.hp,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          width: 0.14.wp,
                                          image: AssetImage(
                                            'assets/Asset 55300 1.png',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.01.hp,
                                        ),
                                        if (e.currentStatusVehicle.driving !=
                                            null)
                                          Text(
                                            '${e.nopol}',
                                            style: TextStyle(
                                              color: Color(
                                                hexStringToHexInt('#29D130'),
                                              ),
                                              fontSize: 35.ssp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        if (e.currentStatusVehicle.parking !=
                                            null)
                                          Text(
                                            '${e.nopol}',
                                            style: TextStyle(
                                              color: Color(
                                                hexStringToHexInt('#5E5858'),
                                              ),
                                              fontSize: 35.ssp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        if (e.currentStatusVehicle.idle != null)
                                          Text(
                                            '${e.nopol}',
                                            style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 35.ssp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 0.11.hp,
                                    ),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 50300 1.png',
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 0.01.wp,
                                                  ),
                                                  child: Text(
                                                    '${e.provinsi}',
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily: 'PlexSans',
                                                      fontSize: 30.ssp,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 67300 1.png',
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    left: 0.01.wp,
                                                  ),
                                                  child: Text(
                                                    '${e.addr}',
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontFamily: 'PlexSans',
                                                      fontSize: 30.ssp,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 76300 1.png',
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 0.01.wp,
                                                ),
                                                child: Text(
                                                  'ON',
                                                  softWrap: false,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                    fontFamily: 'PlexSans',
                                                    fontSize: 30.ssp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 0.11.hp,
                                    ),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Image(
                                                width: 40.ssp,
                                                image: AssetImage(
                                                  'assets/Asset 77300 1.png',
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 0.01.wp,
                                                ),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      (e.speed <= 60)
                                                          ? TextSpan(
                                                              text:
                                                                  '${e.speed}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'PlexSans',
                                                                fontSize:
                                                                    30.ssp,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                            )
                                                          : TextSpan(text: ''),
                                                      (e.speed > 60 &&
                                                              e.speed <= 100)
                                                          ? TextSpan(
                                                              text:
                                                                  '${e.speed}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'PlexSans',
                                                                fontSize:
                                                                    30.ssp,
                                                                color: Colors
                                                                    .amber,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )
                                                          : TextSpan(text: ''),
                                                      (e.speed > 100)
                                                          ? TextSpan(
                                                              text:
                                                                  '${e.speed}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'PlexSans',
                                                                fontSize:
                                                                    30.ssp,
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )
                                                          : TextSpan(text: ''),
                                                      TextSpan(
                                                        text: ' Km/H',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'PlexSans',
                                                          fontSize: 30.ssp,
                                                          color: textBlack,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        (e.currentStatusVehicle.driving != null)
                                            ? Container(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image(
                                                      width: 40.ssp,
                                                      image: AssetImage(
                                                        'assets/Asset 77300 2.png',
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                          left: 0.01.wp,
                                                        ),
                                                        child: Text(
                                                          '${e.currentStatusVehicle.driving.duration.text}',
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'PlexSans',
                                                            fontSize: 30.ssp,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        Container(
                                          child: Text(''),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
