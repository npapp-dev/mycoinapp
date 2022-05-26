import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycoinapp/services/coinprices_service.dart';
import 'package:mycoinapp/services/exchange_rate_service.dart';
import 'package:mycoinapp/shared/menu_drawer.dart';

class ExchangeRateScreen extends StatefulWidget {
  const ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  _ExchangeRateScreenState createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  ExchangeRateService exchangeRateService = new ExchangeRateService();
  String dropdownValue = "GBP";

  Widget buildTextViewElement(context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child:
        Column(
            children: [
              Row(children: [
                Expanded(child:
                Text('Select base currency', textAlign: TextAlign
                    .center)),
                Expanded(child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.monetization_on_outlined),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['EUR', 'HUF', 'USD', 'GBP']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))
              ]),
              FutureBuilder(
                future: exchangeRateService.getLatestExchangeRates(
                    dropdownValue),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    var response = json.decode(snapshot.data);
                    return Column(
                        children: [
                          Row(
                              children: [
                                Expanded(
                                    child: Text('Base', textAlign: TextAlign
                                        .center)),
                                Expanded(child: Center(child: Text(
                                    response['base'])))
                              ]),
                          Row(
                              children: [
                                Expanded(child: Text(
                                    'HUF', textAlign: TextAlign.center)),
                                Expanded(child: Center(
                                    child: Text(
                                        response['rates']['HUF'].toString())))
                              ]
                          ),
                          Row(
                              children: [
                                Expanded(child: Text(
                                    'USD', textAlign: TextAlign.center)),
                                Expanded(child: Center(
                                    child: Text(
                                        response['rates']['USD'].toString())))
                              ]
                          )
                        ]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            ]));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Exchange rate')),
        drawer: MenuDrawer(),
        body: buildTextViewElement(context));
  }
}