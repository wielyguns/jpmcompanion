class Courier {
  int id;
  String kode;
  String nama;
  String email;
  String telpon;
  String kodeCabang;
  int kendaraanId;
  dynamic userId;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  dynamic rute;
  Cabang cabang;
  Kendaraan kendaraan;

  Courier(
      {this.id,
      this.kode,
      this.nama,
      this.email,
      this.telpon,
      this.kodeCabang,
      this.kendaraanId,
      this.userId,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.rute,
      this.cabang,
      this.kendaraan});

  Courier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    nama = json['nama'];
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
    rute = json['rute'];
    cabang =
        json['cabang'] != null ? new Cabang.fromJson(json['cabang']) : null;
    kendaraan = json['kendaraan'] != null
        ? new Kendaraan.fromJson(json['kendaraan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode'] = this.kode;
    data['nama'] = this.nama;
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
    data['rute'] = this.rute;
    if (this.cabang != null) {
      data['cabang'] = this.cabang.toJson();
    }
    if (this.kendaraan != null) {
      data['kendaraan'] = this.kendaraan.toJson();
    }
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
  dynamic version;
  dynamic createBy;
  dynamic createAt;
  dynamic updateBy;
  dynamic updateAt;
  String status;
  int jamCutOff;
  String lat;
  String long;
  int penanggungJawab;
  String image;
  String keterangan;

  Cabang(
      {this.kode,
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
      this.keterangan});

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
    return data;
  }
}

class Kendaraan {
  int id;
  String nopol;
  dynamic brncde;
  String divisi;
  String status;
  dynamic vdrcde;
  dynamic vdrnme;
  String kode;
  String merk;
  String tipeAngkutan;
  String noRangka;
  String noMesin;
  String jenisBak;
  int p;
  int l;
  int t;
  dynamic volume;
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
  dynamic createBy;
  dynamic createAt;
  dynamic updateBy;
  dynamic updateAt;
  int act;
  dynamic tglPajakTahunan;
  dynamic tglPajak5Tahunan;
  String kodeSubcon;
  String aktif;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic nopolLama;
  dynamic createdBy;
  dynamic updatedBy;

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
