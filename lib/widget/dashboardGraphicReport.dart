import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/widget/dashboardLineChart1.dart';

import '../const.dart';

class DashboardGraphicReport extends StatefulWidget {
  final title;
  final spots;

  const DashboardGraphicReport({Key key, this.title, this.spots})
      : super(key: key);
  @override
  _DashboardGraphicReportState createState() => _DashboardGraphicReportState();
}

class _DashboardGraphicReportState extends State<DashboardGraphicReport> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Card(
      elevation: 5,
      child: Container(
        width: 0.42.wp,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.01.hp,
                horizontal: 0.02.wp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.title}',
                    style: TextStyle(color: textGrey),
                  ),
                  Container(
                    width: 0.1.wp,
                    height: 0.1.wp,
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {},
                      elevation: 0,
                      color: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.ellipsisH,
                        color: textGrey,
                      ),
                      padding: EdgeInsets.all(0),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04.wp,
              ),
              child: LineChartSample5(allSpots: widget.spots),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 0.02.hp,
                bottom: 0.01.hp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: purpleLightTheme,
                          size: 45.ssp,
                        ),
                      ),
                      TextSpan(
                        text: '\nSept',
                        style: TextStyle(
                          color: textGrey,
                          fontFamily: 'PlexSans',
                        ),
                      )
                    ]),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: purpleChart,
                          size: 45.ssp,
                        ),
                      ),
                      TextSpan(
                        text: '\nOkt',
                        style: TextStyle(
                          color: textGrey,
                          fontFamily: 'PlexSans',
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
