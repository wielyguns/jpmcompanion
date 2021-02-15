import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/PickUpModel.dart';
import '../const.dart';

class ListPickUp extends StatefulWidget {
  final Function() onPressed;
  final PickUp result;

  const ListPickUp({
    Key key,
    this.onPressed,
    this.result,
  }) : super(key: key);
  @override
  _ListPickUpState createState() => _ListPickUpState();
}

class _ListPickUpState extends State<ListPickUp> {
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
            ClipboardData(text: '${widget.result.kode}'),
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
                            Expanded(
                              child: Container(
                                child: Text(
                                  '${widget.result.kode}',
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
                        child: Row(
                          children: [
                            (widget.result.customer == null)
                                ? Expanded(
                                    child: Container(
                                      child: Text(
                                        '${widget.result.namaPengirim}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "PlexSans",
                                          fontSize: 50.ssp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Container(
                                      child: Text(
                                        '${widget.result.customer.nama}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "PlexSans",
                                          fontSize: 50.ssp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 0.02.hp),
                        child: Text(
                          'Waktu Sampai Status Failure',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.red,
                          ),
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
                                      text:
                                          '${(widget.result.asal != null) ? widget.result.asal.nama : 'Tidak ada asal'}',
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
                                        text:
                                            '${(widget.result.tujuan != null) ? widget.result.tujuan.nama : 'Tidak ada asal'}',
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
