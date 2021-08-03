class GetKota {
  int status;
  String message;
  List<Asal> data;

  GetKota({this.status, this.message, this.data});

  GetKota.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Asal>();
      json['data'].forEach((v) {
        data.add(new Asal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Asal {
  int id;
  String nama;
  String namaIbuKota;
  String kodeKota;
  int idProvinsi;
  String createBy;
  String createdAt;
  String updateBy;
  String updateAt;
  String nama2;

  Asal(
      {this.id,
      this.nama,
      this.namaIbuKota,
      this.kodeKota,
      this.idProvinsi,
      this.createBy,
      this.createdAt,
      this.updateBy,
      this.updateAt,
      this.nama2});

  Asal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    namaIbuKota = json['nama_ibu_kota'];
    kodeKota = json['kode_kota'];
    idProvinsi = json['id_provinsi'];
    createBy = json['create_by'];
    createdAt = json['created_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    nama2 = json['nama2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['nama_ibu_kota'] = this.namaIbuKota;
    data['kode_kota'] = this.kodeKota;
    data['id_provinsi'] = this.idProvinsi;
    data['create_by'] = this.createBy;
    data['created_at'] = this.createdAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    data['nama2'] = this.nama2;
    return data;
  }
}

class GetNopol {
  int status;
  String message;
  List<Nopol> data;

  GetNopol({this.status, this.message, this.data});

  GetNopol.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Nopol>();
      json['data'].forEach((v) {
        data.add(new Nopol.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nopol {
  dynamic id;
  dynamic nopol;
  dynamic brncde;
  dynamic divisi;
  dynamic status;
  dynamic vdrcde;
  dynamic vdrnme;
  dynamic kode;
  dynamic merk;
  dynamic tipeAngkutan;
  dynamic noRangka;
  dynamic noMesin;
  dynamic jenisBak;
  dynamic p;
  dynamic l;
  dynamic t;
  dynamic volume;
  dynamic tahun;
  dynamic seriUnit;
  dynamic warnaKabin;
  dynamic noBpkb;
  dynamic tglBpkb;
  dynamic noKir;
  dynamic tglKir;
  dynamic tglPajak;
  dynamic tglStnk;
  dynamic gps;
  dynamic posisiBpkb;
  dynamic ketBpkb;
  dynamic asuransi;
  dynamic harga;
  dynamic tglPerolehan;
  dynamic keterangan;
  dynamic kodeCabang;
  dynamic version;
  dynamic createBy;
  dynamic createAt;
  dynamic updateBy;
  dynamic updateAt;
  dynamic act;
  dynamic tglPajakTahunan;
  dynamic tglPajak5Tahunan;
  dynamic kodeSubcon;
  dynamic aktif;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic nopolLama;
  dynamic createdBy;
  dynamic updatedBy;
  Angkutan angkutan;
  Cabang cabang;

  Nopol(
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
      this.updatedBy,
      this.angkutan,
      this.cabang});

  Nopol.fromJson(Map<String, dynamic> json) {
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
    angkutan = json['angkutan'] != null
        ? new Angkutan.fromJson(json['angkutan'])
        : null;
    cabang =
        json['cabang'] != null ? new Cabang.fromJson(json['cabang']) : null;
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
    if (this.angkutan != null) {
      data['angkutan'] = this.angkutan.toJson();
    }
    if (this.cabang != null) {
      data['cabang'] = this.cabang.toJson();
    }
    return data;
  }
}

class Angkutan {
  String kode;
  String nama;
  int status;
  int urutan;
  String bahanBakar;
  int bbmPerLiter;

  Angkutan(
      {this.kode,
      this.nama,
      this.status,
      this.urutan,
      this.bahanBakar,
      this.bbmPerLiter});

  Angkutan.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    nama = json['nama'];
    status = json['status'];
    urutan = json['urutan'];
    bahanBakar = json['bahan_bakar'];
    bbmPerLiter = json['bbm_per_liter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    data['status'] = this.status;
    data['urutan'] = this.urutan;
    data['bahan_bakar'] = this.bahanBakar;
    data['bbm_per_liter'] = this.bbmPerLiter;
    return data;
  }
}

class Cabang {
  String kode;
  String nama;
  String alamat;
  String telpon;
  String fax;
  int idKota;
  String version;
  String createBy;
  String createAt;
  String updateBy;
  String updateAt;
  String status;
  int jamCutOff;
  String lat;
  String long;
  int penanggungJawab;
  String image;
  String keterangan;
  int regionalId;
  String tlc;

  Cabang({
    this.kode,
    this.nama,
    this.alamat,
    this.telpon,
    this.fax,
    this.idKota,
    this.version,
    this.createBy,
    this.createAt,
    this.updateBy,
    this.updateAt,
    this.status,
    this.jamCutOff,
    this.lat,
    this.long,
    this.penanggungJawab,
    this.image,
    this.keterangan,
    this.regionalId,
    this.tlc,
  });

  Cabang.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    nama = json['nama'];
    alamat = json['alamat'];
    telpon = json['telpon'];
    fax = json['fax'];
    idKota = json['id_kota'];
    version = json['version'];
    createBy = json['create_by'];
    createAt = json['create_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    status = json['status'];
    jamCutOff = json['jam_cut_off'];
    lat = json['lat'];
    long = json['long'];
    penanggungJawab = json['penanggung_jawab'];
    image = json['image'];
    keterangan = json['keterangan'];
    regionalId = json['regional_id'];
    tlc = json['tlc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['telpon'] = this.telpon;
    data['fax'] = this.fax;
    data['id_kota'] = this.idKota;
    data['version'] = this.version;
    data['create_by'] = this.createBy;
    data['create_at'] = this.createAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    data['status'] = this.status;
    data['jam_cut_off'] = this.jamCutOff;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['penanggung_jawab'] = this.penanggungJawab;
    data['image'] = this.image;
    data['keterangan'] = this.keterangan;
    data['regional_id'] = this.regionalId;
    data['tlc'] = this.tlc;
    return data;
  }
}

class ShippingOrderData {
  String uuid;
  String nomor;
  String tanggal;
  String asalId;
  String latitude;
  String longitude;
  String token;
  int kendaraanId;
  String nopol;
  String jumlahUnit;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  String status;
  String alamat;
  Kota kota;
  Kendaraan kendaraan;

  ShippingOrderData(
      {this.uuid,
      this.nomor,
      this.tanggal,
      this.asalId,
      this.latitude,
      this.longitude,
      this.token,
      this.kendaraanId,
      this.nopol,
      this.jumlahUnit,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.alamat,
      this.kota,
      this.kendaraan});

  ShippingOrderData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nomor = json['nomor'];
    tanggal = json['tanggal'];
    asalId = json['asal_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    token = json['token'];
    kendaraanId = json['kendaraan_id'];
    nopol = json['nopol'];
    jumlahUnit = json['jumlah_unit'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    alamat = json['alamat'];
    kota = json['kota'] != null ? new Kota.fromJson(json['kota']) : null;
    kendaraan = json['kendaraan'] != null
        ? new Kendaraan.fromJson(json['kendaraan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['nomor'] = this.nomor;
    data['tanggal'] = this.tanggal;
    data['asal_id'] = this.asalId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['token'] = this.token;
    data['kendaraan_id'] = this.kendaraanId;
    data['nopol'] = this.nopol;
    data['jumlah_unit'] = this.jumlahUnit;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['alamat'] = this.alamat;
    if (this.kota != null) {
      data['kota'] = this.kota.toJson();
    }
    if (this.kendaraan != null) {
      data['kendaraan'] = this.kendaraan.toJson();
    }
    return data;
  }
}

class Kota {
  int id;
  String nama;
  String namaIbuKota;
  String kodeKota;
  int idProvinsi;
  String createBy;
  String createdAt;
  String updateBy;
  String updateAt;
  String nama2;
  String hub;
  String prefix;
  Cabang cabang;

  Kota(
      {this.id,
      this.nama,
      this.namaIbuKota,
      this.kodeKota,
      this.idProvinsi,
      this.createBy,
      this.createdAt,
      this.updateBy,
      this.updateAt,
      this.nama2,
      this.hub,
      this.prefix,
      this.cabang});

  Kota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    namaIbuKota = json['nama_ibu_kota'];
    kodeKota = json['kode_kota'];
    idProvinsi = json['id_provinsi'];
    createBy = json['create_by'];
    createdAt = json['created_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    nama2 = json['nama2'];
    hub = json['hub'];
    prefix = json['prefix'];
    cabang =
        json['cabang'] != null ? new Cabang.fromJson(json['cabang']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['nama_ibu_kota'] = this.namaIbuKota;
    data['kode_kota'] = this.kodeKota;
    data['id_provinsi'] = this.idProvinsi;
    data['create_by'] = this.createBy;
    data['created_at'] = this.createdAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    data['nama2'] = this.nama2;
    data['hub'] = this.hub;
    data['prefix'] = this.prefix;
    if (this.cabang != null) {
      data['cabang'] = this.cabang.toJson();
    }
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
  String createBy;
  String createAt;
  String updateBy;
  String updateAt;
  int act;
  String tglPajakTahunan;
  String tglPajak5Tahunan;
  String kodeSubcon;
  String aktif;
  String createdAt;
  String updatedAt;
  String nopolLama;
  String createdBy;
  String updatedBy;

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
