import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

class DashboardCard extends StatefulWidget {
  final total;
  final title;
  final color;
  final margin;

  const DashboardCard({
    Key key,
    this.total,
    this.title,
    this.color,
    this.margin,
  }) : super(key: key);
  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(offset: Offset(1, 3), blurRadius: 10, color: borderBox)
        ],
      ),
      width: 0.3.wp,
      padding: EdgeInsets.only(
        top: 0.02.hp,
        bottom: 0.01.hp,
        right: 0.02.wp,
        left: 0.02.wp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: 0.08.wp,
                  image: AssetImage(
                    'assets/Asset 45300 1.png',
                  ),
                ),
                Container(
                  child: Text(
                    '${oCcy.format((widget.total != null) ? widget.total : 0)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PlexSans",
                      fontSize: 45.ssp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.02.hp),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "PlexSans",
                fontSize: 35.ssp,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.02.hp),
            height: 20,
            alignment: Alignment.topRight,
            width: double.infinity,
            child: Container(
              width: 0.18.wp,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                color: Colors.white,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  'Lihat Detail',
                  style: TextStyle(
                    color: textGrey,
                    fontFamily: "PlexSans",
                    fontSize: 30.ssp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
