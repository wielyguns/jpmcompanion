class Tracking {
  String id;
  String nomor;
  String status;
  String createdBy;
  String updatedBy;
  String expiredAt;
  String createdAt;
  String updatedAt;
  String penerima;
  String signature;
  String completedAt;
  List<TrackingD> trackingD;
  TrackingType trackingType;

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
      this.completedAt,
      this.trackingD,
      this.trackingType});

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
    if (json['tracking_d'] != null) {
      trackingD = new List<TrackingD>();
      json['tracking_d'].forEach((v) {
        trackingD.add(new TrackingD.fromJson(v));
      });
    }
    trackingType = json['tracking_type'] != null
        ? new TrackingType.fromJson(json['tracking_type'])
        : null;
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
    if (this.trackingD != null) {
      data['tracking_d'] = this.trackingD.map((v) => v.toJson()).toList();
    }
    if (this.trackingType != null) {
      data['tracking_type'] = this.trackingType.toJson();
    }
    return data;
  }
}

class TrackingD {
  String trackingId;
  String dt;
  String deskripsi;
  int trackingDescriptionId;
  String kodeCabang;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  String nopol;
  int kendaraanId;

  TrackingD(
      {this.trackingId,
      this.dt,
      this.deskripsi,
      this.trackingDescriptionId,
      this.kodeCabang,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.nopol,
      this.kendaraanId});

  TrackingD.fromJson(Map<String, dynamic> json) {
    trackingId = json['tracking_id'];
    dt = json['dt'];
    deskripsi = json['deskripsi'];
    trackingDescriptionId = json['tracking_description_id'];
    kodeCabang = json['kode_cabang'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nopol = json['nopol'];
    kendaraanId = json['kendaraan_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_id'] = this.trackingId;
    data['dt'] = this.dt;
    data['deskripsi'] = this.deskripsi;
    data['tracking_description_id'] = this.trackingDescriptionId;
    data['kode_cabang'] = this.kodeCabang;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['nopol'] = this.nopol;
    data['kendaraan_id'] = this.kendaraanId;
    return data;
  }
}

class TrackingType {
  int id;
  String deskripsi;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  int levelProgress;

  TrackingType(
      {this.id,
      this.deskripsi,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.levelProgress});

  TrackingType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deskripsi = json['deskripsi'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    levelProgress = json['level_progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deskripsi'] = this.deskripsi;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['level_progress'] = this.levelProgress;
    return data;
  }
}
