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
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(height: 30),
              FutureBuilder(
                future: exchangeRateService.getLatestExchangeRates(
                    dropdownValue),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    var response = json.decode(snapshot.data);
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 50,
                              child:
                              Row(
                                  children: [
                                    Expanded(
                                        child: Text('Base', textAlign: TextAlign
                                            .center)),
                                    Expanded(child: Center(child: Text(
                                        response['base'])))
                                  ])),
                          Container(
                              height: 50,
                              child:
                              Row(
                                  children: [
                                    Expanded(child: Text(
                                        'HUF', textAlign: TextAlign.center)),
                                    Expanded(child: Center(
                                        child: Text(
                                            response['rates']['HUF']
                                                .toString())))
                                  ]
                              )),
                          Container(
                              height: 50,
                              child:
                              Row(
                                  children: [
                                    Expanded(child: Text(
                                        'USD', textAlign: TextAlign.center)),
                                    Expanded(child: Center(
                                        child: Text(
                                            response['rates']['USD']
                                                .toString())))
                                  ]
                              )),
                          Container(
                              height: 50,
                              child:
                              Row(
                                  children: [
                                    Expanded(child: Text(
                                        'EUR', textAlign: TextAlign.center)),
                                    Expanded(child: Center(
                                        child: Text(
                                            response['rates']['EUR']
                                                .toString())))
                                  ]
                              )),
                          Container(
                              height: 50,
                              child:
                              Row(
                                  children: [
                                    Expanded(child: Text(
                                        'GBP', textAlign: TextAlign.center)),
                                    Expanded(child: Center(
                                        child: Text(
                                            response['rates']['GBP']
                                                .toString())))
                                  ]
                              )
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