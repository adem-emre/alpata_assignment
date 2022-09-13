import 'package:alpata_assignment/core/model/base_response_model.dart';

class ProductSelectModel implements BaseResponseModel{
  List<Data>? data;
  int? totalRecords;
  int? totalAmount;

  ProductSelectModel({this.data, this.totalRecords, this.totalAmount});

  ProductSelectModel.fromJson(Map<String, dynamic> json) {
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
  String? mAL;
  String? mALADI;
  String? dIL;

  Data({this.mAL, this.mALADI, this.dIL});

  Data.fromJson(Map<String, dynamic> json) {
    mAL = json['MAL'];
    mALADI = json['MALADI'];
    dIL = json['DIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MAL'] = mAL;
    data['MALADI'] = mALADI;
    data['DIL'] = dIL;
    return data;
  }
}
