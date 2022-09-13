import 'package:alpata_assignment/core/model/base_response_model.dart';

class ScrollingTextModel implements BaseResponseModel {
  List<Data>? data;
  int? totalRecords;
  int? totalAmount;

  ScrollingTextModel({this.data, this.totalRecords, this.totalAmount});

  ScrollingTextModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    totalRecords = json['totalRecords'];
    totalAmount = json['totalAmount'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalRecords'] = totalRecords;
    data['totalAmount'] = totalAmount;
    return data;
  }
}

class Data {
  String? fTarih;
  String? tARIH;
  String? mAL;
  String? dIL;
  String? mALADI;
  int? kILO;
  String? adet;
  double? enAz;
  double? enCok;
  double? ort;
  int? isletmeId;
  int? firmaId;
  int? subeId;
  int? yil;
  int? id;
  bool? silindi;
  int? revizyon;
  String? guid;
  bool? aktif;
  bool? onaylandi;

  Data(
      {this.fTarih,
      this.tARIH,
      this.mAL,
      this.dIL,
      this.mALADI,
      this.kILO,
      this.adet,
      this.enAz,
      this.enCok,
      this.ort,
      this.isletmeId,
      this.firmaId,
      this.subeId,
      this.yil,
      this.id,
      this.silindi,
      this.revizyon,
      this.guid,
      this.aktif,
      this.onaylandi});

  Data.fromJson(Map<String, dynamic> json) {
    fTarih = json['FTarih'];
    tARIH = json['TARIH'];
    mAL = json['MAL'];
    dIL = json['DIL'];
    mALADI = json['MALADI'];
    kILO = json['KILO'];
    adet = json['Adet'];
    enAz = (json['EnAz'] as num).toDouble() ;
    enCok = (json['EnCok'] as num).toDouble();
    ort = (json['Ort'] as num).toDouble();
    isletmeId = json['IsletmeId'];
    firmaId = json['FirmaId'];
    subeId = json['SubeId'];
    yil = json['Yil'];
    id = json['Id'];
    silindi = json['Silindi'];
    revizyon = json['Revizyon'];
    guid = json['Guid'];
    aktif = json['Aktif'];
    onaylandi = json['Onaylandi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FTarih'] = fTarih;
    data['TARIH'] = tARIH;
    data['MAL'] = mAL;
    data['DIL'] = dIL;
    data['MALADI'] = mALADI;
    data['KILO'] = kILO;
    data['Adet'] = adet;
    data['EnAz'] = enAz;
    data['EnCok'] = enCok;
    data['Ort'] = ort;
    data['IsletmeId'] = isletmeId;
    data['FirmaId'] = firmaId;
    data['SubeId'] = subeId;
    data['Yil'] = yil;
    data['Id'] = id;
    data['Silindi'] = silindi;
    data['Revizyon'] = revizyon;
    data['Guid'] = guid;
    data['Aktif'] = aktif;
    data['Onaylandi'] = onaylandi;
    return data;
  }
}
