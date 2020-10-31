class TrackingResult {
  String currentDO;
  dynamic currentDoIDV3;
  dynamic currentDoIDV2;
  dynamic currentDoID;
  String overSpeedStatus;
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
  CurrentUtilisasiStatus currentUtilisasiStatus;
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
    currentDO = json['currentDO'];
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
    currentUtilisasiStatus = json['currentUtilisasiStatus'] != null
        ? new CurrentUtilisasiStatus.fromJson(json['currentUtilisasiStatus'])
        : null;
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
    data['currentDO'] = this.currentDO;
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
    if (this.currentUtilisasiStatus != null) {
      data['currentUtilisasiStatus'] = this.currentUtilisasiStatus.toJson();
    }
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

class CurrentUtilisasiStatus {
  InfoStartComplete infoStartComplete;
  dynamic status;
  dynamic geoTipeSeq;
  dynamic nextSeq;
  dynamic durtemp;
  dynamic dur1temp;
  dynamic durRittemp;
  String ketStatus;
  List<Ritase> ritase;

  CurrentUtilisasiStatus(
      {this.infoStartComplete,
      this.status,
      this.geoTipeSeq,
      this.nextSeq,
      this.durtemp,
      this.dur1temp,
      this.durRittemp,
      this.ketStatus,
      this.ritase});

  CurrentUtilisasiStatus.fromJson(Map<String, dynamic> json) {
    infoStartComplete = json['info_start_complete'] != null
        ? new InfoStartComplete.fromJson(json['info_start_complete'])
        : null;
    status = json['status'];
    geoTipeSeq = json['geo_tipe_seq'];
    nextSeq = json['next_seq'];
    durtemp = json['durtemp'];
    dur1temp = json['dur1temp'];
    durRittemp = json['durRittemp'];
    ketStatus = json['ket_status'];
    if (json['ritase'] != null) {
      ritase = new List<Ritase>();
      json['ritase'].forEach((v) {
        ritase.add(new Ritase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.infoStartComplete != null) {
      data['info_start_complete'] = this.infoStartComplete.toJson();
    }
    data['status'] = this.status;
    data['geo_tipe_seq'] = this.geoTipeSeq;
    data['next_seq'] = this.nextSeq;
    data['durtemp'] = this.durtemp;
    data['dur1temp'] = this.dur1temp;
    data['durRittemp'] = this.durRittemp;
    data['ket_status'] = this.ketStatus;
    if (this.ritase != null) {
      data['ritase'] = this.ritase.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InfoStartComplete {
  dynamic startOdometer;
  dynamic stopOdometer;
  dynamic totalKm;
  String startTime;
  String stopTime;
  DurasiDriving durasi;
  DurasiDriving durasiDriving;
  Durasi durasiParking;
  DurasiDriving durasiIdle;
  dynamic durasi2;

  InfoStartComplete(
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

  InfoStartComplete.fromJson(Map<String, dynamic> json) {
    startOdometer = json['start_odometer'];
    stopOdometer = json['stop_odometer'];
    totalKm = json['total_km'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    durasi = json['durasi'] != null
        ? new DurasiDriving.fromJson(json['durasi'])
        : null;
    durasiDriving = json['durasi_driving'] != null
        ? new DurasiDriving.fromJson(json['durasi_driving'])
        : null;
    durasiParking = json['durasi_parking'] != null
        ? new Durasi.fromJson(json['durasi_parking'])
        : null;
    durasiIdle = json['durasi_idle'] != null
        ? new DurasiDriving.fromJson(json['durasi_idle'])
        : null;
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
    if (this.durasiDriving != null) {
      data['durasi_driving'] = this.durasiDriving.toJson();
    }
    if (this.durasiParking != null) {
      data['durasi_parking'] = this.durasiParking.toJson();
    }
    if (this.durasiIdle != null) {
      data['durasi_idle'] = this.durasiIdle.toJson();
    }
    data['durasi2'] = this.durasi2;
    return data;
  }
}

class Durasi {
  dynamic value;
  String text;

  Durasi({this.value, this.text});

  Durasi.fromJson(Map<String, dynamic> json) {
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

class DurasiDriving {
  dynamic value;
  String text;

  DurasiDriving({this.value, this.text});

  DurasiDriving.fromJson(Map<String, dynamic> json) {
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

class Ritase {
  dynamic geoId;
  dynamic geoSeq;
  String geoNm;
  String geoCode;
  String geotypeNm;
  String geoTag;
  String startTime;
  String stopTime;
  DurasiDriving duration;
  dynamic inOdometer;
  dynamic outOdometer;
  InfoStartComplete infoToNext;
  dynamic timeIn;
  dynamic timeOut;

  Ritase(
      {this.geoId,
      this.geoSeq,
      this.geoNm,
      this.geoCode,
      this.geotypeNm,
      this.geoTag,
      this.startTime,
      this.stopTime,
      this.duration,
      this.inOdometer,
      this.outOdometer,
      this.infoToNext,
      this.timeIn,
      this.timeOut});

  Ritase.fromJson(Map<String, dynamic> json) {
    geoId = json['geo_id'];
    geoSeq = json['geo_seq'];
    geoNm = json['geo_nm'];
    geoCode = json['geo_code'];
    geotypeNm = json['geotype_nm'];
    geoTag = json['geo_tag'];
    startTime = json['start_time'];
    stopTime = json['stop_time'];
    duration = json['duration'] != null
        ? new DurasiDriving.fromJson(json['duration'])
        : null;
    inOdometer = json['in_odometer'];
    outOdometer = json['out_odometer'];
    infoToNext = json['info_to_next'] != null
        ? new InfoStartComplete.fromJson(json['info_to_next'])
        : null;
    timeIn = json['time_in'];
    timeOut = json['time_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geo_id'] = this.geoId;
    data['geo_seq'] = this.geoSeq;
    data['geo_nm'] = this.geoNm;
    data['geo_code'] = this.geoCode;
    data['geotype_nm'] = this.geotypeNm;
    data['geo_tag'] = this.geoTag;
    data['start_time'] = this.startTime;
    data['stop_time'] = this.stopTime;
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    data['in_odometer'] = this.inOdometer;
    data['out_odometer'] = this.outOdometer;
    if (this.infoToNext != null) {
      data['info_to_next'] = this.infoToNext.toJson();
    }
    data['time_in'] = this.timeIn;
    data['time_out'] = this.timeOut;
    return data;
  }
}

class CurrentStatusVehicle {
  dynamic status;
  String ket;
  Driving driving;
  String parking;
  String idle;
  String rfidDriver;
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
  DurasiDriving duration;
  DurasiDriving idle;
  DurasiDriving durMoving;
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
        ? new DurasiDriving.fromJson(json['duration'])
        : null;
    idle =
        json['idle'] != null ? new DurasiDriving.fromJson(json['idle']) : null;
    durMoving = json['dur_moving'] != null
        ? new DurasiDriving.fromJson(json['dur_moving'])
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
    listMoving = json['ListMoving'].cast<String>();
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
    data['ListMoving'] = this.listMoving;
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
  DurasiDriving duration;
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
        ? new DurasiDriving.fromJson(json['duration'])
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
