class DeliveryOrder {
  String nomor;
  String tanggal;
  String kodeCustomer;
  String kodeMarketing;
  int idKotaAsal;
  int idKotaTujuan;
  String kodeOutlet;
  String pendapatan;
  String typeKiriman;
  String jenisPengiriman;
  int biayaTambahan;
  int biayaKomisi;
  dynamic ppn;
  String total;
  int diskon;
  String totalNet;
  String status;
  String namaPengirim;
  String alamatPengirim;
  String telponPengirim;
  String namaPenerima;
  String alamatPenerima;
  String telponPenerima;
  dynamic nopol;
  String berat;
  String panjang;
  String lebar;
  String tinggi;
  String koli;
  String tarifDasar;
  String tarifPenerus;
  String kodePosPengirim;
  String kodePosPenerima;
  String instruksi;
  String deskripsi;
  dynamic jenisPembayaran;
  String companyNamePengirim;
  String companyNamePenerima;
  dynamic kodeTipeAngkutan;
  dynamic noSuratJalan;
  String catatanAdmin;
  dynamic idPenerima;
  dynamic noSuratJalanTrayek;
  dynamic idKendaraan;
  String kodeCabang;
  dynamic nomorSuratJalan;
  dynamic nomorInvoice;
  dynamic nomorDoAwal;
  dynamic tipe;
  dynamic namaSubcon;
  dynamic driver;
  dynamic coDriver;
  dynamic tarifClaim;
  dynamic jenisTarif;
  dynamic tipeTarif;
  dynamic ritase;
  dynamic nomorShipment;
  dynamic nomorBeritaAcara;
  String jenis;
  dynamic awalShutle;
  dynamic akhirShutle;
  dynamic statusKendaraan;
  dynamic kodeSubcon;
  dynamic kontrak;
  int uangJalan;
  String jumlah;
  String kodeSatuan;
  dynamic jenisPpn;
  dynamic accPenjualan;
  dynamic kontrakCus;
  dynamic kontrakCusDt;
  dynamic kodeTarif;
  dynamic keteranganTarif;
  String statusDo;
  int idKecamatanTujuan;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  dynamic diskonVal;
  int diskonValue;
  bool edit;
  dynamic accPiutangDo;
  dynamic csfPiutangDo;
  dynamic accPendapatanDo;
  dynamic csfPendapatanDo;
  int totalVendo;
  int totalDpp;
  dynamic ppnVal;
  bool tarifVendorBol;
  dynamic namaTarifVendor;
  dynamic idTarifVendor;
  dynamic posting;
  dynamic tanggalPosting;
  dynamic kontrakProjectId;
  dynamic kontrakProjectDt;
  String lintasId;
  String biayaAgen;
  dynamic deletedAt;
  String jenisDo;
  dynamic idStasiunAsal;
  dynamic idStasiunTujuan;
  dynamic metodePembayaran;
  String tarifLainLain;
  dynamic tanggalOrder;
  dynamic feePusat;
  Cabang cabang;
  dynamic shippingOrder;
  Asal asal;
  Asal tujuan;
  Customer customer;
  Agen agen;
  Tracking tracking;

  DeliveryOrder({
    this.nomor,
    this.tanggal,
    this.kodeCustomer,
    this.kodeMarketing,
    this.idKotaAsal,
    this.idKotaTujuan,
    this.kodeOutlet,
    this.pendapatan,
    this.typeKiriman,
    this.jenisPengiriman,
    this.biayaTambahan,
    this.biayaKomisi,
    this.ppn,
    this.total,
    this.diskon,
    this.totalNet,
    this.status,
    this.namaPengirim,
    this.alamatPengirim,
    this.telponPengirim,
    this.namaPenerima,
    this.alamatPenerima,
    this.telponPenerima,
    this.nopol,
    this.berat,
    this.panjang,
    this.lebar,
    this.tinggi,
    this.koli,
    this.tarifDasar,
    this.tarifPenerus,
    this.kodePosPengirim,
    this.kodePosPenerima,
    this.instruksi,
    this.deskripsi,
    this.jenisPembayaran,
    this.companyNamePengirim,
    this.companyNamePenerima,
    this.kodeTipeAngkutan,
    this.noSuratJalan,
    this.catatanAdmin,
    this.idPenerima,
    this.noSuratJalanTrayek,
    this.idKendaraan,
    this.kodeCabang,
    this.nomorSuratJalan,
    this.nomorInvoice,
    this.nomorDoAwal,
    this.tipe,
    this.namaSubcon,
    this.driver,
    this.coDriver,
    this.tarifClaim,
    this.jenisTarif,
    this.tipeTarif,
    this.ritase,
    this.nomorShipment,
    this.nomorBeritaAcara,
    this.jenis,
    this.awalShutle,
    this.akhirShutle,
    this.statusKendaraan,
    this.kodeSubcon,
    this.kontrak,
    this.uangJalan,
    this.jumlah,
    this.kodeSatuan,
    this.jenisPpn,
    this.accPenjualan,
    this.kontrakCus,
    this.kontrakCusDt,
    this.kodeTarif,
    this.keteranganTarif,
    this.statusDo,
    this.idKecamatanTujuan,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.diskonVal,
    this.diskonValue,
    this.edit,
    this.accPiutangDo,
    this.csfPiutangDo,
    this.accPendapatanDo,
    this.csfPendapatanDo,
    this.totalVendo,
    this.totalDpp,
    this.ppnVal,
    this.tarifVendorBol,
    this.namaTarifVendor,
    this.idTarifVendor,
    this.posting,
    this.tanggalPosting,
    this.kontrakProjectId,
    this.kontrakProjectDt,
    this.lintasId,
    this.biayaAgen,
    this.deletedAt,
    this.jenisDo,
    this.idStasiunAsal,
    this.idStasiunTujuan,
    this.metodePembayaran,
    this.tarifLainLain,
    this.tanggalOrder,
    this.feePusat,
    this.cabang,
    this.shippingOrder,
    this.asal,
    this.tujuan,
    this.customer,
    this.agen,
    this.tracking,
  });

  DeliveryOrder.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    tanggal = json['tanggal'];
    kodeCustomer = json['kode_customer'];
    kodeMarketing = json['kode_marketing'];
    idKotaAsal = json['id_kota_asal'];
    idKotaTujuan = json['id_kota_tujuan'];
    kodeOutlet = json['kode_outlet'];
    pendapatan = json['pendapatan'];
    typeKiriman = json['type_kiriman'];
    jenisPengiriman = json['jenis_pengiriman'];
    biayaTambahan = json['biaya_tambahan'];
    biayaKomisi = json['biaya_komisi'];
    ppn = json['ppn'];
    total = json['total'];
    diskon = json['diskon'];
    totalNet = json['total_net'];
    status = json['status'];
    namaPengirim = json['nama_pengirim'];
    alamatPengirim = json['alamat_pengirim'];
    telponPengirim = json['telpon_pengirim'];
    namaPenerima = json['nama_penerima'];
    alamatPenerima = json['alamat_penerima'];
    telponPenerima = json['telpon_penerima'];
    nopol = json['nopol'];
    berat = json['berat'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    tinggi = json['tinggi'];
    koli = json['koli'];
    tarifDasar = json['tarif_dasar'];
    tarifPenerus = json['tarif_penerus'];
    kodePosPengirim = json['kode_pos_pengirim'];
    kodePosPenerima = json['kode_pos_penerima'];
    instruksi = json['instruksi'];
    deskripsi = json['deskripsi'];
    jenisPembayaran = json['jenis_pembayaran'];
    companyNamePengirim = json['company_name_pengirim'];
    companyNamePenerima = json['company_name_penerima'];
    kodeTipeAngkutan = json['kode_tipe_angkutan'];
    noSuratJalan = json['no_surat_jalan'];
    catatanAdmin = json['catatan_admin'];
    idPenerima = json['id_penerima'];
    noSuratJalanTrayek = json['no_surat_jalan_trayek'];
    idKendaraan = json['id_kendaraan'];
    kodeCabang = json['kode_cabang'];
    nomorSuratJalan = json['nomor_surat_jalan'];
    nomorInvoice = json['nomor_invoice'];
    nomorDoAwal = json['nomor_do_awal'];
    tipe = json['tipe'];
    namaSubcon = json['nama_subcon'];
    driver = json['driver'];
    coDriver = json['co_driver'];
    tarifClaim = json['tarif_claim'];
    jenisTarif = json['jenis_tarif'];
    tipeTarif = json['tipe_tarif'];
    ritase = json['ritase'];
    nomorShipment = json['nomor_shipment'];
    nomorBeritaAcara = json['nomor_berita_acara'];
    jenis = json['jenis'];
    awalShutle = json['awal_shutle'];
    akhirShutle = json['akhir_shutle'];
    statusKendaraan = json['status_kendaraan'];
    kodeSubcon = json['kode_subcon'];
    kontrak = json['kontrak'];
    uangJalan = json['uang_jalan'];
    jumlah = json['jumlah'];
    kodeSatuan = json['kode_satuan'];
    jenisPpn = json['jenis_ppn'];
    accPenjualan = json['acc_penjualan'];
    kontrakCus = json['kontrak_cus'];
    kontrakCusDt = json['kontrak_cus_dt'];
    kodeTarif = json['kode_tarif'];
    keteranganTarif = json['keterangan_tarif'];
    statusDo = json['status_do'];
    idKecamatanTujuan = json['id_kecamatan_tujuan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    diskonVal = json['diskon_val'];
    diskonValue = json['diskon_value'];
    edit = json['edit'];
    accPiutangDo = json['acc_piutang_do'];
    csfPiutangDo = json['csf_piutang_do'];
    accPendapatanDo = json['acc_pendapatan_do'];
    csfPendapatanDo = json['csf_pendapatan_do'];
    totalVendo = json['total_vendo'];
    totalDpp = json['total_dpp'];
    ppnVal = json['ppn_val'];
    tarifVendorBol = json['tarif_vendor_bol'];
    namaTarifVendor = json['nama_tarif_vendor'];
    idTarifVendor = json['id_tarif_vendor'];
    posting = json['posting'];
    tanggalPosting = json['tanggal_posting'];
    kontrakProjectId = json['kontrak_project_id'];
    kontrakProjectDt = json['kontrak_project_dt'];
    lintasId = json['lintas_id'];
    biayaAgen = json['biaya_agen'];
    deletedAt = json['deleted_at'];
    jenisDo = json['jenis_do'];
    idStasiunAsal = json['id_stasiun_asal'];
    idStasiunTujuan = json['id_stasiun_tujuan'];
    metodePembayaran = json['metode_pembayaran'];
    tarifLainLain = json['tarif_lain_lain'];
    tanggalOrder = json['tanggal_order'];
    feePusat = json['fee_pusat'];
    cabang =
        json['cabang'] != null ? new Cabang.fromJson(json['cabang']) : null;
    shippingOrder = json['shipping_order'];
    asal = json['asal'] != null ? new Asal.fromJson(json['asal']) : null;
    tujuan = json['tujuan'] != null ? new Asal.fromJson(json['tujuan']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;

    agen = json['agen'] != null ? new Agen.fromJson(json['agen']) : null;
    tracking = json['tracking'] != null
        ? new Tracking.fromJson(json['tracking'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['tanggal'] = this.tanggal;
    data['kode_customer'] = this.kodeCustomer;
    data['kode_marketing'] = this.kodeMarketing;
    data['id_kota_asal'] = this.idKotaAsal;
    data['id_kota_tujuan'] = this.idKotaTujuan;
    data['kode_outlet'] = this.kodeOutlet;
    data['pendapatan'] = this.pendapatan;
    data['type_kiriman'] = this.typeKiriman;
    data['jenis_pengiriman'] = this.jenisPengiriman;
    data['biaya_tambahan'] = this.biayaTambahan;
    data['biaya_komisi'] = this.biayaKomisi;
    data['ppn'] = this.ppn;
    data['total'] = this.total;
    data['diskon'] = this.diskon;
    data['total_net'] = this.totalNet;
    data['status'] = this.status;
    data['nama_pengirim'] = this.namaPengirim;
    data['alamat_pengirim'] = this.alamatPengirim;
    data['telpon_pengirim'] = this.telponPengirim;
    data['nama_penerima'] = this.namaPenerima;
    data['alamat_penerima'] = this.alamatPenerima;
    data['telpon_penerima'] = this.telponPenerima;
    data['nopol'] = this.nopol;
    data['berat'] = this.berat;
    data['panjang'] = this.panjang;
    data['lebar'] = this.lebar;
    data['tinggi'] = this.tinggi;
    data['koli'] = this.koli;
    data['tarif_dasar'] = this.tarifDasar;
    data['tarif_penerus'] = this.tarifPenerus;
    data['kode_pos_pengirim'] = this.kodePosPengirim;
    data['kode_pos_penerima'] = this.kodePosPenerima;
    data['instruksi'] = this.instruksi;
    data['deskripsi'] = this.deskripsi;
    data['jenis_pembayaran'] = this.jenisPembayaran;
    data['company_name_pengirim'] = this.companyNamePengirim;
    data['company_name_penerima'] = this.companyNamePenerima;
    data['kode_tipe_angkutan'] = this.kodeTipeAngkutan;
    data['no_surat_jalan'] = this.noSuratJalan;
    data['catatan_admin'] = this.catatanAdmin;
    data['id_penerima'] = this.idPenerima;
    data['no_surat_jalan_trayek'] = this.noSuratJalanTrayek;
    data['id_kendaraan'] = this.idKendaraan;
    data['kode_cabang'] = this.kodeCabang;
    data['nomor_surat_jalan'] = this.nomorSuratJalan;
    data['nomor_invoice'] = this.nomorInvoice;
    data['nomor_do_awal'] = this.nomorDoAwal;
    data['tipe'] = this.tipe;
    data['nama_subcon'] = this.namaSubcon;
    data['driver'] = this.driver;
    data['co_driver'] = this.coDriver;
    data['tarif_claim'] = this.tarifClaim;
    data['jenis_tarif'] = this.jenisTarif;
    data['tipe_tarif'] = this.tipeTarif;
    data['ritase'] = this.ritase;
    data['nomor_shipment'] = this.nomorShipment;
    data['nomor_berita_acara'] = this.nomorBeritaAcara;
    data['jenis'] = this.jenis;
    data['awal_shutle'] = this.awalShutle;
    data['akhir_shutle'] = this.akhirShutle;
    data['status_kendaraan'] = this.statusKendaraan;
    data['kode_subcon'] = this.kodeSubcon;
    data['kontrak'] = this.kontrak;
    data['uang_jalan'] = this.uangJalan;
    data['jumlah'] = this.jumlah;
    data['kode_satuan'] = this.kodeSatuan;
    data['jenis_ppn'] = this.jenisPpn;
    data['acc_penjualan'] = this.accPenjualan;
    data['kontrak_cus'] = this.kontrakCus;
    data['kontrak_cus_dt'] = this.kontrakCusDt;
    data['kode_tarif'] = this.kodeTarif;
    data['keterangan_tarif'] = this.keteranganTarif;
    data['status_do'] = this.statusDo;
    data['id_kecamatan_tujuan'] = this.idKecamatanTujuan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['diskon_val'] = this.diskonVal;
    data['diskon_value'] = this.diskonValue;
    data['edit'] = this.edit;
    data['acc_piutang_do'] = this.accPiutangDo;
    data['csf_piutang_do'] = this.csfPiutangDo;
    data['acc_pendapatan_do'] = this.accPendapatanDo;
    data['csf_pendapatan_do'] = this.csfPendapatanDo;
    data['total_vendo'] = this.totalVendo;
    data['total_dpp'] = this.totalDpp;
    data['ppn_val'] = this.ppnVal;
    data['tarif_vendor_bol'] = this.tarifVendorBol;
    data['nama_tarif_vendor'] = this.namaTarifVendor;
    data['id_tarif_vendor'] = this.idTarifVendor;
    data['posting'] = this.posting;
    data['tanggal_posting'] = this.tanggalPosting;
    data['kontrak_project_id'] = this.kontrakProjectId;
    data['kontrak_project_dt'] = this.kontrakProjectDt;
    data['lintas_id'] = this.lintasId;
    data['biaya_agen'] = this.biayaAgen;
    data['deleted_at'] = this.deletedAt;
    data['jenis_do'] = this.jenisDo;
    data['id_stasiun_asal'] = this.idStasiunAsal;
    data['id_stasiun_tujuan'] = this.idStasiunTujuan;
    data['metode_pembayaran'] = this.metodePembayaran;
    data['tarif_lain_lain'] = this.tarifLainLain;
    data['tanggal_order'] = this.tanggalOrder;
    data['fee_pusat'] = this.feePusat;
    if (this.cabang != null) {
      data['cabang'] = this.cabang.toJson();
    }
    data['shipping_order'] = this.shippingOrder;
    if (this.asal != null) {
      data['asal'] = this.asal.toJson();
    }
    if (this.tujuan != null) {
      data['tujuan'] = this.tujuan.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }

    if (this.agen != null) {
      data['agen'] = this.agen.toJson();
    }

    if (this.tracking != null) {
      data['tracking'] = this.tracking.toJson();
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
      this.status});

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
  String persentase;
  String createdAt;
  String jenisPpn;
  dynamic global;
  String diskon;
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
  dynamic csfHutang;
  int syaratKredit;
  String aktif;
  String createdAt;
  String ktp;
  String npwp;
  int pajakId;
  dynamic email;

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
      this.email});

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
    return data;
  }
}

class Tracking {
  String id;
  String nomor;
  String status;
  String createdBy;
  String updatedBy;
  String expiredAt;
  String createdAt;
  String updatedAt;
  dynamic penerima;
  dynamic signature;
  dynamic completedAt;

  Tracking(
      {this.id,
      this.nomor,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.expiredAt,
      this.createdAt,
      this.updatedAt,
      this.penerima,
      this.signature,
      this.completedAt});

  Tracking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomor = json['nomor'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    expiredAt = json['expired_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    penerima = json['penerima'];
    signature = json['signature'];
    completedAt = json['completed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomor'] = this.nomor;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['expired_at'] = this.expiredAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['penerima'] = this.penerima;
    data['signature'] = this.signature;
    data['completed_at'] = this.completedAt;
    return data;
  }
}
