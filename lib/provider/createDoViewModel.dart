import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/RequestModel.dart';
import 'package:jpmcompanion/model/deliveryOrderModel.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/service/mainService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';

class CreateDoViewModel extends BaseViewModel {
  // GETTER
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formPengirimKey = GlobalKey();
  final GlobalKey<FormState> _formPenerimaKey = GlobalKey();
  final GlobalKey<FormState> _formPaketKey = GlobalKey();
  final GlobalKey<FormState> _formHargaKey = GlobalKey();
  String _titleSnap;
  String _typeKirimanValue = 'KILOGRAM';
  String _jenisKirimanValue;
  String _serviceExpressValue;
  String _kecamatanValue;
  bool _barangFragile = false;
  User _user = User();
  PageController _pageController = PageController(initialPage: 0);
  List<DropdownMenuItem> _jenisKiriman = [];
  List<DropdownMenuItem> _serviceExpress = [];
  List<DropdownMenuItem> _kecamatan = [];
  List<DropdownMenuItem> _typeKiriman = [
    DropdownMenuItem<String>(
      child: Text('Kilogram'),
      value: 'KILOGRAM',
    ),
    DropdownMenuItem<String>(
      child: Text('Dokumen'),
      value: 'DOKUMEN',
    ),
    DropdownMenuItem<String>(
      child: Text('Sepeda'),
      value: 'SEPEDA',
    ),
  ];
  List<DropdownMenuItem> _jenisSepeda = [
    DropdownMenuItem<String>(
      child: Text('Sepeda'),
      value: 'SEPEDA',
    ),
    DropdownMenuItem<String>(
      child: Text('Motor Sport'),
      value: 'SPORT',
    ),
    DropdownMenuItem<String>(
      child: Text('Bebek/Matic'),
      value: 'BETIC',
    ),
    DropdownMenuItem<String>(
      child: Text('Moge'),
      value: 'MOGE',
    ),
  ];
  TextEditingController _nomor = TextEditingController();
  String _nomorError = '';
  TextEditingController _tanggal = TextEditingController();
  String _tanggalError = '';
  TextEditingController _asal = TextEditingController();
  String _asalError = '';
  Kota _asalData;
  TextEditingController _customer = TextEditingController();
  String _customerError = '';
  Customer _customerData;
  TextEditingController _pengirim = TextEditingController();
  String _pengirimError = '';
  TextEditingController _telpPengirim = TextEditingController();
  String _telpPengirimError = '';
  TextEditingController _alamatPengirim = TextEditingController();
  String _alamatPengirimError = '';
  TextEditingController _tujuan = TextEditingController();
  String _tujuanError = '';
  Kota _tujuanData;
  TextEditingController _penerima = TextEditingController();
  String _penerimaError = '';
  TextEditingController _telpPenerima = TextEditingController();
  String _telpPenerimaError = '';
  TextEditingController _alamatPenerima = TextEditingController();
  String _alamatPenerimaError = '';
  TextEditingController _namaItem = TextEditingController();
  String _namaItemError = '';
  TextEditingController _berat = TextEditingController();
  String _beratError = '';
  TextEditingController _koli = TextEditingController();
  String _koliError = '';
  TextEditingController _jumlah = TextEditingController();
  String _jumlahError = '';

  MoneyMaskedTextController _tarifDasar = MoneyMaskedTextController(
    decimalSeparator: '',
    initialValue: 0,
    thousandSeparator: ',',
    precision: 0,
  );
  String _tarifDasarError = '';
  MoneyMaskedTextController _tarifPenerus = MoneyMaskedTextController(
    decimalSeparator: '',
    initialValue: 0,
    thousandSeparator: ',',
    precision: 0,
  );
  String _tarifPenerusError = '';
  MoneyMaskedTextController _tarifTambahan = MoneyMaskedTextController(
    decimalSeparator: '',
    initialValue: 0,
    thousandSeparator: ',',
    precision: 0,
  );
  String _tarifTambahanError = '';

  MoneyMaskedTextController _diskonRp = MoneyMaskedTextController(
    decimalSeparator: '',
    initialValue: 0,
    thousandSeparator: ',',
    precision: 0,
  );

  TextEditingController _diskonPersen = TextEditingController();
  String _diskonPersenError = '';
  String _diskonRpError = '';
  List<DeliveryOrderSepeda> _sepeda = [];
  int _page = 0;
  int _jumlahSepeda = 0;
  String _netto = '0';
  String _tarifDasarText = '0';
  String _tarifTambahanText = '0';
  String _tarifPenerusText = '0';
  String _diskonText = '0';
  SearchTarifResponse _searchTarifResponse;

  // SETTER
  TextEditingController get nomor => _nomor;
  String get nomorError => _nomorError;
  TextEditingController get tanggal => _tanggal;
  String get tanggalError => _tanggalError;
  TextEditingController get asal => _asal;
  String get asalError => _asalError;
  TextEditingController get customer => _customer;
  String get customerError => _customerError;
  TextEditingController get pengirim => _pengirim;
  String get pengirimError => _pengirimError;
  TextEditingController get telpPengirim => _telpPengirim;
  String get telpPengirimError => _telpPengirimError;
  TextEditingController get alamatPengirim => _alamatPengirim;
  String get alamatPengirimError => _alamatPengirimError;

  TextEditingController get tujuan => _tujuan;
  String get tujuanError => _tujuanError;
  TextEditingController get penerima => _penerima;
  String get penerimaError => _penerimaError;
  TextEditingController get telpPenerima => _telpPenerima;
  String get telpPenerimaError => _telpPenerimaError;
  TextEditingController get alamatPenerima => _alamatPenerima;
  String get alamatPenerimaError => _alamatPenerimaError;
  TextEditingController get namaItem => _namaItem;
  String get namaItemError => _namaItemError;
  TextEditingController get berat => _berat;
  String get beratError => _beratError;
  TextEditingController get koli => _koli;
  String get koliError => _koliError;
  TextEditingController get jumlah => _jumlah;
  String get jumlahError => _jumlahError;
  MoneyMaskedTextController get tarifDasar => _tarifDasar;
  String get tarifDasarError => _tarifDasarError;
  MoneyMaskedTextController get tarifPenerus => _tarifPenerus;
  String get tarifPenerusError => _tarifPenerusError;
  MoneyMaskedTextController get tarifTambahan => _tarifTambahan;
  String get tarifTambahanError => _tarifTambahanError;
  MoneyMaskedTextController get diskonRp => _diskonRp;
  String get diskonRpError => _diskonRpError;
  TextEditingController get diskonPersen => _diskonPersen;
  String get diskonPersenError => _diskonPersenError;
  List<DeliveryOrderSepeda> get sepeda => _sepeda;
  List<DropdownMenuItem> get typeKiriman => _typeKiriman;
  String get typeKirimanValue => _typeKirimanValue;
  List<DropdownMenuItem> get jenisKiriman => _jenisKiriman;
  List<DropdownMenuItem> get serviceExpress => _serviceExpress;
  String get jenisKirimanValue => _jenisKirimanValue;
  String get serviceExpressValue => _serviceExpressValue;
  List<DropdownMenuItem> get jenisSepeda => _jenisSepeda;
  List<DropdownMenuItem> get kecamatan => _kecamatan;
  String get kecamatanValue => _kecamatanValue;

  User get user => _user;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get formPengirimKey => _formPengirimKey;
  GlobalKey<FormState> get formPenerimaKey => _formPenerimaKey;
  GlobalKey<FormState> get formPaketKey => _formPaketKey;
  GlobalKey<FormState> get formHargaKey => _formHargaKey;
  String get titleSnap => _titleSnap;
  int get page => _page;
  PageController get pageController => _pageController;
  String get netto => _netto;
  String get tarifDasarText => _tarifDasarText;
  String get tarifTambahanText => _tarifTambahanText;
  String get tarifPenerusText => _tarifPenerusText;
  String get diskonText => _diskonText;
  bool get barangFragile => _barangFragile;
  // FUNCTION
  init(context) async {
    setBusy(true);
    await redirectToLogin(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('user');
    if (temp != null) {
      _user = User.fromJson(jsonDecode(temp));
    }

    _tanggal.text = DateFormat('d/M/y').format(DateTime.now().toUtc());
    await getJenisKiriman();

    _jumlah.addListener(() => changeJumlah());
    setBusy(false);
    notifyListeners();
  }

  getJenisKiriman() async {
    await MainService().getJenisKiriman().then((value) async {
      if (value['status'] == 1) {
        for (var item in value['data']) {
          _jenisKiriman.add(
            DropdownMenuItem<String>(
              child: Text('${item['jt_nama_tarif']}'),
              value: '${item['jt_nama_tarif']}',
            ),
          );
        }

        for (var item in value['service_express']) {
          _serviceExpress.add(
            DropdownMenuItem<String>(
              child: Text('${item['name']}'),
              value: '${item['id']}',
            ),
          );
        }
        _nomor.text = value['nota'].toString();

        print(_jenisKiriman);
      } else if (value['status'] == 0) {
        await redirectToLogin(_scaffoldKey.currentContext);
      }
    });
    notifyListeners();
  }

  changeTypeKiriman(value) {
    _typeKirimanValue = value;
    _sepeda = [];
    notifyListeners();
  }

  changeJenisKiriman(value) {
    _jenisKirimanValue = value;
    notifyListeners();
  }

  changeJenisExpress(value) {
    _serviceExpressValue = value;
    notifyListeners();
  }

  changeBarangFragile(value) {
    _barangFragile = value;
    notifyListeners();
  }

  completeTracking(context) {
    return IndicatorStyle(
      width: 30,
      height: 30,
      color: purpleTheme,
      iconStyle: IconStyle(
        color: Colors.white,
        iconData: Icons.check,
        fontSize: 50.ssp,
      ),
    );
  }

  onProgressTracking(context) {
    return IndicatorStyle(
      width: 30,
      height: 30,
      color: borderBox,
      iconStyle: IconStyle(
        iconData: Icons.check,
      ),
      indicator: Container(
        decoration: BoxDecoration(
          color: borderBox,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.03.wp,
              height: 0.03.wp,
            )
          ],
        ),
      ),
    );
  }

  changeJumlah() {
    if (_jumlah.text != '' && _jumlah.text != null) {
      if (_jumlahSepeda != int.parse(_jumlah.text)) {
        _jumlahSepeda = int.parse(_jumlah.text);
      }

      for (var i = 0; i < _jumlahSepeda; i++) {
        if (i < 5) {
          if (!_sepeda.asMap().containsKey(i)) {
            _sepeda.add(DeliveryOrderSepeda(jenis: "SEPEDA", berat: 1));
          }
        }
      }
      if (_sepeda.length > _jumlahSepeda) {
        for (var i = _jumlahSepeda; i < _sepeda.length; i++) {
          _sepeda.removeAt(i);
        }
      }
    } else {
      _jumlahSepeda = 0;
    }

    notifyListeners();
  }

  changeJenisSepeda(index, value) {
    _sepeda[index].jenis = value;
    FocusScope.of(_scaffoldKey.currentContext).unfocus();
    notifyListeners();
  }

  changeBeratSepeda(index, value) {
    _sepeda[index].berat = value != '' ? int.parse(value) : 0;

    notifyListeners();
  }

  jumpToPage(paging) async {
    if (_page == 0 && int.parse(paging.toStringAsFixed(0)) > _page) {
      if (!_formPengirimKey.currentState.validate()) {
        return;
      }
    }

    if (_page == 1 && int.parse(paging.toStringAsFixed(0)) > _page) {
      if (!_formPenerimaKey.currentState.validate()) {
        return;
      }
    }

    if (_page == 2 && int.parse(paging.toStringAsFixed(0)) > _page) {
      if (!_formPaketKey.currentState.validate()) {
        return;
      }
    }

    if (_page == 3 && int.parse(paging.toStringAsFixed(0)) > _page) {
      if (!_formHargaKey.currentState.validate()) {
        return;
      }
    }

    _page = int.parse(paging.toStringAsFixed(0));

    _page = page;
    pageController.animateToPage(
      _page,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
    kalkulasiHarga();
    notifyListeners();
  }

  changeDate(context) async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().subtract(
        Duration(days: -30),
      ),
    );
    if (result != null) {
      _tanggal.text = DateFormat('d/M/y').format(result);
    }
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  selectCity(context, param) async {
    var result = await Navigator.of(context).pushNamed(listKotaRoute);
    if (result != null) {
      if (param == 'asal') {
        _asalData = result;
        _asal.text = '${_asalData.prefix} ${_asalData.nama}';
      } else {
        _kecamatan = [];
        _kecamatanValue = null;
        _tujuanData = result;
        _tujuan.text = '${_tujuanData.prefix} ${_tujuanData.nama}';
        await MainService().getSubCity(_tujuanData.id).then((value) {
          print(value);
          if (value['status'] == 1) {
            for (var item in value['data']) {
              if (_kecamatanValue == null) {
                _kecamatanValue = '${item['id']}';
              }
              _kecamatan.add(
                DropdownMenuItem<String>(
                  child: Text('${item['nama']}'),
                  value: '${item['id']}',
                ),
              );
            }
          }
        });
      }
    }
    notifyListeners();
  }

  void changeKecamatan(value) {
    _kecamatanValue = value;
    notifyListeners();
  }

  selectCustomer(context) async {
    var result = await Navigator.of(context).pushNamed(listCustomerRoute);
    if (result != null) {
      _customerData = result;
      _customer.text = _customerData.nama;
      _pengirim.text = _customerData.picNama;
      _telpPengirim.text = _customerData.telpon;
      _alamatPengirim.text = _customerData.alamat;
    }
    notifyListeners();
  }

  scanQr(context, param) async {
    Map<String, dynamic> data = {
      "callback": true,
    };
    var result = await Navigator.pushNamed(
      context,
      updateDoScannerRoute,
      arguments: data,
    );

    if (param == 'nomor') {
      _nomor.text = result;
    } else if (param == 'customer') {
      if (result != null) {
        await MainService().getCustomer(result).then(
          (value) async {
            if (value['status'] == 1) {
              if (value['data'].length != 0) {
                _customerData = Customer.fromJson(value['data'][0]);
                _customer.text = _customerData.nama;
                _pengirim.text = _customerData.picNama;
                _telpPengirim.text = _customerData.telpon;
                _alamatPengirim.text = _customerData.alamat;
              } else {
                messageToast('Customer tidak ada', Colors.red);
              }
            } else if (value['status'] == 0) {
              redirectToLogin(context);
            }
          },
        );
      }
    }
  }

  changePage(param) {
    FocusScope.of(_scaffoldKey.currentContext).unfocus();
    if (pageController != null) {
      var paging;
      if (param == 'next') {
        paging = pageController.page + 1;
      } else if (pageController.page > 0) {
        paging = pageController.page - 1;
      }
      jumpToPage(paging);
    }
    notifyListeners();
  }

  updateTarif(param, value) {
    if (value == '') {
      value = '0';
    }

    if (param == 'tarifTambahan') {
      _tarifTambahan.updateValue(double.parse(value.replaceAll(',', '')));
      _tarifTambahanText = oCcy.format(double.parse(value.replaceAll(',', '')));
    } else if (param == 'tarifPenerus') {
      _tarifPenerus.updateValue(double.parse(value.replaceAll(',', '')));
      _tarifPenerusText = oCcy.format(double.parse(value.replaceAll(',', '')));
    }
    notifyListeners();
    kalkulasiDiskon('persen');
  }

  kalkulasiHarga() async {
    SearchTarifParam param = SearchTarifParam(
      asalId: (_asalData != null) ? _asalData.id.toString() : null,
      tujuanId: (_tujuanData != null) ? _tujuanData.id.toString() : null,
      idKecamatanTujuan: _kecamatanValue.toString(),
      berat: _berat.text,
      dokumen: _jumlah.text,
      jenisTarif: _jenisKirimanValue.toString(),
      typeKiriman: _typeKirimanValue.toString(),
      jenisUnit: _sepeda,
      kodeCustomer: _customerData.kode.toString(),
      serviceExpress: _serviceExpressValue.toString(),
    );

    await MainService().searchTarif(param).then((value) {
      if (value['status'] == 1) {
        _searchTarifResponse = SearchTarifResponse.fromJson(value);
        _tarifDasar.text = _searchTarifResponse.tarif.toString();
        _tarifPenerus.text = _searchTarifResponse.tarifPenerus.toString();

        if (_tarifDasar.text == '') {
          _tarifDasar.text = '0';
        }

        if (_diskonRp.text == '') {
          _diskonRp.text = '0';
        }
        if (_tarifPenerus.text == '') {
          _tarifPenerus.text = '0';
        }
        if (_tarifTambahan.text == '') {
          _tarifTambahan.text = '0';
        }

        _tarifDasarText =
            oCcy.format(int.parse(_tarifDasar.text.replaceAll(',', '')));
        _tarifPenerusText =
            oCcy.format(int.parse(_tarifPenerus.text.replaceAll(',', '')));

        var totalTemp = int.parse(_tarifDasar.text.replaceAll(',', '')) +
            int.parse(_tarifTambahan.text.replaceAll(',', '')) +
            int.parse(_tarifPenerus.text.replaceAll(',', ''));
        _netto = '${totalTemp - int.parse(_diskonText.replaceAll('.', ''))}';
      }
    });
    notifyListeners();
  }

  setTarif() {
    var totalTemp = int.parse(_tarifDasar.text.replaceAll(',', '')) +
        int.parse(_tarifTambahan.text.replaceAll(',', '')) +
        int.parse(_tarifPenerus.text.replaceAll(',', ''));
    _netto = '${totalTemp - int.parse(_diskonText.replaceAll('.', ''))}';
    notifyListeners();
  }

  kalkulasiDiskon(param) async {
    if (_tarifDasar.text == '') {
      _tarifDasar.text = '0';
    }
    if (_tarifPenerus.text == '') {
      _tarifPenerus.text = '0';
    }
    if (_tarifTambahan.text == '') {
      _tarifTambahan.text = '0';
    }

    var maxDiskon;

    if (int.parse(_berat.text) > 10 && int.parse(_berat.text) >= 50) {
      maxDiskon = _searchTarifResponse.diskon.beratLebihDari10Sampai50;
    } else if (int.parse(_berat.text) > 50 && int.parse(_berat.text) >= 100) {
      maxDiskon = _searchTarifResponse.diskon.beratLebihDari50Sampai100;
    } else if (int.parse(_berat.text) > 100) {
      maxDiskon = _searchTarifResponse.diskon.beratLebihDari100;
    } else {
      maxDiskon = 0;
    }
    var totalTemp = int.parse(_tarifDasar.text.replaceAll(',', '')) +
        int.parse(_tarifTambahan.text.replaceAll(',', ''));
    if (param == 'persen') {
      if (_diskonPersen.text == '') {
        _diskonPersen.text = '0';
      }

      int diskon = int.parse(_diskonPersen.text.replaceAll(',', ''));
      if ((diskon > maxDiskon) || (maxDiskon == 0)) {
        if (diskon > maxDiskon) {
          messageToast('Max diskon adalah $maxDiskon %', Colors.red);
        }
        diskon = maxDiskon;
        var diskonTemp = diskon / 100 * totalTemp;
        _diskonRp.text = '${int.parse(diskonTemp.toStringAsFixed(0))}';
        _diskonText =
            '${oCcy.format(int.parse(diskonTemp.toStringAsFixed(0)))}';
      } else {
        var diskonTemp = diskon / 100 * totalTemp;
        _diskonRp.text = '${int.parse(diskonTemp.toStringAsFixed(0))}';
        _diskonText =
            '${oCcy.format(int.parse(diskonTemp.toStringAsFixed(0)))}';
      }
    } else {
      if (_diskonRp.text == '') {
        _diskonRp.updateValue(0.0);
        _diskonText = '0';
      }

      int diskon = int.parse(_diskonRp.text.replaceAll(',', ''));

      int diskonTemp = int.parse((diskon / totalTemp * 100).toStringAsFixed(0));

      if (diskonTemp > maxDiskon || maxDiskon == 0) {
        diskonTemp = maxDiskon;
        diskon = int.parse((maxDiskon / 100 * totalTemp).toStringAsFixed(0));
        if (diskon > maxDiskon) {
          messageToast('Max diskon adalah $maxDiskon %', Colors.red);
        }
      }
      _diskonPersen.text = '${int.parse(diskonTemp.toStringAsFixed(0))}';

      _diskonText = oCcy.format(int.parse(diskon.toStringAsFixed(0)));
    }
    setTarif();
    notifyListeners();
  }

  simpan() async {
    DeliveryOrderParam data = DeliveryOrderParam(
      nomor: _nomor.text,
      asal: _asalData.id.toString(),
      tujuan: _tujuanData.id.toString(),
      tanggal: _tanggal.text.toString(),
      customer: _customerData.kode.toString(),
      namaPengirim: _pengirim.text,
      teleponCustomer: _telpPengirim.text,
      alamatCustomer: _alamatPengirim.text,
      kecamatan: _kecamatanValue.toString(),
      penerima: _penerima.text,
      teleponPenerima: _telpPenerima.text,
      alamatPenerima: _alamatPenerima.text,
      namaBarang: _namaItem.text,
      typeKiriman: _typeKirimanValue,
      jenisKiriman: _jenisKirimanValue,
      berat: (_berat.text != '') ? _berat.text : '0',
      koli: (_koli.text != '') ? _koli.text : '0',
      jumlah: (_jumlah.text != '') ? _jumlah.text : '0',
      tarifDasar: _tarifDasar.text.toString(),
      tarifPenerus: _tarifPenerus.text.toString(),
      tarifTambahan: _tarifTambahan.text.toString(),
      jenisUnit: _sepeda,
      serviceExpress: _serviceExpressValue,
      diskonValue: _diskonText,
      diskon: '0',
      totalNet: _netto.toString(),
      barangFragile: _barangFragile,
    );

    setBusy(true);
    await MainService().saveDo(data).then((value) {
      if (value['status'] == 1) {
        messageToast(value['message'], textBlack);
        jumpToPage(0);
        getJenisKiriman();
      } else {
        messageToast(value['message'], Colors.red);
      }
      setBusy(false);
    });
    notifyListeners();
  }
}
