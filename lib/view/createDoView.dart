import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/provider/createDoViewModel.dart';
import 'package:jpmcompanion/widget/deliveryOrderSelectField.dart';
import 'package:jpmcompanion/widget/deliveryOrderInputField.dart';
import 'package:jpmcompanion/widget/deliveryOrderInputMaskedField.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class CreateDoView extends StatefulWidget {
  @override
  _CreateDoViewState createState() => _CreateDoViewState();
}

class _CreateDoViewState extends State<CreateDoView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder<CreateDoViewModel>.reactive(
      viewModelBuilder: () => CreateDoViewModel(),
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: model.isBusy,
        showFrostedScreen: model.isBusy,
        showLoadingScreen: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            child: Scaffold(
              key: model.scaffoldKey,
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
                  'Delivery Order',
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
              body: DoubleBackToCloseApp(
                snackBar: const SnackBar(
                  content: Text('Tap lagi untuk keluar dari halaman'),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: textGrey,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      width: 1.wp,
                      constraints: BoxConstraints(maxHeight: 0.13.hp),
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowGlow();
                          return;
                        },
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            GestureDetector(
                              onTap: () => model.jumpToPage(0),
                              child: TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                isFirst: true,
                                indicatorStyle: (model.page >= 0)
                                    ? model.completeTracking(context)
                                    : model.onProgressTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: (model.page >= 1)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (model.page >= 1)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Pengirim',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: purpleTheme,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.jumpToPage(1),
                              child: TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                indicatorStyle: (model.page >= 1)
                                    ? model.completeTracking(context)
                                    : model.onProgressTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: (model.page >= 1)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (model.page >= 2)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Penerima',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: purpleTheme,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.jumpToPage(2),
                              child: TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                indicatorStyle: (model.page >= 2)
                                    ? model.completeTracking(context)
                                    : model.onProgressTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: (model.page >= 2)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (model.page >= 3)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Paket',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: purpleTheme,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PlexSans",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.jumpToPage(3),
                              child: TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                isLast: true,
                                indicatorStyle: (model.page >= 3)
                                    ? model.completeTracking(context)
                                    : model.onProgressTracking(context),
                                beforeLineStyle: LineStyle(
                                  color: (model.page >= 3)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (model.page >= 4)
                                      ? purpleTheme
                                      : borderBox,
                                  thickness: 6,
                                ),
                                startChild: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: 0.33.wp,
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Harga',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: purpleTheme,
                                        fontSize: 40.ssp,
                                        fontWeight: FontWeight.bold,
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
                    ),
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowGlow();
                          return;
                        },
                        child: PageView(
                          controller: model.pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Form(
                              key: model.formPengirimKey,
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.only(top: 0.02.hp),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.04.wp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.1.wp,
                                                ),
                                                child: Image(
                                                  width: 0.1.wp,
                                                  image: AssetImage(
                                                    'assets/Asset 61300 1.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Pengirim",
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: purpleTheme,
                                                fontSize: 50.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Delivery Order',
                                        icon: 'assets/Asset 47300 2.png',
                                        hintText: '5454645',
                                        readOnly: true,
                                        controller: model.nomor,
                                        errorMessage: 'ignore',
                                        withAlternativeButton: false,
                                        onTap: () {},
                                        onTapAlternativeButton: () {
                                          model.scanQr(context, 'nomor');
                                        },
                                      ),
                                      DeliveryOrderInputField(
                                        readOnly: true,
                                        title: 'Tanggal',
                                        icon: 'assets/Asset 1177300 1.png',
                                        hintText:
                                            '${DateFormat("d/m/y").format(DateTime.now())}',
                                        controller: model.tanggal,
                                        errorMessage: model.tanggalError,
                                        onTap: () {
                                          model.changeDate(context);
                                        },
                                      ),
                                      DeliveryOrderInputField(
                                        readOnly: true,
                                        title: 'Asal',
                                        icon: 'assets/Asset 50300 1.png',
                                        hintText: 'KOTA SURABAYA',
                                        controller: model.asal,
                                        errorMessage: model.asalError,
                                        onTap: () {
                                          model.selectCity(context, 'asal');
                                        },
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Customer',
                                        readOnly: true,
                                        icon: 'assets/Asset 51300 1.png',
                                        withAlternativeButton: true,
                                        hintText: 'PT JAWA PRATAMA MANDIRI',
                                        controller: model.customer,
                                        errorMessage: model.customerError,
                                        onTapAlternativeButton: () {
                                          model.scanQr(context, 'customer');
                                        },
                                        onTap: () {
                                          model.selectCustomer(context);
                                        },
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Nama Pengirim',
                                        icon: 'assets/Asset 51300 1.png',
                                        hintText: '5454645',
                                        controller: model.pengirim,
                                        errorMessage: model.pengirimError,
                                        onTap: () {},
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Telp Customer',
                                        icon: 'assets/Asset 51300 1.png',
                                        hintText: '089898998989',
                                        controller: model.telpPengirim,
                                        errorMessage: model.telpPengirimError,
                                        onTap: () {},
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Alamat Customer',
                                        icon: 'assets/Asset 68300 1.png',
                                        hintText: 'Jl Majapahit',
                                        controller: model.alamatPengirim,
                                        errorMessage: model.alamatPengirimError,
                                        maxLines: 1,
                                        onTap: () {},
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 0.04.hp,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(),
                                            RaisedButton(
                                              color: Color(
                                                hexStringToHexInt('#C5FEF3'),
                                              ),
                                              onPressed: () {
                                                model.changePage('next');
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        right: 0.02.wp,
                                                      ),
                                                      child: Text(
                                                        'Selanjutnya',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "PlexSans",
                                                          color: Color(
                                                            hexStringToHexInt(
                                                              '#736B6D',
                                                            ),
                                                          ),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Image(
                                                        width: 0.05.wp,
                                                        image: AssetImage(
                                                          'assets/Asset 53300 3.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: model.formPenerimaKey,
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.only(top: 0.02.hp),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.04.wp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.1.wp,
                                                ),
                                                child: Image(
                                                  width: 0.1.wp,
                                                  image: AssetImage(
                                                    'assets/Asset 61300 1.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Penerima",
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: purpleTheme,
                                                fontSize: 50.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      DeliveryOrderInputField(
                                        readOnly: true,
                                        title: 'Tujuan',
                                        icon: 'assets/Asset 47300 2.png',
                                        hintText: 'KAB. MALANG',
                                        controller: model.tujuan,
                                        errorMessage: model.tujuanError,
                                        onTap: () {
                                          model.selectCity(context, 'tujuan');
                                        },
                                      ),
                                      if (model.tujuan.text != '')
                                        DeliveryOrderSelectField(
                                          title: 'Kecamatan',
                                          trackingTypeDropdown: model.kecamatan,
                                          trackingTypeValue:
                                              model.kecamatanValue,
                                          changeType: (value) {
                                            model.changeKecamatan(value);
                                          },
                                        ),
                                      DeliveryOrderInputField(
                                        title: 'Nama Penerima',
                                        icon: 'assets/Asset 50300 1.png',
                                        hintText: 'PT Jawa Pratama Mandiri',
                                        controller: model.penerima,
                                        errorMessage: model.penerimaError,
                                        onTap: () {},
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Telp Penerima',
                                        icon: 'assets/Asset 51300 1.png',
                                        hintText: '089898998989',
                                        controller: model.telpPenerima,
                                        errorMessage: model.telpPenerimaError,
                                        keyboard: TextInputType.number,
                                        onTap: () {},
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Alamat Penerima',
                                        icon: 'assets/Asset 68300 1.png',
                                        hintText: 'Jl Majapahit',
                                        controller: model.alamatPenerima,
                                        errorMessage: model.alamatPenerimaError,
                                        maxLines: 1,
                                        onTap: () {},
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 0.04.hp,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RaisedButton(
                                              color: Color(
                                                hexStringToHexInt('#FEC5C5'),
                                              ),
                                              onPressed: () {
                                                model.changePage('previous');
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        right: 0.02.wp,
                                                      ),
                                                      child: Image(
                                                        width: 0.05.wp,
                                                        image: AssetImage(
                                                          'assets/Asset 53300 1.png',
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Kembali',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "PlexSans",
                                                          color: Color(
                                                            hexStringToHexInt(
                                                              '#736B6D',
                                                            ),
                                                          ),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                            RaisedButton(
                                              color: Color(
                                                hexStringToHexInt('#C5FEF3'),
                                              ),
                                              onPressed: () {
                                                model.changePage('next');
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        right: 0.02.wp,
                                                      ),
                                                      child: Text(
                                                        'Selanjutnya',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "PlexSans",
                                                          color: Color(
                                                            hexStringToHexInt(
                                                              '#736B6D',
                                                            ),
                                                          ),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Image(
                                                        width: 0.05.wp,
                                                        image: AssetImage(
                                                          'assets/Asset 53300 3.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: model.formPaketKey,
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.only(top: 0.02.hp),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.04.wp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.1.wp,
                                                ),
                                                child: Image(
                                                  width: 0.1.wp,
                                                  image: AssetImage(
                                                    'assets/Asset 61300 1.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Paket",
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: purpleTheme,
                                                fontSize: 50.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Nama Item',
                                        icon: 'assets/Asset 47300 2.png',
                                        hintText: 'PS5',
                                        controller: model.namaItem,
                                        errorMessage: model.namaItemError,
                                        onTap: () {},
                                      ),
                                      Container(
                                        width: 1.wp,
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: DeliveryOrderSelectField(
                                                title: 'Type Kiriman',
                                                trackingTypeDropdown:
                                                    model.typeKiriman,
                                                trackingTypeValue:
                                                    model.typeKirimanValue,
                                                changeType: (value) {
                                                  model
                                                      .changeTypeKiriman(value);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 0.04.wp,
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: DeliveryOrderSelectField(
                                                title: 'Jenis Kiriman',
                                                hint: 'Pilih jenis kiriman',
                                                trackingTypeDropdown:
                                                    model.jenisKiriman,
                                                trackingTypeValue:
                                                    model.jenisKirimanValue,
                                                changeType: (value) {
                                                  model.changeJenisKiriman(
                                                      value);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (model.jenisKirimanValue == 'RITEL')
                                        DeliveryOrderSelectField(
                                          title: 'Service Express',
                                          hint: 'Pilih service express',
                                          trackingTypeDropdown:
                                              model.serviceExpress,
                                          trackingTypeValue:
                                              model.serviceExpressValue,
                                          changeType: (value) {
                                            model.changeJenisExpress(value);
                                          },
                                        ),
                                      if (model.typeKirimanValue == 'KILOGRAM')
                                        Container(
                                          width: 1.wp,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: DeliveryOrderInputField(
                                                  title: 'Berat',
                                                  icon:
                                                      'assets/Asset 85300.png',
                                                  hintText: '23',
                                                  controller: model.berat,
                                                  errorMessage:
                                                      model.beratError,
                                                  keyboard:
                                                      TextInputType.number,
                                                  onTap: () {},
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.04.wp,
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: DeliveryOrderInputField(
                                                  title: 'Koli',
                                                  icon:
                                                      'assets/Asset 85300.png',
                                                  hintText: '1',
                                                  keyboard:
                                                      TextInputType.number,
                                                  controller: model.koli,
                                                  errorMessage: model.koliError,
                                                  onTap: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (model.typeKirimanValue == 'DOKUMEN' ||
                                          model.typeKirimanValue == 'SEPEDA')
                                        DeliveryOrderInputField(
                                          title: 'Jumlah',
                                          icon: 'assets/Asset 47300 2.png',
                                          hintText: '4',
                                          controller: model.jumlah,
                                          keyboard: TextInputType.number,
                                          errorMessage: model.jumlahError,
                                          onTap: () {},
                                        ),
                                      if (model.typeKirimanValue == 'SEPEDA')
                                        Column(
                                          children: model.sepeda
                                              .asMap()
                                              .entries
                                              .map<Widget>((e) {
                                            DeliveryOrderSepeda param = e.value;
                                            return Container(
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child:
                                                        DeliveryOrderSelectField(
                                                      title: 'Jenis Sepeda',
                                                      hint:
                                                          'Pilih jenis kiriman',
                                                      trackingTypeDropdown:
                                                          model.jenisSepeda,
                                                      trackingTypeValue:
                                                          param.jenis,
                                                      changeType: (value) {
                                                        model.changeJenisSepeda(
                                                          e.key,
                                                          value,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 0.04.wp,
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child:
                                                        DeliveryOrderInputField(
                                                      title: 'Berat',
                                                      icon:
                                                          'assets/Asset 85300.png',
                                                      hintText: '23',
                                                      onChanged: (value) {
                                                        model.changeBeratSepeda(
                                                          e.key,
                                                          value,
                                                        );
                                                      },
                                                      keyboard:
                                                          TextInputType.number,
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      if (model.pageController != null)
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 0.04.hp,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RaisedButton(
                                                color: Color(
                                                  hexStringToHexInt('#FEC5C5'),
                                                ),
                                                onPressed: () {
                                                  model.changePage('previous');
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          right: 0.02.wp,
                                                        ),
                                                        child: Image(
                                                          width: 0.05.wp,
                                                          image: AssetImage(
                                                            'assets/Asset 53300 1.png',
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Kembali',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "PlexSans",
                                                            color: Color(
                                                              hexStringToHexInt(
                                                                '#736B6D',
                                                              ),
                                                            ),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                              ),
                                              RaisedButton(
                                                color: Color(
                                                  hexStringToHexInt('#C5FEF3'),
                                                ),
                                                onPressed: () {
                                                  model.changePage('next');
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          right: 0.02.wp,
                                                        ),
                                                        child: Text(
                                                          'Selanjutnya',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "PlexSans",
                                                            color: Color(
                                                              hexStringToHexInt(
                                                                '#736B6D',
                                                              ),
                                                            ),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Image(
                                                          width: 0.05.wp,
                                                          image: AssetImage(
                                                            'assets/Asset 53300 3.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: model.formHargaKey,
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.only(top: 0.02.hp),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.04.wp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: 0.1.wp,
                                                ),
                                                child: Image(
                                                  width: 0.1.wp,
                                                  image: AssetImage(
                                                    'assets/Asset 61300 1.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Harga",
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: purpleTheme,
                                                fontSize: 50.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      DeliveryOrderInputMaskedField(
                                        title: 'Tarif Dasar',
                                        readOnly: true,
                                        icon: 'assets/Asset 47300 2.png',
                                        hintText: 'Rp. 50.000',
                                        controller: model.tarifDasar,
                                        errorMessage: model.tarifDasarError,
                                        keyboard: TextInputType.number,
                                        onTap: () {},
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Tarif Penerus',
                                        icon: 'assets/Asset 47300 2.png',
                                        hintText: 'Rp. 50.000',
                                        controller: model.tarifPenerus,
                                        errorMessage: model.tarifPenerusError,
                                        keyboard: TextInputType.number,
                                        onChanged: (value) {
                                          model.updateTarif(
                                            'tarifPenerus',
                                            value,
                                          );
                                        },
                                        onTap: () {},
                                      ),
                                      DeliveryOrderInputField(
                                        title: 'Tarif Tambahan',
                                        icon: 'assets/Asset 47300 2.png',
                                        hintText: 'Rp. 50.000',
                                        controller: model.tarifTambahan,
                                        keyboard: TextInputType.number,
                                        onChanged: (value) {
                                          model.updateTarif(
                                            'tarifTambahan',
                                            value,
                                          );
                                        },
                                        onTap: () {},
                                      ),
                                      Container(
                                        width: 1.wp,
                                        child: Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: DeliveryOrderInputField(
                                                title: 'Diskon %',
                                                icon: 'assets/Asset 85300.png',
                                                hintText: '23',
                                                controller: model.diskonPersen,
                                                keyboard: TextInputType.number,
                                                onChanged: (value) {
                                                  model.kalkulasiDiskon(
                                                      'persen');
                                                },
                                                onTap: () {},
                                              ),
                                            ),
                                            SizedBox(
                                              width: 0.04.wp,
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: DeliveryOrderInputField(
                                                title: 'Diskon Rp',
                                                icon: 'assets/Asset 85300.png',
                                                hintText: '1',
                                                keyboard: TextInputType.number,
                                                controller: model.diskonRp,
                                                onChanged: (value) {
                                                  model.kalkulasiDiskon(
                                                    'nominal',
                                                  );
                                                },
                                                onTap: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 0.1.wp,
                                          bottom: 0.1.wp,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    right: 0.1.wp,
                                                  ),
                                                  child: Image(
                                                    width: 0.1.wp,
                                                    image: AssetImage(
                                                      'assets/Asset 61300 1.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Summary",
                                                style: TextStyle(
                                                  fontFamily: "PlexSans",
                                                  color: purpleTheme,
                                                  fontSize: 50.ssp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(bottom: 0.02.hp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tarif Dasar',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${model.tarifDasarText}',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(bottom: 0.02.hp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tarif Penerus',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${model.tarifPenerusText}',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(bottom: 0.02.hp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tarif Tambahan',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Rp. ${model.tarifTambahanText}',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textGrey,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(bottom: 0.02.hp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Text(
                                                'Diskon',
                                                style: TextStyle(
                                                  fontFamily: "PlexSans",
                                                  color: textGrey,
                                                  fontSize: 40.ssp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                width: 1.wp,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      width: 1,
                                                      color: textBlack,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Rp. ${model.diskonText}',
                                                  style: TextStyle(
                                                    fontFamily: "PlexSans",
                                                    color: textGrey,
                                                    fontSize: 40.ssp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(bottom: 0.02.hp),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Netto',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textBlack,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Rp .${oCcy.format(int.parse(model.netto))}',
                                              style: TextStyle(
                                                fontFamily: "PlexSans",
                                                color: textBlack,
                                                fontSize: 40.ssp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Barang Fragile'),
                                            Checkbox(
                                              value: model.barangFragile,
                                              onChanged: (value) {
                                                model
                                                    .changeBarangFragile(value);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (model.pageController != null)
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 0.04.hp,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RaisedButton(
                                                color: Color(
                                                  hexStringToHexInt('#FEC5C5'),
                                                ),
                                                onPressed: () {
                                                  model.changePage('previous');
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          right: 0.02.wp,
                                                        ),
                                                        child: Image(
                                                          width: 0.05.wp,
                                                          image: AssetImage(
                                                            'assets/Asset 53300 1.png',
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Kembali',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "PlexSans",
                                                            color: Color(
                                                              hexStringToHexInt(
                                                                '#736B6D',
                                                              ),
                                                            ),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                              ),
                                              RaisedButton(
                                                color: Color(
                                                  hexStringToHexInt('#C5FEF3'),
                                                ),
                                                onPressed: () {
                                                  model.simpan();
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          right: 0.02.wp,
                                                        ),
                                                        child: Text(
                                                          'Proses',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "PlexSans",
                                                            color: Color(
                                                              hexStringToHexInt(
                                                                '#736B6D',
                                                              ),
                                                            ),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Image(
                                                          width: 0.05.wp,
                                                          image: AssetImage(
                                                            'assets/Asset 53300 3.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                              ),
                                            ],
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
