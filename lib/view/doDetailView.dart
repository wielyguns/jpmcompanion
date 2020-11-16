import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/provider/doDetailViewModel.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class DoDetailView extends StatefulWidget {
  final DeliveryOrder param;

  const DoDetailView({Key key, this.param}) : super(key: key);
  @override
  _DoDetailViewState createState() => _DoDetailViewState();
}

class _DoDetailViewState extends State<DoDetailView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DoDetailViewModel(),
      onModelReady: (model) => model.init(context, widget.param),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: model.isBusy,
        showLoadingScreen: false,
        child: GestureDetector(
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
                              'Delivery Order Detail',
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
                                      height: 0.05.hp,
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
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 0.04.hp),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 0.03.hp,
                                                    child: VerticalDivider(
                                                      color: Color(
                                                        hexStringToHexInt(
                                                          '#FF5373',
                                                        ),
                                                      ),
                                                      thickness: 0.015.wp,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        '${widget.param.nomor}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "PlexSans",
                                                          fontSize: 50.ssp,
                                                          color: Color(
                                                            hexStringToHexInt(
                                                              '#FF5373',
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
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: 0.01.hp,
                                                horizontal: 0.02.wp,
                                              ),
                                              child: RaisedButton(
                                                color: purpleTheme,
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    trackingDoRoute,
                                                    arguments: widget.param,
                                                  );
                                                },
                                                child: Container(
                                                  child: Text(
                                                    'Lacak Do',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 50.ssp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "PlexSans",
                                                    ),
                                                  ),
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
                            ),
                            pinned: true,
                            flexibleSpace: Container(
                              alignment: Alignment.topRight,
                              width: 1.wp,
                              child: Image(
                                width: 0.5.wp,
                                image: AssetImage('assets/Asset 57300 1.png'),
                              ),
                            ),
                            expandedHeight: kToolbarHeight + 0.1.hp,
                          ),
                        ];
                      },
                      body: Container(
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                  ),
                                  color: Color(
                                    hexStringToHexInt('#F5F5F5'),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 0.01.hp,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Nomor Delivery order',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 40.ssp,
                                                  color: textGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlexSans",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '${widget.param.nomor}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 40.ssp,
                                                  color: textGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlexSans",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 0.01.hp,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Status',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 40.ssp,
                                                  color: textGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlexSans",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '${(widget.param.tracking != null) ? widget.param.tracking.status : "-"}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 40.ssp,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlexSans",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 0.01.hp,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Tanggal',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 40.ssp,
                                                  color: textGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlexSans",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '${DateFormat('d MMMM y').format(DateTime.parse(widget.param.tanggal))}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 40.ssp,
                                                  color: textGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "PlexSans",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.02.hp,
                                  ),
                                  width: 1.wp,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Pengirim/Sender',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.namaPengirim}',
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Penerima/Recipient',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.namaPenerima}',
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.02.hp,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Tipe/Type',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  'KILOGRAM',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Jenis/Category',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  'REGULER',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.02.hp,
                                  ),
                                  width: 1.wp,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Asal',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.asal.nama}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Tujuan',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.tujuan.nama}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.02.hp,
                                  ),
                                  width: 1.wp,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Alamat Penerima/Recipient Address',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.alamatPenerima}',
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.02.hp,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Outlet',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${(widget.param.agen != null) ? widget.param.agen.nama : '-'}',
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Cabang',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.cabang.nama}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.02.hp,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Jumlah',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.jumlah} ${widget.param.kodeSatuan}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 0.5.wp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Deskripsi',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.01.hp,
                                              ),
                                              Container(
                                                child: Text(
                                                  '${widget.param.deskripsi}',
                                                  style: TextStyle(
                                                    fontSize: 40.ssp,
                                                    color: textGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "PlexSans",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image(
                                          width: 0.1.wp,
                                          image: AssetImage(
                                            'assets/Asset 61300 2.png',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 0.05.wp),
                                        child: Text(
                                          'Informasi Transaksi',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 50.ssp,
                                            fontWeight: FontWeight.bold,
                                            color: Color(
                                              hexStringToHexInt('#505050'),
                                            ),
                                            fontFamily: "PlexSans",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 0.05.wp,
                                    vertical: 0.1.wp,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tarif Dasar',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.tarifDasar != null) ? oCcy.format(int.parse(widget.param.tarifDasar)) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tarif Out Of Area',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.tarifPenerus != null) ? oCcy.format(int.parse(widget.param.tarifPenerus)) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biaya Komisi',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.biayaKomisi != null) ? oCcy.format(widget.param.biayaKomisi) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biaya Tambahan',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.biayaTambahan != null) ? oCcy.format(widget.param.biayaTambahan) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Diskon',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.diskon != null) ? oCcy.format(widget.param.diskon) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'DPP',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.totalDpp != null) ? oCcy.format(widget.param.totalDpp) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Vendor',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.totalVendo != null) ? oCcy.format(widget.param.totalVendo) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 0.5.wp,
                                              child: Divider(
                                                color: borderBox,
                                                thickness: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 0.02.wp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Netto',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${(widget.param.totalNet != null) ? oCcy.format(int.parse(widget.param.totalNet)) : 0}',
                                              style: TextStyle(
                                                fontSize: 40.ssp,
                                                color: textGrey,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PlexSans",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
