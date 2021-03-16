import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';

class DeliveryOrderSelectField extends StatefulWidget {
  final title;
  final hint;
  final icon;
  final trackingTypeValue;
  final trackingTypeDropdown;
  final Function(dynamic) changeType;

  const DeliveryOrderSelectField({
    Key key,
    this.trackingTypeValue,
    this.trackingTypeDropdown,
    this.changeType,
    this.title,
    this.hint,
    this.icon = 'assets/Asset 48300 1.png',
  }) : super(key: key);
  @override
  _DeliveryOrderSelectFieldState createState() =>
      _DeliveryOrderSelectFieldState();
}

class _DeliveryOrderSelectFieldState extends State<DeliveryOrderSelectField> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.only(top: 0.04.wp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 0.02.wp,
                    ),
                    child: Image(
                      width: 0.05.wp,
                      image: AssetImage(
                        '${widget.icon}',
                      ),
                    ),
                  ),
                ),
                TextSpan(
                  text: '${widget.title}',
                  style: TextStyle(
                    color: purpleTheme,
                    fontSize: 45.ssp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 0.02.hp,
            ),
            padding: EdgeInsets.symmetric(horizontal: 0.02.wp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(
                hexStringToHexInt('#F9F9F9'),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 2),
                  color: borderBox,
                  blurRadius: 8,
                )
              ],
            ),
            child: DropdownButton(
              value: widget.trackingTypeValue,
              items: widget.trackingTypeDropdown,
              hint: Text('${widget.hint}'),
              onChanged: (value) {
                widget.changeType(value);
              },
              isExpanded: true,
              underline: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
