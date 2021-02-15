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
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
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
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Pick Up Order : ${widget.result.kode}',
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
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 0.02.hp),
                        child: Text(
                          'Nama Pengirim',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
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
                                          fontSize: 35.ssp,
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
                                          fontSize: 35.ssp,
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
                          'Waktu Order',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.result.createdAt}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 0.02.hp),
                        child: Text(
                          'Alamat Pickup',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.result.alamatPengirim}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 0.02.hp),
                        child: Text(
                          'Telpon',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.result.telponPengirim}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: "PlexSans",
                            fontSize: 35.ssp,
                            color: Colors.grey,
                          ),
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
