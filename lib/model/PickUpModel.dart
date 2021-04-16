class PickUp {
  int id;
  String kode;
  String tanggal;
  dynamic waktuSelesai;
  String kodeCabang;
  String namaPengirim;
  int asalId;
  String emailPengirim;
  String alamatPengirim;
  String telponPengirim;
  String kodePosPengirim;
  String namaPenerima;
  int tujuanId;
  String emailPenerima;
  String alamatPenerima;
  String telponPenerima;
  String kodePosPenerima;
  dynamic lat;
  dynamic long;
  String keterangan;
  String berat;
  int koli;
  int panjang;
  int lebar;
  int tinggi;
  String total;
  String biayaTambahan;
  String totalNet;
  String status;
  String metodePembayaran;
  String typeKiriman;
  String customerId;
  int courierId;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  dynamic alasanCancel;
  dynamic proofment;
  Asal asal;
  Customer customer;
  Tujuan tujuan;
  dynamic jumlahTujuan;

  PickUp({
    this.id,
    this.kode,
    this.tanggal,
    this.waktuSelesai,
    this.kodeCabang,
    this.namaPengirim,
    this.asalId,
    this.emailPengirim,
    this.alamatPengirim,
    this.telponPengirim,
    this.kodePosPengirim,
    this.namaPenerima,
    this.tujuanId,
    this.emailPenerima,
    this.alamatPenerima,
    this.telponPenerima,
    this.kodePosPenerima,
    this.lat,
    this.long,
    this.keterangan,
    this.berat,
    this.koli,
    this.panjang,
    this.lebar,
    this.tinggi,
    this.total,
    this.biayaTambahan,
    this.totalNet,
    this.status,
    this.metodePembayaran,
    this.typeKiriman,
    this.customerId,
    this.courierId,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.alasanCancel,
    this.proofment,
    this.asal,
    this.customer,
    this.tujuan,
    this.jumlahTujuan,
  });

  PickUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    tanggal = json['tanggal'];
    waktuSelesai = json['waktu_selesai'];
    kodeCabang = json['kode_cabang'];
    namaPengirim = json['nama_pengirim'];
    asalId = json['asal_id'];
    emailPengirim = json['email_pengirim'];
    alamatPengirim = json['alamat_pengirim'];
    telponPengirim = json['telpon_pengirim'];
    kodePosPengirim = json['kode_pos_pengirim'];
    namaPenerima = json['nama_penerima'];
    tujuanId = json['tujuan_id'];
    emailPenerima = json['email_penerima'];
    alamatPenerima = json['alamat_penerima'];
    telponPenerima = json['telpon_penerima'];
    kodePosPenerima = json['kode_pos_penerima'];
    lat = json['lat'];
    long = json['long'];
    keterangan = json['keterangan'];
    berat = json['berat'];
    koli = json['koli'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    tinggi = json['tinggi'];
    total = json['total'];
    biayaTambahan = json['biaya_tambahan'];
    totalNet = json['total_net'];
    status = json['status'];
    metodePembayaran = json['metode_pembayaran'];
    typeKiriman = json['type_kiriman'];
    customerId = json['customer_id'];
    courierId = json['courier_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alasanCancel = json['alasan_cancel'];
    proofment = json['proofment'];
    asal = json['asal'] != null ? new Asal.fromJson(json['asal']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    tujuan =
        json['tujuan'] != null ? new Tujuan.fromJson(json['tujuan']) : null;
    jumlahTujuan = json['jumlah_tujuan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode'] = this.kode;
    data['tanggal'] = this.tanggal;
    data['waktu_selesai'] = this.waktuSelesai;
    data['kode_cabang'] = this.kodeCabang;
    data['nama_pengirim'] = this.namaPengirim;
    data['asal_id'] = this.asalId;
    data['email_pengirim'] = this.emailPengirim;
    data['alamat_pengirim'] = this.alamatPengirim;
    data['telpon_pengirim'] = this.telponPengirim;
    data['kode_pos_pengirim'] = this.kodePosPengirim;
    data['nama_penerima'] = this.namaPenerima;
    data['tujuan_id'] = this.tujuanId;
    data['email_penerima'] = this.emailPenerima;
    data['alamat_penerima'] = this.alamatPenerima;
    data['telpon_penerima'] = this.telponPenerima;
    data['kode_pos_penerima'] = this.kodePosPenerima;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['keterangan'] = this.keterangan;
    data['berat'] = this.berat;
    data['koli'] = this.koli;
    data['panjang'] = this.panjang;
    data['lebar'] = this.lebar;
    data['tinggi'] = this.tinggi;
    data['total'] = this.total;
    data['biaya_tambahan'] = this.biayaTambahan;
    data['total_net'] = this.totalNet;
    data['status'] = this.status;
    data['metode_pembayaran'] = this.metodePembayaran;
    data['type_kiriman'] = this.typeKiriman;
    data['customer_id'] = this.customerId;
    data['courier_id'] = this.courierId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['alasan_cancel'] = this.alasanCancel;
    data['proofment'] = this.proofment;
    data['jumlah_tujuan'] = this.jumlahTujuan;
    if (this.asal != null) {
      data['asal'] = this.asal.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    if (this.tujuan != null) {
      data['tujuan'] = this.tujuan.toJson();
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

class Customer {
  String kode;
  String nama;
  String alamat;
  String kota;
  dynamic propinsi;
  dynamic negara;
  String telpon;
  String plafon;
  String pajakNpwp;
  String pajakNama;
  String pajakAlamat;
  String pajakKota;
  String namaPph23;
  String typeFakturPpn;
  String accPiutang;
  String csfPiutang;
  String syaratKredit;
  dynamic groups;
  String holdId;
  String compId;
  String subCompId;
  bool pph23;
  bool ppn;
  dynamic tipe;
  int idCus;
  String kodeBank;
  String cabang;
  String pajakTarif;
  String picTelpon;
  String picStatus;
  String picFax;
  String picEmail;
  String groupCustomer;
  String picNama;
  String picAlamat;
  dynamic persentase;
  String createdAt;
  dynamic jenisPpn;
  dynamic global;
  dynamic diskon;
  dynamic refAgen;
  dynamic persentaseBonsem;
  dynamic tarifKoran;

  Customer(
      {this.kode,
      this.nama,
      this.alamat,
      this.kota,
      this.propinsi,
      this.negara,
      this.telpon,
      this.plafon,
      this.pajakNpwp,
      this.pajakNama,
      this.pajakAlamat,
      this.pajakKota,
      this.namaPph23,
      this.typeFakturPpn,
      this.accPiutang,
      this.csfPiutang,
      this.syaratKredit,
      this.groups,
      this.holdId,
      this.compId,
      this.subCompId,
      this.pph23,
      this.ppn,
      this.tipe,
      this.idCus,
      this.kodeBank,
      this.cabang,
      this.pajakTarif,
      this.picTelpon,
      this.picStatus,
      this.picFax,
      this.picEmail,
      this.groupCustomer,
      this.picNama,
      this.picAlamat,
      this.persentase,
      this.createdAt,
      this.jenisPpn,
      this.global,
      this.diskon,
      this.refAgen,
      this.persentaseBonsem,
      this.tarifKoran});

  Customer.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    nama = json['nama'];
    alamat = json['alamat'];
    kota = json['kota'];
    propinsi = json['propinsi'];
    negara = json['negara'];
    telpon = json['telpon'];
    plafon = json['plafon'];
    pajakNpwp = json['pajak_npwp'];
    pajakNama = json['pajak_nama'];
    pajakAlamat = json['pajak_alamat'];
    pajakKota = json['pajak_kota'];
    namaPph23 = json['nama_pph23'];
    typeFakturPpn = json['type_faktur_ppn'];
    accPiutang = json['acc_piutang'];
    csfPiutang = json['csf_piutang'];
    syaratKredit = json['syarat_kredit'];
    groups = json['groups'];
    holdId = json['hold_id'];
    compId = json['comp_id'];
    subCompId = json['sub_comp_id'];
    pph23 = json['pph23'];
    ppn = json['ppn'];
    tipe = json['tipe'];
    idCus = json['id_cus'];
    kodeBank = json['kode_bank'];
    cabang = json['cabang'];
    pajakTarif = json['pajak_tarif'];
    picTelpon = json['pic_telpon'];
    picStatus = json['pic_status'];
    picFax = json['pic_fax'];
    picEmail = json['pic_email'];
    groupCustomer = json['group_customer'];
    picNama = json['pic_nama'];
    picAlamat = json['pic_alamat'];
    persentase = json['persentase'];
    createdAt = json['created_at'];
    jenisPpn = json['jenis_ppn'];
    global = json['global'];
    diskon = json['diskon'];
    refAgen = json['ref_agen'];
    persentaseBonsem = json['persentase_bonsem'];
    tarifKoran = json['tarif_koran'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['kota'] = this.kota;
    data['propinsi'] = this.propinsi;
    data['negara'] = this.negara;
    data['telpon'] = this.telpon;
    data['plafon'] = this.plafon;
    data['pajak_npwp'] = this.pajakNpwp;
    data['pajak_nama'] = this.pajakNama;
    data['pajak_alamat'] = this.pajakAlamat;
    data['pajak_kota'] = this.pajakKota;
    data['nama_pph23'] = this.namaPph23;
    data['type_faktur_ppn'] = this.typeFakturPpn;
    data['acc_piutang'] = this.accPiutang;
    data['csf_piutang'] = this.csfPiutang;
    data['syarat_kredit'] = this.syaratKredit;
    data['groups'] = this.groups;
    data['hold_id'] = this.holdId;
    data['comp_id'] = this.compId;
    data['sub_comp_id'] = this.subCompId;
    data['pph23'] = this.pph23;
    data['ppn'] = this.ppn;
    data['tipe'] = this.tipe;
    data['id_cus'] = this.idCus;
    data['kode_bank'] = this.kodeBank;
    data['cabang'] = this.cabang;
    data['pajak_tarif'] = this.pajakTarif;
    data['pic_telpon'] = this.picTelpon;
    data['pic_status'] = this.picStatus;
    data['pic_fax'] = this.picFax;
    data['pic_email'] = this.picEmail;
    data['group_customer'] = this.groupCustomer;
    data['pic_nama'] = this.picNama;
    data['pic_alamat'] = this.picAlamat;
    data['persentase'] = this.persentase;
    data['created_at'] = this.createdAt;
    data['jenis_ppn'] = this.jenisPpn;
    data['global'] = this.global;
    data['diskon'] = this.diskon;
    data['ref_agen'] = this.refAgen;
    data['persentase_bonsem'] = this.persentaseBonsem;
    data['tarif_koran'] = this.tarifKoran;
    return data;
  }
}

class Tujuan {
  int id;
  String nama;
  int idKota;
  dynamic createBy;
  dynamic createdAt;
  dynamic updateBy;
  dynamic updateAt;
  Asal kota;

  Tujuan(
      {this.id,
      this.nama,
      this.idKota,
      this.createBy,
      this.createdAt,
      this.updateBy,
      this.updateAt,
      this.kota});

  Tujuan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    idKota = json['id_kota'];
    createBy = json['create_by'];
    createdAt = json['created_at'];
    updateBy = json['update_by'];
    updateAt = json['update_at'];
    kota = json['kota'] != null ? new Asal.fromJson(json['kota']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['id_kota'] = this.idKota;
    data['create_by'] = this.createBy;
    data['created_at'] = this.createdAt;
    data['update_by'] = this.updateBy;
    data['update_at'] = this.updateAt;
    if (this.kota != null) {
      data['kota'] = this.kota.toJson();
    }
    return data;
  }
}
