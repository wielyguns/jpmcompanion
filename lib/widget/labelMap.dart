import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';

class LabelMap extends StatelessWidget {
  final title;
  final lat;
  final long;
  final margin;
  final bool divider;
  const LabelMap({
    Key key,
    this.title,
    this.lat,
    this.long,
    this.margin,
    this.divider = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      child: Row(
        children: [
          Container(
            margin: margin,
            width: 0.3.wp,
            height: 0.06.hp,
            child: FlatButton(
              padding: EdgeInsets.all(0.01.wp),
              onPressed: () {},
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '$title',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 35.ssp,
                          fontFamily: "PlexSans",
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$lat,$long',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 35.ssp,
                          fontFamily: "PlexSans",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (divider)
            VerticalDivider(
              color: textGrey,
            ),
        ],
      ),
    );
  }
}
