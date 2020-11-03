import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/trackingPositionModel.dart';

class TrackingItemList extends StatefulWidget {
  final TrackingResult result;

  const TrackingItemList({Key key, this.result}) : super(key: key);
  @override
  _TrackingItemListState createState() => _TrackingItemListState();
}

class _TrackingItemListState extends State<TrackingItemList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Row(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                if (widget.result.currentStatusVehicle.driving != null &&
                    widget.result.currentStatusVehicle.idle == null)
                  Text(
                    '${widget.result.nopol}',
                    style: TextStyle(
                      color: Color(
                        hexStringToHexInt('#29D130'),
                      ),
                      fontSize: 35.ssp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (widget.result.currentStatusVehicle.parking != null)
                  Text(
                    '${widget.result.nopol}',
                    style: TextStyle(
                      color: Color(
                        hexStringToHexInt('#5E5858'),
                      ),
                      fontSize: 35.ssp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (widget.result.currentStatusVehicle.idle != null)
                  Text(
                    '${widget.result.nopol}',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            '${widget.result.provinsi}',
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            '${widget.result.addr}',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
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
                          '${(widget.result.acc == 0) ? "Off" : "On"}',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              (widget.result.speed <= 60)
                                  ? TextSpan(
                                      text: '${widget.result.speed}',
                                      style: TextStyle(
                                        fontFamily: 'PlexSans',
                                        fontSize: 30.ssp,
                                        color: Colors.green,
                                      ),
                                    )
                                  : TextSpan(text: ''),
                              (widget.result.speed > 60 &&
                                      widget.result.speed <= 100)
                                  ? TextSpan(
                                      text: '${widget.result.speed}',
                                      style: TextStyle(
                                        fontFamily: 'PlexSans',
                                        fontSize: 30.ssp,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : TextSpan(text: ''),
                              (widget.result.speed > 100)
                                  ? TextSpan(
                                      text: '${widget.result.speed}',
                                      style: TextStyle(
                                        fontFamily: 'PlexSans',
                                        fontSize: 30.ssp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : TextSpan(text: ''),
                              TextSpan(
                                text: ' Km/H',
                                style: TextStyle(
                                  fontFamily: 'PlexSans',
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
                (widget.result.currentStatusVehicle.driving != null)
                    ? Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  '${widget.result.currentStatusVehicle.driving.duration.text}',
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
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
                      )
                    : Container(),
                (widget.result.currentStatusVehicle.parking != null)
                    ? Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  '${widget.result.currentStatusVehicle.parking.duration.text}',
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
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
    );
  }
}
