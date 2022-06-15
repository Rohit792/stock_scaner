import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_parser/utils/dialog_utility.dart';
import 'package:stock_scan_parser/utils/enum.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detailScreen';

  dynamic stockElement;
  List<dynamic> listStockData = [];

  DetailScreen({Key? key, required this.stockElement}) : super(key: key) {
    listStockData = [];
    listStockData = stockElement["criteria"] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColorSchema = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _loadTFistCell(themeColorSchema),
            Expanded(
              child: ListView.builder(
                  itemCount: listStockData.length,
                  itemBuilder: (context, index) {
                    String stringData = listStockData[index]["text"] ?? "--";
                    return Card(
                      color: themeColorSchema.surface,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 14),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  for (String word in _parseStockDate(
                                          stringData, listStockData[index])
                                      .split(' '))
                                    if (word.contains("(")) ...[
                                      TextSpan(
                                          text: word + ' ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: themeColorSchema.onTertiary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              var data = listStockData[index]
                                                      ["variable"][
                                                  listStockData[index]
                                                          ["variable"]
                                                      .keys
                                                      .first]["values"];
                                              if (data != null) {
                                                _showBottomSheet(context, data);
                                              } else {
                                                Utils.showAppMessage(
                                                    context,
                                                    "No data to show.",
                                                    MessageDurationType.medium);
                                              }
                                            }),
                                    ] else ...[
                                      TextSpan(
                                          text: word + ' ',
                                          style: TextStyle(
                                              color: themeColorSchema.primary)),
                                    ],
                                  // if (index != listStockData.length - 1) ...[

                                  // ]
                                  if (index != listStockData.length - 1) ...[
                                    TextSpan(
                                        text: '\n\nand',
                                        style: TextStyle(
                                            color: themeColorSchema.primary)),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }

  _showBottomSheet(BuildContext context, selectedListData) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: selectedListData.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(selectedListData[index].toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                  ),
                );
              });
        });
  }

  _parseStockDate(String stockInfo, stockData) {
    var listData = stockInfo.split(' ').toList();
    String modifiedData = '';
    for (var item in listData) {
      if (item.contains('\$')) {
        modifiedData +=
            '(${stockData["variable"][item]["default_value"] ?? stockData["variable"][item]["values"].first}) ';
      } else {
        modifiedData += "$item ";
      }
    }

    return (modifiedData);
  }

  _loadTFistCell(themeColorSchema) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stockElement["name"] ?? "--",
            style: TextStyle(color: themeColorSchema.primary),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            stockElement["tag"],
            style: TextStyle(
                color: stockElement["color"].toString().contains("green")
                    ? themeColorSchema.secondary
                    : themeColorSchema.tertiary),
          ),
        ],
      ),
    );
  }
}
