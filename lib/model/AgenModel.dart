class Agen {
  String kode;
  String nama;
  String kodeArea;
  String kategori;
  int idKota;
  String alamat;
  String telpon;
  String fax;
  dynamic version;
  dynamic createBy;
  dynamic createAt;
  dynamic updateBy;
  dynamic updateAt;
  String kodeCabang;
  String komisi;
  String accPenjualan;
  String csfPenjualan;
  String accHutang;
  int idAgen;
  String komisiAgen;
  String csfHutang;
  dynamic syaratKredit;
  String aktif;
  String createdAt;
  dynamic ktp;
  dynamic npwp;
  dynamic pajakId;
  dynamic email;
  dynamic lat;
  dynamic long;

  Agen(
      {this.kode,
      this.nama,
      this.kodeArea,
      this.kategori,
      this.idKota,
      this.alamat,
      this.telpon,
      this.fax,
      this.version,
      this.createBy,
      this.createAt,
      this.updateBy,
      this.updateAt,
      this.kodeCabang,
      this.komisi,
      this.accPenjualan,
      this.csfPenjualan,
      this.accHutang,
      this.idAgen,
      this.komisiAgen,
      this.csfHutang,
      this.syaratKredit,
      this.aktif,
      this.createdAt,
      this.ktp,
      this.npwp,
      this.pajakId,
      this.email,
      this.lat,
      this.long});

  Agen.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    nama = json['nama'];
    kodeArea = json['kode_area'];
    kategori = json['kategori'];
    idKota = json['id_kota'];
    alamat = json['alamat'];
    telpon = json['telpon'];
    fax = json['fax'];
    version = json['version'];
    createBy = json['create_by'];
    createAt = json['create_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    kodeCabang = json['kode_cabang'];
    komisi = json['komisi'];
    accPenjualan = json['acc_penjualan'];
    csfPenjualan = json['csf_penjualan'];
    accHutang = json['acc_hutang'];
    idAgen = json['id_agen'];
    komisiAgen = json['komisi_agen'];
    csfHutang = json['csf_hutang'];
    syaratKredit = json['syarat_kredit'];
    aktif = json['aktif'];
    createdAt = json['created_at'];
    ktp = json['ktp'];
    npwp = json['npwp'];
    pajakId = json['pajak_id'];
    email = json['email'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    data['kode_area'] = this.kodeArea;
    data['kategori'] = this.kategori;
    data['id_kota'] = this.idKota;
    data['alamat'] = this.alamat;
    data['telpon'] = this.telpon;
    data['fax'] = this.fax;
    data['version'] = this.version;
    data['create_by'] = this.createBy;
    data['create_at'] = this.createAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    data['kode_cabang'] = this.kodeCabang;
    data['komisi'] = this.komisi;
    data['acc_penjualan'] = this.accPenjualan;
    data['csf_penjualan'] = this.csfPenjualan;
    data['acc_hutang'] = this.accHutang;
    data['id_agen'] = this.idAgen;
    data['komisi_agen'] = this.komisiAgen;
    data['csf_hutang'] = this.csfHutang;
    data['syarat_kredit'] = this.syaratKredit;
    data['aktif'] = this.aktif;
    data['created_at'] = this.createdAt;
    data['ktp'] = this.ktp;
    data['npwp'] = this.npwp;
    data['pajak_id'] = this.pajakId;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
