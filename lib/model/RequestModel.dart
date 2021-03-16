import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomBarModel {
  String icon;
  String title;
  String route;
  String color;

  BottomBarModel({this.icon, this.title, this.route, this.color});

  BottomBarModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    route = json['route'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['route'] = this.route;
    data['color'] = this.color;
    return data;
  }
}

class TrackingPosition {
  List<dynamic> listNopol;
  int statusVehicle;
  String geoCode;

  TrackingPosition({this.listNopol, this.statusVehicle, this.geoCode});

  TrackingPosition.fromJson(Map<String, dynamic> json) {
    listNopol = json['list_nopol'].cast<dynamic>();
    statusVehicle = json['status_vehicle'];
    geoCode = json['geo_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_nopol'] = this.listNopol;
    data['status_vehicle'] = this.statusVehicle;
    data['geo_code'] = this.geoCode;
    return data;
  }
}

class PointObject {
  Widget child;
  LatLng location;

  PointObject({this.child, this.location});
}

class ShippingOrder {
  String nomor;
  String tanggal;
  String asalId;
  String latitude;
  String longitude;
  String nopol;
  String jumlahUnit;
  String alamat;

  ShippingOrder({
    this.nomor,
    this.tanggal,
    this.asalId,
    this.latitude,
    this.longitude,
    this.nopol,
    this.jumlahUnit,
    this.alamat,
  });

  ShippingOrder.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    tanggal = json['tanggal'];
    asalId = json['asal_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    nopol = json['nopol'];
    jumlahUnit = json['jumlah_unit'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['tanggal'] = this.tanggal;
    data['asal_id'] = this.asalId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['nopol'] = this.nopol;
    data['jumlah_unit'] = this.jumlahUnit;
    data['alamat'] = this.alamat;
    return data;
  }
}

class User {
  int id;
  String nama;
  String username;
  String email;
  String telpon;
  String emailVerifiedAt;
  String deletedAt;
  String createdAt;
  String updatedAt;
  dynamic idAgen;
  int jabatanId;
  String image;
  String status;
  String kodeCabang;
  String kodeAgen;
  String background;
  Jabatan jabatan;
  List<HakAkses> hakAkses;
  Courier courier;

  User(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.telpon,
      this.emailVerifiedAt,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.idAgen,
      this.jabatanId,
      this.image,
      this.status,
      this.kodeCabang,
      this.kodeAgen,
      this.background,
      this.jabatan,
      this.hakAkses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    username = json['username'];
    email = json['email'];
    telpon = json['telpon'];
    emailVerifiedAt = json['email_verified_at'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idAgen = json['id_agen'];
    jabatanId = json['jabatan_id'];
    image = json['image'];
    status = json['status'];
    kodeCabang = json['kode_cabang'];
    kodeAgen = json['kode_agen'];
    background = json['background'];
    jabatan =
        json['jabatan'] != null ? new Jabatan.fromJson(json['jabatan']) : null;
    courier =
        json['courier'] != null ? new Courier.fromJson(json['courier']) : null;
    if (json['hak_akses'] != null) {
      hakAkses = new List<HakAkses>();
      json['hak_akses'].forEach((v) {
        hakAkses.add(new HakAkses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['email'] = this.email;
    data['telpon'] = this.telpon;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id_agen'] = this.idAgen;
    data['jabatan_id'] = this.jabatanId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['kode_cabang'] = this.kodeCabang;
    data['kode_agen'] = this.kodeAgen;
    data['background'] = this.background;
    if (this.jabatan != null) {
      data['jabatan'] = this.jabatan.toJson();
    }

    if (this.courier != null) {
      data['courier'] = this.courier.toJson();
    }
    if (this.hakAkses != null) {
      data['hak_akses'] = this.hakAkses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jabatan {
  int id;
  String nama;
  String keterangan;
  String status;
  String deletedAt;
  String createdAt;
  String updatedAt;

  Jabatan(
      {this.id,
      this.nama,
      this.keterangan,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Jabatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    keterangan = json['keterangan'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['keterangan'] = this.keterangan;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class HakAkses {
  int id;
  int jabatanId;
  String namaJabatan;
  int menuId;
  String namaMenu;
  String view;
  String create;
  String edit;
  String delete;
  String global;
  String validation;
  String deletedAt;
  String createdAt;
  String updatedAt;
  MasterMenu masterMenu;

  HakAkses(
      {this.id,
      this.jabatanId,
      this.namaJabatan,
      this.menuId,
      this.namaMenu,
      this.view,
      this.create,
      this.edit,
      this.delete,
      this.global,
      this.validation,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.masterMenu});

  HakAkses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jabatanId = json['jabatan_id'];
    namaJabatan = json['nama_jabatan'];
    menuId = json['menu_id'];
    namaMenu = json['nama_menu'];
    view = json['view'];
    create = json['create'];
    edit = json['edit'];
    delete = json['delete'];
    global = json['global'];
    validation = json['validation'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    masterMenu = json['master_menu'] != null
        ? new MasterMenu.fromJson(json['master_menu'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jabatan_id'] = this.jabatanId;
    data['nama_jabatan'] = this.namaJabatan;
    data['menu_id'] = this.menuId;
    data['nama_menu'] = this.namaMenu;
    data['view'] = this.view;
    data['create'] = this.create;
    data['edit'] = this.edit;
    data['delete'] = this.delete;
    data['global'] = this.global;
    data['validation'] = this.validation;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.masterMenu != null) {
      data['master_menu'] = this.masterMenu.toJson();
    }
    return data;
  }
}

class MasterMenu {
  int id;
  String nama;
  String keterangan;
  int groupId;
  String url;
  String jenis;
  String status;
  String deletedAt;
  String createdAt;
  String updatedAt;

  MasterMenu(
      {this.id,
      this.nama,
      this.keterangan,
      this.groupId,
      this.url,
      this.jenis,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  MasterMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    keterangan = json['keterangan'];
    groupId = json['group_id'];
    url = json['url'];
    jenis = json['jenis'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['keterangan'] = this.keterangan;
    data['group_id'] = this.groupId;
    data['url'] = this.url;
    data['jenis'] = this.jenis;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class Courier {
  int id;
  String kode;
  String nama;
  String email;
  String telpon;
  String rute;
  String kodeCabang;
  int kendaraanId;
  Null userId;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  Kendaraan kendaraan;
  dynamic total;
  dynamic totalOnProgress;
  dynamic totalFail;
  Courier({
    this.id,
    this.kode,
    this.nama,
    this.email,
    this.rute,
    this.telpon,
    this.kodeCabang,
    this.kendaraanId,
    this.userId,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.kendaraan,
    this.total,
    this.totalOnProgress,
    this.totalFail,
  });

  Courier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    nama = json['nama'];
    rute = json['rute'];
    email = json['email'];
    telpon = json['telpon'];
    kodeCabang = json['kode_cabang'];
    kendaraanId = json['kendaraan_id'];
    userId = json['user_id'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kendaraan = json['kendaraan'] != null
        ? new Kendaraan.fromJson(json['kendaraan'])
        : null;
    total = json['total'];
    totalOnProgress = json['total_on_progress'];
    totalFail = json['total_fail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    data['rute'] = this.rute;
    data['email'] = this.email;
    data['telpon'] = this.telpon;
    data['kode_cabang'] = this.kodeCabang;
    data['kendaraan_id'] = this.kendaraanId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kendaraan != null) {
      data['kendaraan'] = this.kendaraan.toJson();
    }
    data['total'] = this.total;
    data['total_on_progress'] = this.totalOnProgress;
    data['total_fail'] = this.totalFail;
    return data;
  }
}

class Kendaraan {
  int id;
  String nopol;
  String brncde;
  String divisi;
  String status;
  Null vdrcde;
  Null vdrnme;
  String kode;
  String merk;
  String tipeAngkutan;
  String noRangka;
  String noMesin;
  String jenisBak;
  int p;
  int l;
  int t;
  String volume;
  int tahun;
  String seriUnit;
  String warnaKabin;
  String noBpkb;
  String tglBpkb;
  String noKir;
  String tglKir;
  String tglPajak;
  String tglStnk;
  String gps;
  String posisiBpkb;
  String ketBpkb;
  String asuransi;
  String harga;
  String tglPerolehan;
  String keterangan;
  String kodeCabang;
  int version;
  Null createBy;
  Null createAt;
  Null updateBy;
  Null updateAt;
  int act;
  Null tglPajakTahunan;
  Null tglPajak5Tahunan;
  String kodeSubcon;
  String aktif;
  Null createdAt;
  Null updatedAt;
  Null nopolLama;
  Null createdBy;
  Null updatedBy;

  Kendaraan(
      {this.id,
      this.nopol,
      this.brncde,
      this.divisi,
      this.status,
      this.vdrcde,
      this.vdrnme,
      this.kode,
      this.merk,
      this.tipeAngkutan,
      this.noRangka,
      this.noMesin,
      this.jenisBak,
      this.p,
      this.l,
      this.t,
      this.volume,
      this.tahun,
      this.seriUnit,
      this.warnaKabin,
      this.noBpkb,
      this.tglBpkb,
      this.noKir,
      this.tglKir,
      this.tglPajak,
      this.tglStnk,
      this.gps,
      this.posisiBpkb,
      this.ketBpkb,
      this.asuransi,
      this.harga,
      this.tglPerolehan,
      this.keterangan,
      this.kodeCabang,
      this.version,
      this.createBy,
      this.createAt,
      this.updateBy,
      this.updateAt,
      this.act,
      this.tglPajakTahunan,
      this.tglPajak5Tahunan,
      this.kodeSubcon,
      this.aktif,
      this.createdAt,
      this.updatedAt,
      this.nopolLama,
      this.createdBy,
      this.updatedBy});

  Kendaraan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nopol = json['nopol'];
    brncde = json['brncde'];
    divisi = json['divisi'];
    status = json['status'];
    vdrcde = json['vdrcde'];
    vdrnme = json['vdrnme'];
    kode = json['kode'];
    merk = json['merk'];
    tipeAngkutan = json['tipe_angkutan'];
    noRangka = json['no_rangka'];
    noMesin = json['no_mesin'];
    jenisBak = json['jenis_bak'];
    p = json['p'];
    l = json['l'];
    t = json['t'];
    volume = json['volume'];
    tahun = json['tahun'];
    seriUnit = json['seri_unit'];
    warnaKabin = json['warna_kabin'];
    noBpkb = json['no_bpkb'];
    tglBpkb = json['tgl_bpkb'];
    noKir = json['no_kir'];
    tglKir = json['tgl_kir'];
    tglPajak = json['tgl_pajak'];
    tglStnk = json['tgl_stnk'];
    gps = json['gps'];
    posisiBpkb = json['posisi_bpkb'];
    ketBpkb = json['ket_bpkb'];
    asuransi = json['asuransi'];
    harga = json['harga'];
    tglPerolehan = json['tgl_perolehan'];
    keterangan = json['keterangan'];
    kodeCabang = json['kode_cabang'];
    version = json['version'];
    createBy = json['create_by'];
    createAt = json['create_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    act = json['act'];
    tglPajakTahunan = json['tgl_pajak_tahunan'];
    tglPajak5Tahunan = json['tgl_pajak_5_tahunan'];
    kodeSubcon = json['kode_subcon'];
    aktif = json['aktif'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nopolLama = json['nopol_lama'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nopol'] = this.nopol;
    data['brncde'] = this.brncde;
    data['divisi'] = this.divisi;
    data['status'] = this.status;
    data['vdrcde'] = this.vdrcde;
    data['vdrnme'] = this.vdrnme;
    data['kode'] = this.kode;
    data['merk'] = this.merk;
    data['tipe_angkutan'] = this.tipeAngkutan;
    data['no_rangka'] = this.noRangka;
    data['no_mesin'] = this.noMesin;
    data['jenis_bak'] = this.jenisBak;
    data['p'] = this.p;
    data['l'] = this.l;
    data['t'] = this.t;
    data['volume'] = this.volume;
    data['tahun'] = this.tahun;
    data['seri_unit'] = this.seriUnit;
    data['warna_kabin'] = this.warnaKabin;
    data['no_bpkb'] = this.noBpkb;
    data['tgl_bpkb'] = this.tglBpkb;
    data['no_kir'] = this.noKir;
    data['tgl_kir'] = this.tglKir;
    data['tgl_pajak'] = this.tglPajak;
    data['tgl_stnk'] = this.tglStnk;
    data['gps'] = this.gps;
    data['posisi_bpkb'] = this.posisiBpkb;
    data['ket_bpkb'] = this.ketBpkb;
    data['asuransi'] = this.asuransi;
    data['harga'] = this.harga;
    data['tgl_perolehan'] = this.tglPerolehan;
    data['keterangan'] = this.keterangan;
    data['kode_cabang'] = this.kodeCabang;
    data['version'] = this.version;
    data['create_by'] = this.createBy;
    data['create_at'] = this.createAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    data['act'] = this.act;
    data['tgl_pajak_tahunan'] = this.tglPajakTahunan;
    data['tgl_pajak_5_tahunan'] = this.tglPajak5Tahunan;
    data['kode_subcon'] = this.kodeSubcon;
    data['aktif'] = this.aktif;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['nopol_lama'] = this.nopolLama;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
