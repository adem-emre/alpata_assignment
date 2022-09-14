

import 'package:alpata_assignment/core/network/base_network.dart';
import 'package:alpata_assignment/features/stock_market/models/annual_sale_data_model.dart' as asdm;
import 'package:alpata_assignment/features/stock_market/models/product_select_model.dart' as psm;
import 'package:alpata_assignment/features/stock_market/models/scrolling_text_model.dart' as stm;

import '../models/scrolling_text_model.dart';

class StockMarketService extends BaseNetwork {
  Future<List<psm.Data>?> getSelectableProducts() async {
    final response = await basePost<psm.ProductSelectModel>(
        "Alpha.Borsa.Bulten/Genel/GetUrunlerSelect",
        {"first": 0, "rows": 0},
        psm.ProductSelectModel.fromJson);
    return response.data;
  }

  Future<List<stm.Data>?> getScrollingText()async{
    final response = await basePost<ScrollingTextModel>(
        "Alpha.Borsa.Bulten/Genel/GetKayanYazi",
        {"first": 0, "rows": 0},
        ScrollingTextModel.fromJson);
    return response.data;
  }

   Future<List<asdm.Data>?> getAnnualSaleDataGraphic( Map<String,dynamic> queryParameters)async{
    final response = await basePost<asdm.AnnualSaleDataModel>(
        "Alpha.Borsa.Bulten/Genel/GetSatisVerileriYilGrafik",
        {},
        asdm.AnnualSaleDataModel.fromJson,
        queryParameters:queryParameters
        );
    return response.data;
  }
  


}
