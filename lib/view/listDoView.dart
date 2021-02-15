import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/listDoViewModel.dart';
import 'package:jpmcompanion/widget/listDo.dart';
import 'package:stacked/stacked.dart';

class ListDoView extends StatefulWidget {
  final param;

  const ListDoView({Key key, this.param}) : super(key: key);
  @override
  _ListDoViewState createState() => _ListDoViewState();
}

class _ListDoViewState extends State<ListDoView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ListDoViewModel(),
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: model.scaffoldKey,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowAltCircleLeft,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'List Delivery Order',
              style: TextStyle(
                fontFamily: "PlexSans",
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.amber,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                width: 1.wp,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.amber, Colors.amber],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 0.07.hp,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.amber, Colors.amber],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                      height: 0.07.hp,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.white, Colors.white],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Container(
                        width: 1.wp,
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
                        margin: EdgeInsets.only(
                          left: 0.04.wp,
                          right: 0.04.wp,
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              width: 1.wp,
                              child: TextField(
                                onTap: () {},
                                controller: model.nomor,
                                onChanged: (value) {
                                  model.runFilter(value);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Filter Nopol...',
                                  contentPadding: EdgeInsets.only(
                                    left: 0.05.wp,
                                    right: 0.12.wp,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(50.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Color(
                                        hexStringToHexInt('#5A4CF4'),
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
                            Positioned(
                              right: 0.04.wp,
                              child: Container(
                                width: 0.07.wp,
                                alignment: Alignment.center,
                                child: MaterialButton(
                                  splashColor: purpleLightTheme,
                                  onPressed: () {},
                                  elevation: 0,
                                  color: Colors.white,
                                  child: Image(
                                    width: 0.07.wp,
                                    image: AssetImage(
                                      'assets/magnificient.png',
                                    ),
                                  ),
                                  padding: EdgeInsets.all(0),
                                  shape: CircleBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flexibleSpace: Container(
              alignment: Alignment.topRight,
              width: 1.wp,
              child: Image(
                width: 0.5.wp,
                image: AssetImage('assets/Asset 55300 1.png'),
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 0.02.hp,
                    horizontal: 0.02.wp,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 0.02.wp,
                          right: 0.02.wp,
                        ),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${oCcy.format(model.jumlahData)}',
                                    style: TextStyle(
                                      color: Color(
                                        hexStringToHexInt('#FF5373'),
                                      ),
                                      fontSize: 40.ssp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Data Dalam list',
                                    style: TextStyle(
                                      color: Color(
                                        hexStringToHexInt('#6B6B6B'),
                                      ),
                                      fontSize: 40.ssp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Bubble(
                              elevation: 2,
                              color: Color(hexStringToHexInt('#C5FEF3')),
                              radius: Radius.circular(20),
                              child: Container(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Image(
                                          width: 50.ssp,
                                          height: 50.ssp,
                                          image: AssetImage(
                                              'assets/Asset 59300 1.png'),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  Sort',
                                        style: TextStyle(
                                          color: Color(
                                            hexStringToHexInt('#6B6B6B'),
                                          ),
                                          fontSize: 40.ssp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Bubble(
                              elevation: 2,
                              color: Color(hexStringToHexInt('#C5FEF3')),
                              radius: Radius.circular(20),
                              child: Container(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Image(
                                          width: 50.ssp,
                                          height: 50.ssp,
                                          image: AssetImage(
                                              'assets/Asset 52 1.png'),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  Filter',
                                        style: TextStyle(
                                          color: Color(
                                            hexStringToHexInt('#6B6B6B'),
                                          ),
                                          fontSize: 40.ssp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (model.deliveryOrder.length == 0 && model.isBusy)
                  Container(
                    child: CircularProgressIndicator(),
                  ),
                if (model.deliveryOrder.length == 0 && !model.isBusy)
                  Expanded(
                    child: Container(
                      width: 1.wp,
                      padding: EdgeInsets.all(0.1.hp),
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/Asset 1123300 1.png'),
                            ),
                            SizedBox(
                              height: 0.02.hp,
                            ),
                            Container(
                              width: 1.wp,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Data Tidak Tersedia\n',
                                      style: TextStyle(
                                        color: Color(
                                          hexStringToHexInt('#737373'),
                                        ),
                                        fontSize: 60.ssp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Data yang anda cari tidak ditemukan atau salah',
                                      style: TextStyle(
                                        color: Color(
                                          hexStringToHexInt('#B8B8B8'),
                                        ),
                                        fontSize: 40.ssp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (model.deliveryOrder.length != 0)
                  Expanded(
                    child: Container(
                      width: 1.wp,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowGlow();
                          return;
                        },
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            controller: model.scrollController,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.04.wp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: model.deliveryOrder
                                    .asMap()
                                    .entries
                                    .map<Widget>((e) {
                                  if (e.key == model.deliveryOrder.length - 1) {
                                    return Container(
                                      width: 1.wp,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 1.wp,
                                            child: ListDo(
                                              result: e.value,
                                              onPressed: () {
                                                if (widget.param['route'] ==
                                                    doDetailRoute) {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    doDetailRoute,
                                                    arguments: e.value,
                                                  );
                                                } else {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    trackingDoRoute,
                                                    arguments: e.value,
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          if (model.isBusy)
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: 0.02.hp,
                                              ),
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return ListDo(
                                      result: e.value,
                                      onPressed: () {
                                        if (widget.param['route'] ==
                                            doDetailRoute) {
                                          Navigator.of(context).pushNamed(
                                            doDetailRoute,
                                            arguments: e.value,
                                          );
                                        } else {
                                          Navigator.of(context).pushNamed(
                                            trackingDoRoute,
                                            arguments: e.value,
                                          );
                                        }
                                      },
                                    );
                                  }
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
