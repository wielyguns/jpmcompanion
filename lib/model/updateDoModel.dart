class TrackingDescription {
  dynamic id;
  dynamic deskripsi;
  dynamic trackingTypeId;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  TrackingDescription(
      {this.id,
      this.deskripsi,
      this.trackingTypeId,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  TrackingDescription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deskripsi = json['deskripsi'];
    trackingTypeId = json['tracking_type_id'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deskripsi'] = this.deskripsi;
    data['tracking_type_id'] = this.trackingTypeId;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TrackingType {
  dynamic id;
  dynamic deskripsi;
  dynamic status;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic createdAt;
  dynamic updatedAt;

  TrackingType(
      {this.id,
      this.deskripsi,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  TrackingType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deskripsi = json['deskripsi'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
