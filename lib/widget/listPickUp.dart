import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/model/PickUpModel.dart';
import '../const.dart';

class ListPickUp extends StatefulWidget {
  final Function() onPressed;
  final PickUp result;
  final String status;

  const ListPickUp({
    Key key,
    this.onPressed,
    this.result,
    this.status = 'On Progress',
  }) : super(key: key);
  @override
  _ListPickUpState createState() => _ListPickUpState();
}

class _ListPickUpState extends State<ListPickUp> {
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
                                'assets/Asset 68300 1.png',
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
                      if (widget.status == 'On Progress')
                        Container(
                          padding: EdgeInsets.all(
                            0.02.wp,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'PENDING',
                            style: TextStyle(
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (widget.status == 'Completed')
                        Container(
                          padding: EdgeInsets.all(
                            0.02.wp,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'COMPLETED',
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
                                'FROM',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.result.customer != null ? widget.result.customer.nama : widget.result.namaPengirim}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  '${widget.result.alamatPengirim}',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
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
                          'assets/Asset 87300.png',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ITEM',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${widget.result.keterangan}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  '${widget.result.berat} Kg | ${widget.result.koli} Koli',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                          'assets/Asset 85300.png',
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PICKUP TYPE',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  '${widget.result.tujuanId == null ? 'MULTI DROP' : 'MEMBER'}',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
