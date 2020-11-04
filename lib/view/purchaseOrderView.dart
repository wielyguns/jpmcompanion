import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/purchaseOrderViewModel.dart';
import 'package:stacked/stacked.dart';

class PurchaseOrderView extends StatefulWidget {
  @override
  _PurchaseOrderViewState createState() => _PurchaseOrderViewState();
}

class _PurchaseOrderViewState extends State<PurchaseOrderView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PurchaseOrderViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: model.scaffoldKey,
          backgroundColor: Colors.white,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowGlow();
              return;
            },
            child: NestedScrollView(
              headerSliverBuilder: (context, box) {
                return [
                  SliverAppBar(
                    elevation: 0,
                    title: Text('Purchase Order'),
                    backgroundColor: Colors.white,
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [purpleTheme, Colors.blue],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Image(
                        width: 0.14.wp,
                        image: AssetImage(
                          'assets/Asset 57300 1.png',
                        ),
                      ),
                    ),
                    pinned: true,
                    expandedHeight: kToolbarHeight + 0.1.hp,
                  ),
                ];
              },
              body: Container(
                child: Text('tes'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
