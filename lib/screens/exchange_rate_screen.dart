import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycoinapp/services/coinprices_service.dart';
import 'package:mycoinapp/services/exchange_rate_service.dart';
import 'package:mycoinapp/shared/menu_drawer.dart';

class ExchangeRateScreen extends StatefulWidget{
  const ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  _ExchangeRateScreenState createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  ExchangeRateService exchangeRateService = new ExchangeRateService();

  Widget buildTextViewElement(context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: FutureBuilder(
          future: exchangeRateService.getLatestExchangeRates(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              var response = snapshot.data;
              return Text(response);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('Exchange rate')),
        drawer: MenuDrawer(),
        body: buildTextViewElement(context));
  }
}