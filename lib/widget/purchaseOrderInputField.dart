import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

class PurchaseOrderInputField extends StatefulWidget {
  @override
  final hintText;

  const PurchaseOrderInputField({Key key, this.hintText}) : super(key: key);
  _PurchaseOrderInputFieldState createState() =>
      _PurchaseOrderInputFieldState();
}

class _PurchaseOrderInputFieldState extends State<PurchaseOrderInputField> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.only(
        top: 0.02.hp,
      ),
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
      child: TextField(
        onTap: () {},
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(
            left: 0.02.wp,
            right: 0.02.wp,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                50.0,
              ),
            ),
            borderSide: BorderSide(
              color: Color(
                hexStringToHexInt(
                  '#5A4CF4',
                ),
              ),
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(50.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          errorStyle: TextStyle(
            height: 0,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
