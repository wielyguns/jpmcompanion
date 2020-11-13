import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/locationPrediction.dart';

class RecentMapList extends StatelessWidget {
  final LocationPrediction result;
  final Function(dynamic) onPressed;

  const RecentMapList({Key key, this.result, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return FlatButton(
      onPressed: () {
        onPressed(result);
      },
      padding: EdgeInsets.all(0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 0.06.wp,
                right: 0.05.wp,
              ),
              child: Image(
                width: 0.06.wp,
                height: 0.06.wp,
                image: AssetImage(
                  'assets/Asset 1177300 1.png',
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 1.wp,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: borderBox,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        '${result.description}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 45.ssp,
                          fontFamily: "PlexSans",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        '${result.structuredFormatting.secondaryText}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 35.ssp,
                          fontFamily: "PlexSans",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
