import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/provider/listKotaViewModel.dart';
import 'package:stacked/stacked.dart';

class ListKotaView extends StatefulWidget {
  @override
  _ListKotaViewState createState() => _ListKotaViewState();
}

class _ListKotaViewState extends State<ListKotaView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ListKotaViewModel(),
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: model.scaffoldKey,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowGlow();
                    return;
                  },
                  child: NestedScrollView(
                    physics: (model.feedData.length == 0)
                        ? NeverScrollableScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),
                    headerSliverBuilder: (context, box) {
                      return [
                        SliverAppBar(
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
                            'Kota',
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
                                        color:
                                            Color(hexStringToHexInt('#F9F9F9')),
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
                                              onChanged: (value) {
                                                model.runFilter(value);
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'Filter Kota...',
                                                contentPadding: EdgeInsets.only(
                                                  left: 0.05.wp,
                                                  right: 0.12.wp,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(50.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Color(
                                                        hexStringToHexInt(
                                                            '#5A4CF4')),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(50.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
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
                          pinned: true,
                          flexibleSpace: Container(
                            alignment: Alignment.topRight,
                            width: 1.wp,
                            child: Image(
                              width: 0.5.wp,
                              image: AssetImage('assets/Asset 55300 1.png'),
                            ),
                          ),
                          expandedHeight: kToolbarHeight + 0.1.hp,
                        ),
                      ];
                    },
                    body: Container(
                        child: SingleChildScrollView(
                      physics: (model.feedData.length == 0)
                          ? NeverScrollableScrollPhysics()
                          : AlwaysScrollableScrollPhysics(),
                      child: (model.feedData.length != 0)
                          ? Column(
                              children: model.feedData.map<Widget>((Kota item) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.symmetric(),
                                  child: FlatButton(
                                    onPressed: () {
                                      model.selectedData(context, item);
                                    },
                                    child: Container(
                                      width: 1.wp,
                                      child: Text(
                                          '${item.prefix} ${item.nama} ${item.cabang != null ? '( ${item.cabang.nama} )' : ''}'),
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          : Container(
                              padding: EdgeInsets.all(0.1.hp),
                              alignment: Alignment.center,
                              width: 1.wp,
                              height: 1.hp,
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/Asset 1123300 1.png'),
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
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
