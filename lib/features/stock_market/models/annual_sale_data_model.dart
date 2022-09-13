import 'package:alpata_assignment/core/model/base_response_model.dart';

class AnnualSaleDataModel implements BaseResponseModel {
  List<Data>? data;
  int? totalRecords;
  int? totalAmount;

  AnnualSaleDataModel({this.data, this.totalRecords, this.totalAmount});

  AnnualSaleDataModel.fromJson(Map<String, dynamic> json) {
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
  double? fIYAT;
  int? aY;
  int? yIL;

  Data({this.mAL, this.fIYAT, this.aY, this.yIL});

  Data.fromJson(Map<String, dynamic> json) {
    mAL = json['MAL'];
    fIYAT = (json['FIYAT'] as num).toDouble();
    aY = json['AY'];
    yIL = json['YIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MAL'] = mAL;
    data['FIYAT'] = fIYAT;
    data['AY'] = aY;
    data['YIL'] = yIL;
    return data;
  }
}
