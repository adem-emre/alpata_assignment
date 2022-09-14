import 'package:alpata_assignment/core/enum/load_statuas.dart';
import 'package:alpata_assignment/core/utils/functions.dart';
import 'package:alpata_assignment/features/stock_market/service/stock_market_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:alpata_assignment/features/stock_market/models/product_select_model.dart' as psm;

import '../../../../helper/shared_helper.dart';
import '../../models/annual_sale_data_model.dart' as asdm;
import '../../models/scrolling_text_model.dart' as stm;

class StockMarketHomeNotifier extends ChangeNotifier{
  final StockMarketService _stockMarketService = StockMarketService();

  LoadStatus _loadStatus = LoadStatus.idle;
  LoadStatus get loadStatus => _loadStatus;
  String _errorStr ="";
  String get errorStr => _errorStr;

  LoadStatus _graphicLoadStatus = LoadStatus.idle;
  LoadStatus get graphicLoadStatus => _graphicLoadStatus;
  String _graphicErrorStr ="";
  String get graphicErrorStr => _graphicErrorStr;
  int selectedValue = 0;
  List<psm.Data>? selectableProducts;
  List<asdm.Data>? annualSaleDataModels;
  List<stm.Data>? scrollingTextModels; 

  setSelectedValue(int index){
    selectedValue = index;
    _fetchSelectedProductGraphic(selectableProducts![index]);
    notifyListeners();
  }

  Future<void> _fetchSelectableProducts()async{
    selectableProducts = await _stockMarketService.getSelectableProducts();
  }

  Future<void> _fetchScrollingTextModels()async{
    scrollingTextModels = await _stockMarketService.getScrollingText();
  }

  Future<void> _fetchSelectedProductGraphic(psm.Data selectedProduct)async{
    try {
      _graphicLoadStatus = LoadStatus.loading;
    final queryParam = {
      "malKodu":selectedProduct.mAL,
      "yil":2022
    };
    annualSaleDataModels= await _stockMarketService.getAnnualSaleDataGraphic(queryParam);
    _graphicLoadStatus = LoadStatus.loaded;
    } on DioError catch (e) {
       _graphicLoadStatus = LoadStatus.error;
      _graphicErrorStr = checkAndReturnErrorMessage(e);
    }
    notifyListeners();
  }

  Future<void> initializeStockMarket()async{
    try {
      _loadStatus = LoadStatus.loading;
      await _fetchScrollingTextModels();
      await _fetchSelectableProducts();
    if(selectableProducts !=null){
      await _fetchSelectedProductGraphic(selectableProducts![selectedValue]);
    }
    _loadStatus = LoadStatus.loaded;
    }  on DioError catch(e) {
      _loadStatus = LoadStatus.error;
      _errorStr = checkAndReturnErrorMessage(e);
    }
    notifyListeners();
  }

  Future<bool> logOut(){
    final shared = SharedHelper();
    return shared.clearAll();
  }
  

}