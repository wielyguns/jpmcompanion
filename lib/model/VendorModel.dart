class Vendor {
  String kode;
  String nama;
  String tipe;
  int idKota;
  String kodePos;
  String alamat;
  String telpon;
  bool status;
  String version;
  String createBy;
  String createAt;
  String updateBy;
  String updateAt;
  String accPenjualan;
  String csfPenjualan;
  String accHutang;
  int idVendor;
  String csfHutang;
  int komisiVendor;
  String cabangVendor;
  String syaratKredit;
  String ktp;
  String npwp;
  String aktif;
  int pajakId;
  String fax;
  String uploadMou;

  Vendor(
      {this.kode,
      this.nama,
      this.tipe,
      this.idKota,
      this.kodePos,
      this.alamat,
      this.telpon,
      this.status,
      this.version,
      this.createBy,
      this.createAt,
      this.updateBy,
      this.updateAt,
      this.accPenjualan,
      this.csfPenjualan,
      this.accHutang,
      this.idVendor,
      this.csfHutang,
      this.komisiVendor,
      this.cabangVendor,
      this.syaratKredit,
      this.ktp,
      this.npwp,
      this.aktif,
      this.pajakId,
      this.fax,
      this.uploadMou});

  Vendor.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    nama = json['nama'];
    tipe = json['tipe'];
    idKota = json['id_kota'];
    kodePos = json['kode_pos'];
    alamat = json['alamat'];
    telpon = json['telpon'];
    status = json['status'];
    version = json['version'];
    createBy = json['create_by'];
    createAt = json['create_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    accPenjualan = json['acc_penjualan'];
    csfPenjualan = json['csf_penjualan'];
    accHutang = json['acc_hutang'];
    idVendor = json['id_vendor'];
    csfHutang = json['csf_hutang'];
    komisiVendor = json['komisi_vendor'];
    cabangVendor = json['cabang_vendor'];
    syaratKredit = json['syarat_kredit'];
    ktp = json['ktp'];
    npwp = json['npwp'];
    aktif = json['aktif'];
    pajakId = json['pajak_id'];
    fax = json['fax'];
    uploadMou = json['upload_mou'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    data['tipe'] = this.tipe;
    data['id_kota'] = this.idKota;
    data['kode_pos'] = this.kodePos;
    data['alamat'] = this.alamat;
    data['telpon'] = this.telpon;
    data['status'] = this.status;
    data['version'] = this.version;
    data['create_by'] = this.createBy;
    data['create_at'] = this.createAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    data['acc_penjualan'] = this.accPenjualan;
    data['csf_penjualan'] = this.csfPenjualan;
    data['acc_hutang'] = this.accHutang;
    data['id_vendor'] = this.idVendor;
    data['csf_hutang'] = this.csfHutang;
    data['komisi_vendor'] = this.komisiVendor;
    data['cabang_vendor'] = this.cabangVendor;
    data['syarat_kredit'] = this.syaratKredit;
    data['ktp'] = this.ktp;
    data['npwp'] = this.npwp;
    data['aktif'] = this.aktif;
    data['pajak_id'] = this.pajakId;
    data['fax'] = this.fax;
    data['upload_mou'] = this.uploadMou;
    return data;
  }
}
