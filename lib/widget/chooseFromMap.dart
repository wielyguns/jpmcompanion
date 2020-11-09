import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';

class ChooseFromMap extends StatelessWidget {
  final Function() onPressed;

  const ChooseFromMap({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            spreadRadius: 0,
            blurRadius: 1,
            color: textGrey,
          )
        ],
      ),
      child: FlatButton(
        onPressed: () {
          onPressed();
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
                    'assets/Asset 67300 1.png',
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
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          'Choose On Map',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 45.ssp,
                            fontFamily: "PlexSans",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
