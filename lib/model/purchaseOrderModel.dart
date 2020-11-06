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
