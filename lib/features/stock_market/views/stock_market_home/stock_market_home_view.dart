import 'package:alpata_assignment/core/enum/load_statuas.dart';
import 'package:alpata_assignment/core/extensions/size_extension.dart';
import 'package:alpata_assignment/features/stock_market/views/stock_market_home/stock_market_home_notifier.dart';
import 'package:alpata_assignment/features/stock_market/widgets/scrolling_text_card.dart';
import 'package:alpata_assignment/features/stock_market/widgets/stock_market_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockMarketHomeView extends StatelessWidget {
  const StockMarketHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StockMarketHomeNotifier()..initializeStockMarket(),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(),
            body: Consumer<StockMarketHomeNotifier>(
                builder: (_, stockMarketNotifier, __) {
              if (stockMarketNotifier.loadStatus == LoadStatus.loaded) {
                return Column(
                  children: [
                    SizedBox(
                      height: context.setScaledHeight(0.12),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            stockMarketNotifier.selectableProducts?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final selectedProduct =
                              stockMarketNotifier.selectableProducts?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: ChoiceChip(
                              selectedColor: Colors.green,
                              label: Text(selectedProduct?.mALADI ?? "Null"),
                              selected:
                                  stockMarketNotifier.selectedValue == index,
                              onSelected: (selected) {
                                if (selected) {
                                  stockMarketNotifier.setSelectedValue(index);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    StockMarketChart(
                      loadStatus: stockMarketNotifier.graphicLoadStatus,
                      annualSaleDataModels:
                          stockMarketNotifier.annualSaleDataModels!,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: context.setScaledHeight(0.18),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            stockMarketNotifier.scrollingTextModels?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final currentTextModel =
                              stockMarketNotifier.scrollingTextModels?[index];
                          return ScrollingTextCard(currentTextModel: currentTextModel,);
                        },
                      ),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
      }),
    );
  }
}
