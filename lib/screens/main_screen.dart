import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybitcoinapp/services/coinprices_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CoinPricesService coinPricesService = new CoinPricesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: ListView(padding: const EdgeInsets.all(8), children: [
              Container(
                  height: 50,
                  child: Row(children: [
                    Expanded(
                        child: Text('Bitcoin', textAlign: TextAlign.center)),
                    Expanded(
                      child: FutureBuilder(
                        future: coinPricesService.getLatestBitCoinPrices(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            var response = json.decode(snapshot.data);
                            var f = NumberFormat.currency(
                                decimalDigits: 0,
                                locale: "hu_HUF",
                                symbol: "HUF");
                            return Center(
                                child: Text(
                                    '${f.format(response['bitcoin']['huf'])}'));
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ])),
              Container(
                  height: 50,
                  child: Row(children: [
                    Expanded(
                        child: Text('Ethereum', textAlign: TextAlign.center)),
                    Expanded(
                      child: FutureBuilder(
                        future: coinPricesService.getLatestEthereumPrices(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            var response = json.decode(snapshot.data);
                            var f = NumberFormat.currency(
                                decimalDigits: 0,
                                locale: "hu_HUF",
                                symbol: "HUF");
                            return Center(
                                child: Text(
                                    '${f.format(response['ethereum']['huf'])}'));
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    )
                  ])),
              Container(
                  height: 50,
                  child: Row(children: [
                    Expanded(child: Text('Doge', textAlign: TextAlign.center)),
                    Expanded(
                        child: FutureBuilder(
                      future: coinPricesService.getLatestDogeCoinPrice(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          var response = json.decode(snapshot.data);
                          var f = NumberFormat.currency(
                              decimalDigits: 0,
                              locale: "hu_HUF",
                              symbol: "HUF");
                          return Center(
                              child: Text(
                                  '${f.format(response['dogecoin']['huf'])}'));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ))
                  ])),
              Container(
                  height: 50,
                  child: Row(children: [
                    Expanded(
                        child: Text('Binance', textAlign: TextAlign.center)),
                    Expanded(
                        child: FutureBuilder(
                      future: coinPricesService.getLatestBinanceCoinPrice(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          var response = json.decode(snapshot.data);
                          var f = NumberFormat.currency(
                              decimalDigits: 0,
                              locale: "hu_HUF",
                              symbol: "HUF");
                          return Center(
                              child: Text(
                                  '${f.format(response['binancecoin']['huf'])}'));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ))
                  ])),
              Container(
                  height: 50,
                  child: Row(children: [
                    Expanded(
                        child: Text('Tether', textAlign: TextAlign.center)),
                    Expanded(
                        child: FutureBuilder(
                          future: coinPricesService.getLatestTetherPrice(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              var response = json.decode(snapshot.data);
                              var f = NumberFormat.currency(
                                  decimalDigits: 0,
                                  locale: "hu_HUF",
                                  symbol: "HUF");
                              return Center(
                                  child: Text(
                                      '${f.format(response['tether']['huf'])}'));
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ))
                  ])),
              Container(
                  height: 50,
                  child: Row(children: [
                    Expanded(
                        child: Text('Ripple (xrp)', textAlign: TextAlign.center)),
                    Expanded(
                        child: FutureBuilder(
                          future: coinPricesService.getLatestXrpPrice(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              var response = json.decode(snapshot.data);
                              var f = NumberFormat.currency(
                                  decimalDigits: 0,
                                  locale: "hu_HUF",
                                  symbol: "HUF");
                              return Center(
                                  child: Text(
                                      '${f.format(response['ripple']['huf'])}'));
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ))
                  ]))
            ])));
  }
}
