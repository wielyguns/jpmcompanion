import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/model/courierModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'dart:ui' as ui;

import '../const.dart';

class CourierList extends StatefulWidget {
  final Function() onPressed;
  final Courier result;

  const CourierList({Key key, this.onPressed, this.result}) : super(key: key);
  @override
  _CourierListState createState() => _CourierListState();
}

class _CourierListState extends State<CourierList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.01.hp),
      child: FlatButton(
        onPressed: () {
          widget.onPressed();
        },
        onLongPress: () {
          Clipboard.setData(
            ClipboardData(text: '${widget.result.kode}'),
          );
          messageToast('Kode disalin', textBlack);
        },
        child: Container(
          width: 1.wp,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 0.02.hp,
              horizontal: 0.02.wp,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    2,
                  ),
                  color: Color(
                    hexStringToHexInt(
                      '#dfebff',
                    ),
                  ),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.02.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(
                                'assets/Asset 91300 1.png',
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${widget.result.kode}',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          0.02.wp,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'ACTIVE',
                          style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.blue[50],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.02.wp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                          'assets/Asset 50300 1.png',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NAMA',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.result.nama}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.02.wp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                          'assets/Asset 86300.png',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TELPON',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.result.telpon}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.02.wp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Icon(
                          FontAwesomeIcons.route,
                          size: 55.ssp,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RUTE',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.result.rute}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
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
      ),
    );
  }
}
