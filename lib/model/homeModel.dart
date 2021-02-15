class DataDashboard {
  dynamic kirimanHariIni;
  dynamic kirimanKemarin;
  dynamic jumlahBulanLalu;
  dynamic totalBulanLalu;
  dynamic jumlahBulanIni;
  dynamic totalBulanIni;
  dynamic manifestedBulanIni;
  dynamic transitBulanIni;
  dynamic receivedBulanIni;
  dynamic deliveredBulanIni;
  dynamic pendingBulanIni;
  List<String> spotsName;

  DataDashboard(
      {this.kirimanHariIni,
      this.kirimanKemarin,
      this.jumlahBulanLalu,
      this.totalBulanLalu,
      this.jumlahBulanIni,
      this.totalBulanIni,
      this.manifestedBulanIni,
      this.transitBulanIni,
      this.receivedBulanIni,
      this.deliveredBulanIni,
      this.pendingBulanIni,
      this.spotsName});

  DataDashboard.fromJson(Map<String, dynamic> json) {
    kirimanHariIni = json['kirimanHariIni'];
    kirimanKemarin = json['kirimanKemarin'];
    jumlahBulanLalu = json['jumlahBulanLalu'];
    totalBulanLalu = json['totalBulanLalu'];
    jumlahBulanIni = json['jumlahBulanIni'];
    totalBulanIni = json['totalBulanIni'];
    manifestedBulanIni = json['manifestedBulanIni'];
    transitBulanIni = json['transitBulanIni'];
    receivedBulanIni = json['receivedBulanIni'];
    deliveredBulanIni = json['deliveredBulanIni'];
    pendingBulanIni = json['pendingBulanIni'];
    spotsName = json['spotsName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kirimanHariIni'] = this.kirimanHariIni;
    data['kirimanKemarin'] = this.kirimanKemarin;
    data['jumlahBulanLalu'] = this.jumlahBulanLalu;
    data['totalBulanLalu'] = this.totalBulanLalu;
    data['jumlahBulanIni'] = this.jumlahBulanIni;
    data['totalBulanIni'] = this.totalBulanIni;
    data['manifestedBulanIni'] = this.manifestedBulanIni;
    data['transitBulanIni'] = this.transitBulanIni;
    data['receivedBulanIni'] = this.receivedBulanIni;
    data['deliveredBulanIni'] = this.deliveredBulanIni;
    data['pendingBulanIni'] = this.pendingBulanIni;
    data['spotsName'] = this.spotsName;
    return data;
  }
}
