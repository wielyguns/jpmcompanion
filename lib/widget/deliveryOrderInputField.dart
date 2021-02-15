import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

class DeliveryOrderInputField extends StatefulWidget {
  final hintText;
  final readOnly;
  final Function onTap;
  final TextEditingController controller;
  final String errorMessage;
  final String title;
  final String icon;
  final int maxLines;
  final bool withAlternativeButton;
  final TextInputType keyboard;
  final Function onTapAlternativeButton;
  final void Function(dynamic) onChanged;
  const DeliveryOrderInputField({
    Key key,
    this.hintText,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.errorMessage = '',
    this.maxLines = 1,
    this.title,
    this.icon = 'assets/Asset 48300 1.png',
    this.withAlternativeButton = false,
    this.onTapAlternativeButton,
    this.keyboard = TextInputType.multiline,
    this.onChanged,
  }) : super(key: key);
  _DeliveryOrderInputFieldState createState() =>
      _DeliveryOrderInputFieldState();
}

class _DeliveryOrderInputFieldState extends State<DeliveryOrderInputField> {
  String validation = '';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.only(top: 0.02.hp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
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
                              height: 0.05.wp,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Stack(
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
                                onChanged: (value) async {
                                  if (widget.onChanged != null) {
                                    widget.onChanged(value);
                                  }
                                },
                                readOnly: widget.readOnly,
                                maxLines: widget.maxLines,
                                keyboardType: widget.keyboard,
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

                                    if (widget.errorMessage == 'ignore') {
                                      validation = 'ignore';
                                    }

                                    if (validation != '' &&
                                        validation != 'ignore') {
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
                                    right: (widget.withAlternativeButton)
                                        ? 0.1.wp
                                        : 0.02.wp,
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
                            if (widget.withAlternativeButton)
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: IconButton(
                                  color: textGrey,
                                  splashRadius: 30,
                                  icon: Icon(
                                    Icons.qr_code,
                                  ),
                                  onPressed: () {
                                    widget.onTapAlternativeButton();
                                  },
                                ),
                              )
                          ],
                        ),
                      ),
                      (validation != '' && validation != 'ignore')
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
