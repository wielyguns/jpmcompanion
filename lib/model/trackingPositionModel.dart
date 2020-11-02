class TrackingResult {
  CurrentDO currentDO;
  dynamic currentDoIDV3;
  dynamic currentDoIDV2;
  dynamic currentDoID;
  dynamic overSpeedStatus;
  dynamic overSpeedInGeoStatus;
  dynamic currentgoogleKec;
  dynamic currentgoogleKota;
  dynamic output2Status;
  dynamic output1Status;
  dynamic inputanalog2Status;
  dynamic inputanalog1Status;
  dynamic input3Status;
  dynamic input2Status;
  dynamic input1Status;
  dynamic currentGeoUplineAreaStatus;
  dynamic currentGeoUplineLocStatus;
  dynamic currentGeoAreaStatus;
  dynamic currentGeoLocationStatus;
  TotalkmYtd totalkmYtd;
  TotalkmYtd totalkmMtd;
  dynamic currentUtilisasiStatus;
  dynamic currentFatiqueStatus;
  dynamic currentDOV2;
  String gsmNo;
  String noAset;
  String groupNm;
  String nopol;
  String companyNm;
  TotalkmYtd totalkmToday;
  String carType;
  dynamic fuelUsedGps;
  dynamic rfidDriver;
  dynamic currentRuteGeoStatus;
  dynamic currentDMSScoreStatus;
  dynamic fuelSensorStatus;
  dynamic weightSensorStatus;
  dynamic currentDOV3;
  String carModel;
  dynamic input2;
  dynamic input1;
  dynamic gpsSatelit;
  dynamic gsmSignal;
  String addr;
  dynamic sos;
  dynamic acc;
  dynamic isAlarm;
  String kodePos;
  String provinsi;
  String kota;
  String kec;
  String alarmNm;
  String reportNm;
  String direction;
  CurrentStatusVehicle currentStatusVehicle;
  String driverNm;
  dynamic rfid;
  String gpsSn;
  String gpsTime;
  String stime;
  dynamic input3;
  dynamic input4;
  dynamic output1;
  dynamic output2;
  String geoUplineLocationTag;
  String geoUplineAreaTag;
  String geoUplinetypeNm;
  String geoUplineLocationNm;
  String geoUplineLocationCode;
  String geoUplineAreaCode;
  String geoUplineAreaNm;
  String geoAreaTag;
  String geoLocTag;
  String geotypeNm;
  String geoAreaCode;
  String geoAreaNm;
  String geoLocationCode;
  String geoLocationNm;
  dynamic speed;
  dynamic odometer;
  dynamic lat;
  dynamic lon;
  dynamic fuelLevel;
  dynamic batteryPercent;
  dynamic mainPowerVoltage;
  dynamic temperatur2;
  dynamic temperatur1;
  dynamic inputAnalog2;
  dynamic inputAnalog;

  TrackingResult(
      {this.currentDO,
      this.currentDoIDV3,
      this.currentDoIDV2,
      this.currentDoID,
      this.overSpeedStatus,
      this.overSpeedInGeoStatus,
      this.currentgoogleKec,
      this.currentgoogleKota,
      this.output2Status,
      this.output1Status,
      this.inputanalog2Status,
      this.inputanalog1Status,
      this.input3Status,
      this.input2Status,
      this.input1Status,
      this.currentGeoUplineAreaStatus,
      this.currentGeoUplineLocStatus,
      this.currentGeoAreaStatus,
      this.currentGeoLocationStatus,
      this.totalkmYtd,
      this.totalkmMtd,
      this.currentUtilisasiStatus,
      this.currentFatiqueStatus,
      this.currentDOV2,
      this.gsmNo,
      this.noAset,
      this.groupNm,
      this.nopol,
      this.companyNm,
      this.totalkmToday,
      this.carType,
      this.fuelUsedGps,
      this.rfidDriver,
      this.currentRuteGeoStatus,
      this.currentDMSScoreStatus,
      this.fuelSensorStatus,
      this.weightSensorStatus,
      this.currentDOV3,
      this.carModel,
      this.input2,
      this.input1,
      this.gpsSatelit,
      this.gsmSignal,
      this.addr,
      this.sos,
      this.acc,
      this.isAlarm,
      this.kodePos,
      this.provinsi,
      this.kota,
      this.kec,
      this.alarmNm,
      this.reportNm,
      this.direction,
      this.currentStatusVehicle,
      this.driverNm,
      this.rfid,
      this.gpsSn,
      this.gpsTime,
      this.stime,
      this.input3,
      this.input4,
      this.output1,
      this.output2,
      this.geoUplineLocationTag,
      this.geoUplineAreaTag,
      this.geoUplinetypeNm,
      this.geoUplineLocationNm,
      this.geoUplineLocationCode,
      this.geoUplineAreaCode,
      this.geoUplineAreaNm,
      this.geoAreaTag,
      this.geoLocTag,
      this.geotypeNm,
      this.geoAreaCode,
      this.geoAreaNm,
      this.geoLocationCode,
      this.geoLocationNm,
      this.speed,
      this.odometer,
      this.lat,
      this.lon,
      this.fuelLevel,
      this.batteryPercent,
      this.mainPowerVoltage,
      this.temperatur2,
      this.temperatur1,
      this.inputAnalog2,
      this.inputAnalog});

  TrackingResult.fromJson(Map<String, dynamic> json) {
    currentDO = json['currentDO'] != null
        ? new CurrentDO.fromJson(json['currentDO'])
        : null;
    currentDoIDV3 = json['currentDoIDV3'];
    currentDoIDV2 = json['currentDoIDV2'];
    currentDoID = json['currentDoID'];
    overSpeedStatus = json['overSpeedStatus'];
    overSpeedInGeoStatus = json['overSpeedInGeoStatus'];
    currentgoogleKec = json['currentgoogleKec'];
    currentgoogleKota = json['currentgoogleKota'];
    output2Status = json['output2Status'];
    output1Status = json['output1Status'];
    inputanalog2Status = json['inputanalog2Status'];
    inputanalog1Status = json['inputanalog1Status'];
    input3Status = json['input3Status'];
    input2Status = json['input2Status'];
    input1Status = json['input1Status'];
    currentGeoUplineAreaStatus = json['currentGeoUplineAreaStatus'];
    currentGeoUplineLocStatus = json['currentGeoUplineLocStatus'];
    currentGeoAreaStatus = json['currentGeoAreaStatus'];
    currentGeoLocationStatus = json['currentGeoLocationStatus'];
    totalkmYtd = json['totalkm_ytd'] != null
        ? new TotalkmYtd.fromJson(json['totalkm_ytd'])
        : null;
    totalkmMtd = json['totalkm_mtd'] != null
        ? new TotalkmYtd.fromJson(json['totalkm_mtd'])
        : null;
    currentUtilisasiStatus = json['currentUtilisasiStatus'];
    currentFatiqueStatus = json['currentFatiqueStatus'];
    currentDOV2 = json['currentDOV2'];
    gsmNo = json['gsm_no'];
    noAset = json['no_aset'];
    groupNm = json['group_nm'];
    nopol = json['nopol'];
    companyNm = json['company_nm'];
    totalkmToday = json['totalkm_today'] != null
        ? new TotalkmYtd.fromJson(json['totalkm_today'])
        : null;
    carType = json['car_type'];
    fuelUsedGps = json['fuel_used_gps'];
    rfidDriver = json['rfid_driver'];
    currentRuteGeoStatus = json['currentRuteGeoStatus'];
    currentDMSScoreStatus = json['currentDMSScoreStatus'];
    fuelSensorStatus = json['fuelSensorStatus'];
    weightSensorStatus = json['weightSensorStatus'];
    currentDOV3 = json['currentDOV3'];
    carModel = json['car_model'];
    input2 = json['input2'];
    input1 = json['input1'];
    gpsSatelit = json['gps_satelit'];
    gsmSignal = json['gsm_signal'];
    addr = json['addr'];
    sos = json['sos'];
    acc = json['acc'];
    isAlarm = json['is_alarm'];
    kodePos = json['kode_pos'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    kec = json['kec'];
    alarmNm = json['alarm_nm'];
    reportNm = json['report_nm'];
    direction = json['direction'];
    currentStatusVehicle = json['currentStatusVehicle'] != null
        ? new CurrentStatusVehicle.fromJson(json['currentStatusVehicle'])
        : null;
    driverNm = json['driver_nm'];
    rfid = json['rfid'];
    gpsSn = json['gps_sn'];
    gpsTime = json['gps_time'];
    stime = json['stime'];
    input3 = json['input3'];
    input4 = json['input4'];
    output1 = json['output1'];
    output2 = json['output2'];
    geoUplineLocationTag = json['geoUpline_location_tag'];
    geoUplineAreaTag = json['geoUpline_area_tag'];
    geoUplinetypeNm = json['geoUplinetype_nm'];
    geoUplineLocationNm = json['geoUpline_location_nm'];
    geoUplineLocationCode = json['geoUpline_location_code'];
    geoUplineAreaCode = json['geoUpline_area_code'];
    geoUplineAreaNm = json['geoUpline_area_nm'];
    geoAreaTag = json['geo_area_tag'];
    geoLocTag = json['geo_loc_tag'];
    geotypeNm = json['geotype_nm'];
    geoAreaCode = json['geo_area_code'];
    geoAreaNm = json['geo_area_nm'];
    geoLocationCode = json['geo_location_code'];
    geoLocationNm = json['geo_location_nm'];
    speed = json['speed'];
    odometer = json['odometer'];
    lat = json['lat'];
    lon = json['lon'];
    fuelLevel = json['fuel_level'];
    batteryPercent = json['battery_percent'];
    mainPowerVoltage = json['main_power_voltage'];
    temperatur2 = json['temperatur2'];
    temperatur1 = json['temperatur1'];
    inputAnalog2 = json['input_analog2'];
    inputAnalog = json['input_analog'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentDO != null) {
      data['currentDO'] = this.currentDO.toJson();
    }
    data['currentDoIDV3'] = this.currentDoIDV3;
    data['currentDoIDV2'] = this.currentDoIDV2;
    data['currentDoID'] = this.currentDoID;
    data['overSpeedStatus'] = this.overSpeedStatus;
    data['overSpeedInGeoStatus'] = this.overSpeedInGeoStatus;
    data['currentgoogleKec'] = this.currentgoogleKec;
    data['currentgoogleKota'] = this.currentgoogleKota;
    data['output2Status'] = this.output2Status;
    data['output1Status'] = this.output1Status;
    data['inputanalog2Status'] = this.inputanalog2Status;
    data['inputanalog1Status'] = this.inputanalog1Status;
    data['input3Status'] = this.input3Status;
    data['input2Status'] = this.input2Status;
    data['input1Status'] = this.input1Status;
    data['currentGeoUplineAreaStatus'] = this.currentGeoUplineAreaStatus;
    data['currentGeoUplineLocStatus'] = this.currentGeoUplineLocStatus;
    data['currentGeoAreaStatus'] = this.currentGeoAreaStatus;
    data['currentGeoLocationStatus'] = this.currentGeoLocationStatus;
    if (this.totalkmYtd != null) {
      data['totalkm_ytd'] = this.totalkmYtd.toJson();
    }
    if (this.totalkmMtd != null) {
      data['totalkm_mtd'] = this.totalkmMtd.toJson();
    }
    data['currentUtilisasiStatus'] = this.currentUtilisasiStatus;
    data['currentFatiqueStatus'] = this.currentFatiqueStatus;
    data['currentDOV2'] = this.currentDOV2;
    data['gsm_no'] = this.gsmNo;
    data['no_aset'] = this.noAset;
    data['group_nm'] = this.groupNm;
    data['nopol'] = this.nopol;
    data['company_nm'] = this.companyNm;
    if (this.totalkmToday != null) {
      data['totalkm_today'] = this.totalkmToday.toJson();
    }
    data['car_type'] = this.carType;
    data['fuel_used_gps'] = this.fuelUsedGps;
    data['rfid_driver'] = this.rfidDriver;
    data['currentRuteGeoStatus'] = this.currentRuteGeoStatus;
    data['currentDMSScoreStatus'] = this.currentDMSScoreStatus;
    data['fuelSensorStatus'] = this.fuelSensorStatus;
    data['weightSensorStatus'] = this.weightSensorStatus;
    data['currentDOV3'] = this.currentDOV3;
    data['car_model'] = this.carModel;
    data['input2'] = this.input2;
    data['input1'] = this.input1;
    data['gps_satelit'] = this.gpsSatelit;
    data['gsm_signal'] = this.gsmSignal;
    data['addr'] = this.addr;
    data['sos'] = this.sos;
    data['acc'] = this.acc;
    data['is_alarm'] = this.isAlarm;
    data['kode_pos'] = this.kodePos;
    data['provinsi'] = this.provinsi;
    data['kota'] = this.kota;
    data['kec'] = this.kec;
    data['alarm_nm'] = this.alarmNm;
    data['report_nm'] = this.reportNm;
    data['direction'] = this.direction;
    if (this.currentStatusVehicle != null) {
      data['currentStatusVehicle'] = this.currentStatusVehicle.toJson();
    }
    data['driver_nm'] = this.driverNm;
    data['rfid'] = this.rfid;
    data['gps_sn'] = this.gpsSn;
    data['gps_time'] = this.gpsTime;
    data['stime'] = this.stime;
    data['input3'] = this.input3;
    data['input4'] = this.input4;
    data['output1'] = this.output1;
    data['output2'] = this.output2;
    data['geoUpline_location_tag'] = this.geoUplineLocationTag;
    data['geoUpline_area_tag'] = this.geoUplineAreaTag;
    data['geoUplinetype_nm'] = this.geoUplinetypeNm;
    data['geoUpline_location_nm'] = this.geoUplineLocationNm;
    data['geoUpline_location_code'] = this.geoUplineLocationCode;
    data['geoUpline_area_code'] = this.geoUplineAreaCode;
    data['geoUpline_area_nm'] = this.geoUplineAreaNm;
    data['geo_area_tag'] = this.geoAreaTag;
    data['geo_loc_tag'] = this.geoLocTag;
    data['geotype_nm'] = this.geotypeNm;
    data['geo_area_code'] = this.geoAreaCode;
    data['geo_area_nm'] = this.geoAreaNm;
    data['geo_location_code'] = this.geoLocationCode;
    data['geo_location_nm'] = this.geoLocationNm;
    data['speed'] = this.speed;
    data['odometer'] = this.odometer;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['fuel_level'] = this.fuelLevel;
    data['battery_percent'] = this.batteryPercent;
    data['main_power_voltage'] = this.mainPowerVoltage;
    data['temperatur2'] = this.temperatur2;
    data['temperatur1'] = this.temperatur1;
    data['input_analog2'] = this.inputAnalog2;
    data['input_analog'] = this.inputAnalog;
    return data;
  }
}

class CurrentDO {
  dynamic doId;
  dynamic statusDo;
  dynamic opsiComplete;
  dynamic isAlarm;
  dynamic durValidTujuan;
  dynamic companyId;
  dynamic useridMonitor;
  String companyNm;
  String note;
  String flag;
  String gpsSn;
  String snEseal;
  dynamic noEseal;
  String ketStatusDo;
  String ketOpsiComplete;
  dynamic ketClose;
  String tglDo;
  String tglInput;
  String tglBl;
  String tglLockAsal;
  String tglUnlockTujuan;
  String tglBalikAsal;
  String tglClosed;
  String tglPod;
  dynamic maxTimeChecking;
  dynamic maxTimeDelivery;
  dynamic avgSuhu;
  String noSj;
  String noDo;
  dynamic noContainer;
  dynamic noContainer2;
  dynamic transportir;
  String driverNm;
  String sizeContainer;
  dynamic tipeContainer;
  dynamic noPolisi;
  String alertTelegram;
  String alertEmail;
  List<Asal> asal;
  List<Tujuan> tujuan;
  List<dynamic> alert;
  List<dynamic> alarm;
  InfoAsalTujuan infoAsalTujuan;
  InfoAsalTujuan infoTujuanAsal;
  InfoAsalComplete infoAsalComplete;
  dynamic versiDo;
  dynamic routeCheckpodynamic;
  InfoShipment infoShipment;

  CurrentDO(
      {this.doId,
      this.statusDo,
      this.opsiComplete,
      this.isAlarm,
      this.durValidTujuan,
      this.companyId,
      this.useridMonitor,
      this.companyNm,
      this.note,
      this.flag,
      this.gpsSn,
      this.snEseal,
      this.noEseal,
      this.ketStatusDo,
      this.ketOpsiComplete,
      this.ketClose,
      this.tglDo,
      this.tglInput,
      this.tglBl,
      this.tglLockAsal,
      this.tglUnlockTujuan,
      this.tglBalikAsal,
      this.tglClosed,
      this.tglPod,
      this.maxTimeChecking,
      this.maxTimeDelivery,
      this.avgSuhu,
      this.noSj,
      this.noDo,
      this.noContainer,
      this.noContainer2,
      this.transportir,
      this.driverNm,
      this.sizeContainer,
      this.tipeContainer,
      this.noPolisi,
      this.alertTelegram,
      this.alertEmail,
      this.asal,
      this.tujuan,
      this.alert,
      this.alarm,
      this.infoAsalTujuan,
      this.infoTujuanAsal,
      this.infoAsalComplete,
      this.versiDo,
      this.routeCheckpodynamic,
      this.infoShipment});

  CurrentDO.fromJson(Map<String, dynamic> json) {
    doId = json['do_id'];
    statusDo = json['status_do'];
    opsiComplete = json['opsi_complete'];
    isAlarm = json['is_alarm'];
    durValidTujuan = json['dur_valid_tujuan'];
    companyId = json['company_id'];
    useridMonitor = json['userid_monitor'];
    companyNm = json['company_nm'];
    note = json['note'];
    flag = json['flag'];
    gpsSn = json['gps_sn'];
    snEseal = json['sn_eseal'];
    noEseal = json['no_eseal'];
    ketStatusDo = json['ket_status_do'];
    ketOpsiComplete = json['ket_opsi_complete'];
    ketClose = json['ket_close'];
    tglDo = json['tgl_do'];
    tglInput = json['tgl_input'];
    tglBl = json['tgl_bl'];
    tglLockAsal = json['tgl_lock_asal'];
    tglUnlockTujuan = json['tgl_unlock_tujuan'];
    tglBalikAsal = json['tgl_balik_asal'];
    tglClosed = json['tgl_closed'];
    tglPod = json['tgl_pod'];
    maxTimeChecking = json['max_time_checking'];
    maxTimeDelivery = json['max_time_delivery'];
    avgSuhu = json['avg_suhu'];
    noSj = json['no_sj'];
    noDo = json['no_do'];
    noContainer = json['no_container'];
    noContainer2 = json['no_container2'];
    transportir = json['transportir'];
    driverNm = json['driver_nm'];
    sizeContainer = json['size_container'];
    tipeContainer = json['tipe_container'];
    noPolisi = json['no_polisi'];
    alertTelegram = json['alert_telegram'];
    alarm = json['alarm'];
    alert = json['alert'];
    if (json['asal'] != null) {
      asal = new List<Asal>();
      json['asal'].forEach((v) {
        asal.add(new Asal.fromJson(v));
      });
    }
    if (json['tujuan'] != null) {
      tujuan = new List<Tujuan>();
      json['tujuan'].forEach((v) {
        tujuan.add(new Tujuan.fromJson(v));
      });
    }

    infoAsalTujuan = json['info_asal_tujuan'] != null
        ? new InfoAsalTujuan.fromJson(json['info_asal_tujuan'])
        : null;
    infoTujuanAsal = json['info_tujuan_asal'] != null
        ? new InfoAsalTujuan.fromJson(json['info_tujuan_asal'])
        : null;
    infoAsalComplete = json['info_asal_complete'] != null
        ? new InfoAsalComplete.fromJson(json['info_asal_complete'])
        : null;
    versiDo = json['versi_do'];
    routeCheckpodynamic = json['routeCheckpodynamic'];
    infoShipment = json['info_shipment'] != null
        ? new InfoShipment.fromJson(json['info_shipment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['do_id'] = this.doId;
    data['status_do'] = this.statusDo;
    data['opsi_complete'] = this.opsiComplete;
    data['is_alarm'] = this.isAlarm;
    data['dur_valid_tujuan'] = this.durValidTujuan;
    data['company_id'] = this.companyId;
    data['userid_monitor'] = this.useridMonitor;
    data['company_nm'] = this.companyNm;
    data['note'] = this.note;
    data['flag'] = this.flag;
    data['gps_sn'] = this.gpsSn;
    data['sn_eseal'] = this.snEseal;
    data['no_eseal'] = this.noEseal;
    data['ket_status_do'] = this.ketStatusDo;
    data['ket_opsi_complete'] = this.ketOpsiComplete;
    data['ket_close'] = this.ketClose;
    data['tgl_do'] = this.tglDo;
    data['tgl_input'] = this.tglInput;
    data['tgl_bl'] = this.tglBl;
    data['tgl_lock_asal'] = this.tglLockAsal;
    data['tgl_unlock_tujuan'] = this.tglUnlockTujuan;
    data['tgl_balik_asal'] = this.tglBalikAsal;
    data['tgl_closed'] = this.tglClosed;
    data['tgl_pod'] = this.tglPod;
    data['max_time_checking'] = this.maxTimeChecking;
    data['max_time_delivery'] = this.maxTimeDelivery;
    data['avg_suhu'] = this.avgSuhu;
    data['no_sj'] = this.noSj;
    data['no_do'] = this.noDo;
    data['no_container'] = this.noContainer;
    data['no_container2'] = this.noContainer2;
    data['transportir'] = this.transportir;
    data['driver_nm'] = this.driverNm;
    data['size_container'] = this.sizeContainer;
    data['tipe_container'] = this.tipeContainer;
    data['no_polisi'] = this.noPolisi;
    data['alert_telegram'] = this.alertTelegram;
    data['alert_email'] = this.alertEmail;
    if (this.asal != null) {
      data['asal'] = this.asal.map((v) => v.toJson()).toList();
    }
    if (this.tujuan != null) {
      data['tujuan'] = this.tujuan.map((v) => v.toJson()).toList();
    }
    if (this.alert != null) {
      data['alert'] = this.alert.map((v) => v.toJson()).toList();
    }
    if (this.alarm != null) {
      data['alarm'] = this.alarm.map((v) => v.toJson()).toList();
    }
    if (this.infoAsalTujuan != null) {
      data['info_asal_tujuan'] = this.infoAsalTujuan.toJson();
    }
    if (this.infoTujuanAsal != null) {
      data['info_tujuan_asal'] = this.infoTujuanAsal.toJson();
    }
    if (this.infoAsalComplete != null) {
      data['info_asal_complete'] = this.infoAsalComplete.toJson();
    }
    data['versi_do'] = this.versiDo;
    data['routeCheckpodynamic'] = this.routeCheckpodynamic;
    if (this.infoShipment != null) {
      data['info_shipment'] = this.infoShipment.toJson();
    }
    return data;
  }
}

class Asal {
  dynamic geoId;
  dynamic dosId;
  String geoNm;
  String geoCode;
  String tglMasuk;
  String tglKeluar;
  String tglUnlock;
  String tglLock;
  String planLoadingTime;
  Durations duration;
  bool complete;
  dynamic lat;
  dynamic lon;
  dynamic desc;

  Asal(
      {this.geoId,
      this.dosId,
      this.geoNm,
      this.geoCode,
      this.tglMasuk,
      this.tglKeluar,
      this.tglUnlock,
      this.tglLock,
      this.planLoadingTime,
      this.duration,
      this.complete,
      this.lat,
      this.lon,
      this.desc});

  Asal.fromJson(Map<String, dynamic> json) {
    geoId = json['geo_id'];
    dosId = json['dos_id'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    tglMasuk = json['tgl_masuk'];
    tglKeluar = json['tgl_keluar'];
    tglUnlock = json['tgl_unlock'];
    tglLock = json['tgl_lock'];
    planLoadingTime = json['plan_loading_time'];
    duration = json['duration'] != null
        ? new Durations.fromJson(json['duration'])
        : null;
    complete = json['Complete'];
    lat = json['lat'];
    lon = json['lon'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geo_id'] = this.geoId;
    data['dos_id'] = this.dosId;
    data['geo_nm'] = this.geoNm;
    data['geo_code'] = this.geoCode;
    data['tgl_masuk'] = this.tglMasuk;
    data['tgl_keluar'] = this.tglKeluar;
    data['tgl_unlock'] = this.tglUnlock;
    data['tgl_lock'] = this.tglLock;
    data['plan_loading_time'] = this.planLoadingTime;
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    data['Complete'] = this.complete;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['desc'] = this.desc;
    return data;
  }
}

class Durations {
  dynamic value;
  String text;

  Durations({this.value, this.text});

  Durations.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Tujuan {
  dynamic geoId;
  dynamic dosId;
  String geoNm;
  String geoCode;
  String noSj;
  String tglMasuk;
  String tglKeluar;
  String tglUnlock;
  String tglLock;
  String startBongkar;
  String selesaiBongkar;
  String planUnloadingTime;
  bool complete;
  Durations duration;
  dynamic lon;
  dynamic lat;
  dynamic radius;
  dynamic eTA;
  dynamic authRfid;
  String desc;
  String custTelegram;
  String custEmail;
  dynamic infoFromAsal;

  Tujuan(
      {this.geoId,
      this.dosId,
      this.geoNm,
      this.geoCode,
      this.noSj,
      this.tglMasuk,
      this.tglKeluar,
      this.tglUnlock,
      this.tglLock,
      this.startBongkar,
      this.selesaiBongkar,
      this.planUnloadingTime,
      this.complete,
      this.duration,
      this.lon,
      this.lat,
      this.radius,
      this.eTA,
      this.authRfid,
      this.desc,
      this.custTelegram,
      this.custEmail,
      this.infoFromAsal});

  Tujuan.fromJson(Map<String, dynamic> json) {
    geoId = json['geo_id'];
    dosId = json['dos_id'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    noSj = json['no_sj'];
    tglMasuk = json['tgl_masuk'];
    tglKeluar = json['tgl_keluar'];
    tglUnlock = json['tgl_unlock'];
    tglLock = json['tgl_lock'];
    startBongkar = json['start_bongkar'];
    selesaiBongkar = json['selesai_bongkar'];
    planUnloadingTime = json['plan_unloading_time'];
    complete = json['Complete'];
    duration = json['duration'] != null
        ? new Durations.fromJson(json['duration'])
        : null;
    lon = json['lon'];
    lat = json['lat'];
    radius = json['radius'];
    eTA = json['ETA'];
    authRfid = json['auth_rfid'];
    desc = json['desc'];
    custTelegram = json['cust_telegram'];
    custEmail = json['cust_email'];
    infoFromAsal = json['info_from_asal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geo_id'] = this.geoId;
    data['dos_id'] = this.dosId;
    data['geo_nm'] = this.geoNm;
    data['geo_code'] = this.geoCode;
    data['no_sj'] = this.noSj;
    data['tgl_masuk'] = this.tglMasuk;
    data['tgl_keluar'] = this.tglKeluar;
    data['tgl_unlock'] = this.tglUnlock;
    data['tgl_lock'] = this.tglLock;
    data['start_bongkar'] = this.startBongkar;
    data['selesai_bongkar'] = this.selesaiBongkar;
    data['plan_unloading_time'] = this.planUnloadingTime;
    data['Complete'] = this.complete;
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['radius'] = this.radius;
    data['ETA'] = this.eTA;
    data['auth_rfid'] = this.authRfid;
    data['desc'] = this.desc;
    data['cust_telegram'] = this.custTelegram;
    data['cust_email'] = this.custEmail;
    data['info_from_asal'] = this.infoFromAsal;
    return data;
  }
}

class InfoAsalTujuan {
  dynamic startOdometer;
  dynamic stopOdometer;
  dynamic totalKm;
  String startTime;
  String stopTime;
  Durations durasi;
  dynamic durasiDriving;
  dynamic durasiParking;
  dynamic durasiIdle;
  dynamic durasi2;

  InfoAsalTujuan(
      {this.startOdometer,
      this.stopOdometer,
      this.totalKm,
      this.startTime,
      this.stopTime,
      this.durasi,
      this.durasiDriving,
      this.durasiParking,
      this.durasiIdle,
      this.durasi2});

  InfoAsalTujuan.fromJson(Map<String, dynamic> json) {
    startOdometer = json['start_odometer'];
    stopOdometer = json['stop_odometer'];
    totalKm = json['total_km'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    durasi =
        json['durasi'] != null ? new Durations.fromJson(json['durasi']) : null;
    durasiDriving = json['durasi_driving'];
    durasiParking = json['durasi_parking'];
    durasiIdle = json['durasi_idle'];
    durasi2 = json['durasi2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_odometer'] = this.startOdometer;
    data['stop_odometer'] = this.stopOdometer;
    data['total_km'] = this.totalKm;
    data['start_time'] = this.startTime;
    data['stop_time'] = this.stopTime;
    if (this.durasi != null) {
      data['durasi'] = this.durasi.toJson();
    }
    data['durasi_driving'] = this.durasiDriving;
    data['durasi_parking'] = this.durasiParking;
    data['durasi_idle'] = this.durasiIdle;
    data['durasi2'] = this.durasi2;
    return data;
  }
}

class InfoAsalComplete {
  dynamic startOdometer;
  dynamic stopOdometer;
  dynamic totalKm;
  String startTime;
  String stopTime;
  Durations durasi;
  dynamic durasiDriving;
  dynamic durasiParking;
  dynamic durasiIdle;
  dynamic durasi2;
  ETA eTA;

  InfoAsalComplete(
      {this.startOdometer,
      this.stopOdometer,
      this.totalKm,
      this.startTime,
      this.stopTime,
      this.durasi,
      this.durasiDriving,
      this.durasiParking,
      this.durasiIdle,
      this.durasi2,
      this.eTA});

  InfoAsalComplete.fromJson(Map<String, dynamic> json) {
    startOdometer = json['start_odometer'];
    stopOdometer = json['stop_odometer'];
    totalKm = json['total_km'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    durasi =
        json['durasi'] != null ? new Durations.fromJson(json['durasi']) : null;
    durasiDriving = json['durasi_driving'];
    durasiParking = json['durasi_parking'];
    durasiIdle = json['durasi_idle'];
    durasi2 = json['durasi2'];
    eTA = json['ETA'] != null ? new ETA.fromJson(json['ETA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_odometer'] = this.startOdometer;
    data['stop_odometer'] = this.stopOdometer;
    data['total_km'] = this.totalKm;
    data['start_time'] = this.startTime;
    data['stop_time'] = this.stopTime;
    if (this.durasi != null) {
      data['durasi'] = this.durasi.toJson();
    }
    data['durasi_driving'] = this.durasiDriving;
    data['durasi_parking'] = this.durasiParking;
    data['durasi_idle'] = this.durasiIdle;
    data['durasi2'] = this.durasi2;
    if (this.eTA != null) {
      data['ETA'] = this.eTA.toJson();
    }
    return data;
  }
}

class ETA {
  String estimatedTime;
  Durations estimatedDurasi;
  dynamic totalKm;

  ETA({this.estimatedTime, this.estimatedDurasi, this.totalKm});

  ETA.fromJson(Map<String, dynamic> json) {
    estimatedTime = json['estimated_time'];
    estimatedDurasi = json['estimated_durasi'] != null
        ? new Durations.fromJson(json['estimated_durasi'])
        : null;
    totalKm = json['total_km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['estimated_time'] = this.estimatedTime;
    if (this.estimatedDurasi != null) {
      data['estimated_durasi'] = this.estimatedDurasi.toJson();
    }
    data['total_km'] = this.totalKm;
    return data;
  }
}

class InfoShipment {
  String jnsMuatan;
  String noTiketTimbangan;
  String noteShipment;
  String truckId;
  String noContainer;
  String jnsCont;
  String sizeCont;
  String driverName2;
  String driverPhone2;
  String consignee;
  dynamic volSj;
  dynamic volTimbangan;
  dynamic volKosong;
  dynamic volTujuan;
  dynamic cptyMuatan;
  dynamic tarifAngkut;
  dynamic uangJalan;
  dynamic addUangJalan;
  dynamic downPayment;

  InfoShipment(
      {this.jnsMuatan,
      this.noTiketTimbangan,
      this.noteShipment,
      this.truckId,
      this.noContainer,
      this.jnsCont,
      this.sizeCont,
      this.driverName2,
      this.driverPhone2,
      this.consignee,
      this.volSj,
      this.volTimbangan,
      this.volKosong,
      this.volTujuan,
      this.cptyMuatan,
      this.tarifAngkut,
      this.uangJalan,
      this.addUangJalan,
      this.downPayment});

  InfoShipment.fromJson(Map<String, dynamic> json) {
    jnsMuatan = json['jns_muatan'];
    noTiketTimbangan = json['no_tiket_timbangan'];
    noteShipment = json['note_shipment'];
    truckId = json['truck_id'];
    noContainer = json['no_container'];
    jnsCont = json['jns_cont'];
    sizeCont = json['size_cont'];
    driverName2 = json['driver_name2'];
    driverPhone2 = json['driver_phone2'];
    consignee = json['consignee'];
    volSj = json['vol_sj'];
    volTimbangan = json['vol_timbangan'];
    volKosong = json['vol_kosong'];
    volTujuan = json['vol_tujuan'];
    cptyMuatan = json['cpty_muatan'];
    tarifAngkut = json['tarif_angkut'];
    uangJalan = json['uang_jalan'];
    addUangJalan = json['add_uang_jalan'];
    downPayment = json['down_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jns_muatan'] = this.jnsMuatan;
    data['no_tiket_timbangan'] = this.noTiketTimbangan;
    data['note_shipment'] = this.noteShipment;
    data['truck_id'] = this.truckId;
    data['no_container'] = this.noContainer;
    data['jns_cont'] = this.jnsCont;
    data['size_cont'] = this.sizeCont;
    data['driver_name2'] = this.driverName2;
    data['driver_phone2'] = this.driverPhone2;
    data['consignee'] = this.consignee;
    data['vol_sj'] = this.volSj;
    data['vol_timbangan'] = this.volTimbangan;
    data['vol_kosong'] = this.volKosong;
    data['vol_tujuan'] = this.volTujuan;
    data['cpty_muatan'] = this.cptyMuatan;
    data['tarif_angkut'] = this.tarifAngkut;
    data['uang_jalan'] = this.uangJalan;
    data['add_uang_jalan'] = this.addUangJalan;
    data['down_payment'] = this.downPayment;
    return data;
  }
}

class TotalkmYtd {
  dynamic totalKm;
  String startDateCounting;

  TotalkmYtd({this.totalKm, this.startDateCounting});

  TotalkmYtd.fromJson(Map<String, dynamic> json) {
    totalKm = json['total_km'];
    startDateCounting = json['start_date_counting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_km'] = this.totalKm;
    data['start_date_counting'] = this.startDateCounting;
    return data;
  }
}

class CurrentStatusVehicle {
  dynamic status;
  String ket;
  Driving driving;
  dynamic parking;
  dynamic idle;
  dynamic rfidDriver;
  Moving moving;

  CurrentStatusVehicle(
      {this.status,
      this.ket,
      this.driving,
      this.parking,
      this.idle,
      this.rfidDriver,
      this.moving});

  CurrentStatusVehicle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    ket = json['ket'];
    driving =
        json['driving'] != null ? new Driving.fromJson(json['driving']) : null;
    parking = json['parking'];
    idle = json['idle'];
    rfidDriver = json['rfid_driver'];
    moving =
        json['moving'] != null ? new Moving.fromJson(json['moving']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ket'] = this.ket;
    if (this.driving != null) {
      data['driving'] = this.driving.toJson();
    }
    data['parking'] = this.parking;
    data['idle'] = this.idle;
    data['rfid_driver'] = this.rfidDriver;
    if (this.moving != null) {
      data['moving'] = this.moving.toJson();
    }
    return data;
  }
}

class Driving {
  String startTime;
  String stopTime;
  Durations duration;
  Durations idle;
  Durations durMoving;
  dynamic maxSpeed;
  dynamic avgSpeed;
  dynamic totalKm;
  dynamic durMov2;
  StartDetail startDetail;
  StartDetail stopDetail;
  dynamic harshBrakeCount;
  dynamic harshAccelCount;
  dynamic harshCorneringCount;
  dynamic impactCount;
  List<dynamic> listMoving;
  dynamic fuelConsumption;

  Driving(
      {this.startTime,
      this.stopTime,
      this.duration,
      this.idle,
      this.durMoving,
      this.maxSpeed,
      this.avgSpeed,
      this.totalKm,
      this.durMov2,
      this.startDetail,
      this.stopDetail,
      this.harshBrakeCount,
      this.harshAccelCount,
      this.harshCorneringCount,
      this.impactCount,
      this.listMoving,
      this.fuelConsumption});

  Driving.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    duration = json['duration'] != null
        ? new Durations.fromJson(json['duration'])
        : null;
    idle = json['idle'] != null ? new Durations.fromJson(json['idle']) : null;
    durMoving = json['dur_moving'] != null
        ? new Durations.fromJson(json['dur_moving'])
        : null;
    maxSpeed = json['max_speed'];
    avgSpeed = json['avg_speed'];
    totalKm = json['total_km'];
    durMov2 = json['durMov2'];
    startDetail = json['start_detail'] != null
        ? new StartDetail.fromJson(json['start_detail'])
        : null;
    stopDetail = json['stop_detail'] != null
        ? new StartDetail.fromJson(json['stop_detail'])
        : null;
    harshBrakeCount = json['harsh_brake_count'];
    harshAccelCount = json['harsh_accel_count'];
    harshCorneringCount = json['harsh_cornering_count'];
    impactCount = json['impact_count'];
    listMoving = json['list_moving'];

    fuelConsumption = json['fuel_consumption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['stop_time'] = this.stopTime;
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    if (this.idle != null) {
      data['idle'] = this.idle.toJson();
    }
    if (this.durMoving != null) {
      data['dur_moving'] = this.durMoving.toJson();
    }
    data['max_speed'] = this.maxSpeed;
    data['avg_speed'] = this.avgSpeed;
    data['total_km'] = this.totalKm;
    data['durMov2'] = this.durMov2;
    if (this.startDetail != null) {
      data['start_detail'] = this.startDetail.toJson();
    }
    if (this.stopDetail != null) {
      data['stop_detail'] = this.stopDetail.toJson();
    }
    data['harsh_brake_count'] = this.harshBrakeCount;
    data['harsh_accel_count'] = this.harshAccelCount;
    data['harsh_cornering_count'] = this.harshCorneringCount;
    data['impact_count'] = this.impactCount;
    if (this.listMoving != null) {
      data['ListMoving'] = this.listMoving.map((v) => v.toJson()).toList();
    }
    data['fuel_consumption'] = this.fuelConsumption;
    return data;
  }
}

class StartDetail {
  dynamic lon;
  dynamic lat;
  String addr;
  dynamic geoLocationId;
  dynamic geoAreaId;
  String geoLocationNm;
  String geoAreaNm;
  String geoLocationCode;
  String geoAreaCode;

  StartDetail(
      {this.lon,
      this.lat,
      this.addr,
      this.geoLocationId,
      this.geoAreaId,
      this.geoLocationNm,
      this.geoAreaNm,
      this.geoLocationCode,
      this.geoAreaCode});

  StartDetail.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
    addr = json['addr'];
    geoLocationId = json['geo_location_id'];
    geoAreaId = json['geo_area_id'];
    geoLocationNm = json['geo_location_nm'];
    geoAreaNm = json['geo_area_nm'];
    geoLocationCode = json['geo_location_code'];
    geoAreaCode = json['geo_area_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['addr'] = this.addr;
    data['geo_location_id'] = this.geoLocationId;
    data['geo_area_id'] = this.geoAreaId;
    data['geo_location_nm'] = this.geoLocationNm;
    data['geo_area_nm'] = this.geoAreaNm;
    data['geo_location_code'] = this.geoLocationCode;
    data['geo_area_code'] = this.geoAreaCode;
    return data;
  }
}

class Moving {
  String startTime;
  String stopTime;
  Durations duration;
  dynamic maxSpeed;
  dynamic avgSpeed;
  dynamic totalKm;
  StartDetail startDetail;
  StartDetail stopDetail;
  dynamic harshBrakeCount;
  dynamic harshAccelCount;
  dynamic harshCorneringCount;
  dynamic impactCount;

  Moving(
      {this.startTime,
      this.stopTime,
      this.duration,
      this.maxSpeed,
      this.avgSpeed,
      this.totalKm,
      this.startDetail,
      this.stopDetail,
      this.harshBrakeCount,
      this.harshAccelCount,
      this.harshCorneringCount,
      this.impactCount});

  Moving.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    duration = json['duration'] != null
        ? new Durations.fromJson(json['duration'])
        : null;
    maxSpeed = json['max_speed'];
    avgSpeed = json['avg_speed'];
    totalKm = json['total_km'];
    startDetail = json['start_detail'] != null
        ? new StartDetail.fromJson(json['start_detail'])
        : null;
    stopDetail = json['stop_detail'] != null
        ? new StartDetail.fromJson(json['stop_detail'])
        : null;
    harshBrakeCount = json['harsh_brake_count'];
    harshAccelCount = json['harsh_accel_count'];
    harshCorneringCount = json['harsh_cornering_count'];
    impactCount = json['impact_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['stop_time'] = this.stopTime;
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    data['max_speed'] = this.maxSpeed;
    data['avg_speed'] = this.avgSpeed;
    data['total_km'] = this.totalKm;
    if (this.startDetail != null) {
      data['start_detail'] = this.startDetail.toJson();
    }
    if (this.stopDetail != null) {
      data['stop_detail'] = this.stopDetail.toJson();
    }
    data['harsh_brake_count'] = this.harshBrakeCount;
    data['harsh_accel_count'] = this.harshAccelCount;
    data['harsh_cornering_count'] = this.harshCorneringCount;
    data['impact_count'] = this.impactCount;
    return data;
  }
}
