import 'package:flutter/material.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:jpmcompanion/widget/debouncer.dart';
import 'package:stacked/stacked.dart';

class ListDoViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<DeliveryOrder> _deliveryOrder = [];
  String _titleSnap;
  List<Nopol> _feedData = [];
  TextEditingController _nomor = TextEditingController();
  int _currentPage = 1;
  int _jumlahData = 0;
  ScrollController _scrollController = ScrollController();
  bool _isFetching = false;
  final _debouncer = Debouncer(milliseconds: 500);
  // SETTER
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<DeliveryOrder> get deliveryOrder => _deliveryOrder;

  String get titleSnap => _titleSnap;
  TextEditingController get nomor => _nomor;
  List<Nopol> get feedData => _feedData;
  ScrollController get scrollController => _scrollController;
  bool get isFetching => _isFetching;
  int get jumlahData => _jumlahData;
  // FUNCTION
  init(context) async {
    setBusy(true);
    await redirectToLogin(context);
    await getDeliveryOrder(context);
    _scrollController
      ..addListener(() async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          setBusy(true);
          if (!_isFetching) {
            _currentPage++;
            _isFetching = true;

            await getDeliveryOrder(context);
            setBusy(false);
          }
          notifyListeners();
        }
      });
    setBusy(false);
    notifyListeners();
  }

  getDeliveryOrder(context) async {
    await MainService().getDeliveryOrder(_nomor.text, _currentPage).then(
      (value) async {
        if (value['status'] == 1) {
          _jumlahData = value['data']['total'];
          for (var item in value['data']['data']) {
            _deliveryOrder.add(DeliveryOrder.fromJson(item));
          }
        } else if (value['status'] == 0) {
          redirectToLogin(context);
        }
      },
    );
    _isFetching = false;
    notifyListeners();
  }

  runFilter(value) async {
    setBusy(true);
    _currentPage = 1;
    _deliveryOrder = [];
    notifyListeners();

    _debouncer.run(() async {
      await getDeliveryOrder(_scaffoldKey.currentContext);
      setBusy(false);
      notifyListeners();
    });
  }

  selectedData(context, item) {
    Navigator.of(context).pop(item.toJson());
  }
}
