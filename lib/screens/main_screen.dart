import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycoinapp/services/coinprices_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CoinPricesService coinPricesService = new CoinPricesService();

  Widget buildTextViewElement(context) {
    return SizedBox(
        width: double.infinity,
        child: FutureBuilder(
          future: coinPricesService.getTop5Prices(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              var response = snapshot.data;
              var f = NumberFormat.currency(
                  decimalDigits: 0, locale: "hu_HUF", symbol: "HUF");
              return ListView.builder(
                itemCount: response.keys.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = response.keys.elementAt(index);
                  return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(context, key),
                        );
                      },
                      child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(child: Text(
                                  key, textAlign: TextAlign.center)),
                              Expanded(child: Center(
                                  child: Text('${f.format(response[key])}'))),
                            ],
                          ))
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget _buildPopupDialog(BuildContext context, String key) {
    return new AlertDialog(
      title: const Text('Details'),
      content: Column(
        children:[
          FutureBuilder(
            future: coinPricesService.getMarketsForCoin(key),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                var response = snapshot.data;
                print(response);
                var f = NumberFormat.currency(
                    decimalDigits: 0, locale: "hu_HUF", symbol: "HUF");
                return Text(response, textAlign: TextAlign.center);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )]
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildTextViewElement(context));
  }
}
