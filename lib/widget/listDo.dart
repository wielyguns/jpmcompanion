import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';

import '../const.dart';

class ListDo extends StatefulWidget {
  final Function() onPressed;
  final DeliveryOrder result;

  const ListDo({
    Key key,
    this.onPressed,
    this.result,
  }) : super(key: key);
  @override
  _ShippingOrderListState createState() => _ShippingOrderListState();
}

class _ShippingOrderListState extends State<ListDo> {
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
        onLongPress: () {
          Clipboard.setData(
            ClipboardData(text: '${widget.result.nomor}'),
          );
          messageToast('Kode disalin', textBlack);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 0.02.hp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.result.pendapatan == 'KARGO')
                Container(
                  constraints: BoxConstraints(
                    minHeight: 0.14.wp,
                  ),
                  child: Image(
                    width: 0.14.wp,
                    image: AssetImage(
                      'assets/Asset 55300 1.png',
                    ),
                  ),
                ),
              if (widget.result.pendapatan == 'PAKET')
                Container(
                  constraints: BoxConstraints(
                    minHeight: 0.14.wp,
                  ),
                  child: Image(
                    width: 0.14.wp,
                    image: AssetImage(
                      'assets/Asset 57300 1.png',
                    ),
                  ),
                ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 0.14.wp,
                  ),
                  margin: EdgeInsets.only(
                    left: 0.04.wp,
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
                                  '${widget.result.nomor}',
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
                            ),
                            Container(
                              child: Text('${widget.result.tanggal}'),
                            ),
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
                                      text: 'Asal\n',
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
                                      text: '${widget.result.asal.nama}',
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
                                        text: 'Tujuan\n',
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
                                        text: '${widget.result.tujuan.nama}',
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
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Harga\n',
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
                                            '${oCcy.format(int.parse(widget.result.totalNet))}',
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
