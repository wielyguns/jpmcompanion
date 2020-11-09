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
  int id;
  String nopol;
  String brncde;
  String divisi;
  String status;
  String vdrcde;
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
  String createdAt;
  Null updatedAt;
  String nopolLama;
  Null createdBy;
  Null updatedBy;

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
      this.updatedBy});

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
