import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';

import '../const.dart';

class NopolList extends StatefulWidget {
  final Function() onPressed;
  final Nopol result;

  const NopolList({Key key, this.onPressed, this.result}) : super(key: key);
  @override
  _NopolListState createState() => _NopolListState();
}

class _NopolListState extends State<NopolList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 0.01.hp,
      ),
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
          widget.onPressed();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 0.02.hp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 0.14.wp,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 0.03.hp,
                              child: VerticalDivider(
                                color: Color(
                                  hexStringToHexInt(
                                    '#FF5373',
                                  ),
                                ),
                                thickness: 0.015.wp,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  '${widget.result.nopol}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "PlexSans",
                                    fontSize: 50.ssp,
                                    color: Color(
                                      hexStringToHexInt(
                                        '#FF5373',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 0.01.hp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Kendaraan\n',
                                      style: TextStyle(
                                        fontSize: 35.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                        color: Color(
                                          hexStringToHexInt(
                                            '#736B6D',
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${widget.result.angkutan != null ? widget.result.angkutan.nama : "-"}',
                                      style: TextStyle(
                                        fontSize: 25.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                        color: Color(
                                          hexStringToHexInt(
                                            '#736B6D',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Cabang\n',
                                        style: TextStyle(
                                          fontSize: 35.ssp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PlexSans",
                                          color: Color(
                                            hexStringToHexInt(
                                              '#736B6D',
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${widget.result.cabang.nama}',
                                        style: TextStyle(
                                          fontSize: 25.ssp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PlexSans",
                                          color: Color(
                                            hexStringToHexInt(
                                              '#736B6D',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Divisi\n',
                                        style: TextStyle(
                                          fontSize: 35.ssp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PlexSans",
                                          color: Color(
                                            hexStringToHexInt(
                                              '#736B6D',
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${widget.result.divisi}',
                                        style: TextStyle(
                                          fontSize: 25.ssp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PlexSans",
                                          color: Color(
                                            hexStringToHexInt(
                                              '#736B6D',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
    );
  }
}
