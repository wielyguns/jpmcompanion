import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

class ShippingOrderInputField extends StatefulWidget {
  final hintText;
  final readOnly;
  final Function onTap;
  final TextEditingController controller;
  final String errorMessage;
  const ShippingOrderInputField({
    Key key,
    this.hintText,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.errorMessage = '',
  }) : super(key: key);
  _ShippingOrderInputFieldState createState() =>
      _ShippingOrderInputFieldState();
}

class _ShippingOrderInputFieldState extends State<ShippingOrderInputField> {
  String validation = '';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
          child: TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            validator: (value) {
              if (mounted) {
                if (value == '') {
                  setState(() {
                    validation = 'Field ini harus diisi';
                  });
                } else {
                  setState(() {
                    if (widget.errorMessage != '') {
                      validation = widget.errorMessage;
                    } else {
                      validation = '';
                    }
                  });
                }

                if (validation != '') {
                  return '';
                }
              }
              return null;
            },
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
            onTap: () {
              widget.onTap();
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: borderBox,
              ),
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
        ),
        (validation != '')
            ? Text(
                '$validation',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40.ssp,
                  fontFamily: 'PlexSans',
                ),
              )
            : Container()
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
