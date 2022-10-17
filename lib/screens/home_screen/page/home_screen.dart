import 'package:currency_converter/currency.dart' as data;
import 'package:currency_converter/currency_converter.dart';
import 'package:currency_converter/Currency.dart';
import 'package:currency_coverter/helpers/currency_converter_helper.dart';
import 'package:currency_coverter/modals/currency_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<CurrencyConvert?> future;

  String dropDownValue = 'AUD';

  List currency = [
    "USD",
    "AUD",
    "BBD",
    "BSD",
    "BTC",
    "BTN",
    "EUR",
    "MRU",
    "MXN",
    "RSD",
    "RUB",
    "RWF",
    "SAR",
    "INR",
    "XDR",
    "XOF",
    "XPD",
    "XPF",
  ];
  String fromCurrency = "USD";
  String toCurrency = "INR";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = CurrencyConvertApiHelper.currencyConvertApiHelper.currencyConvertorAPI(from: "BTC", to: "AUD");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" 😃 Currency Converter "), centerTitle: true),
      body: FutureBuilder(
        future: future,
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text("${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            CurrencyConvert? data = snapShot.data as CurrencyConvert?;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Amount  :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: 182,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Currency : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                DropdownButtonFormField(
                                  value: fromCurrency,
                                  onChanged: (val) {
                                    setState(() {
                                      fromCurrency = val!.toString();
                                    });
                                  },
                                  items: currency.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("To Convert : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                DropdownButtonFormField(
                                  value: toCurrency,
                                  onChanged: (val) {
                                    setState(() {
                                      toCurrency = val!.toString();
                                    });
                                  },
                                  items: currency.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Result : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "$fromCurrency =",
                            style: TextStyle(
                              color: Colors.redAccent,
                              decoration: TextDecoration.none,
                              fontSize: 27,
                            ),
                          ),
                          Text(
                            " 1",
                            style: TextStyle(
                              color: Colors.redAccent,
                              decoration: TextDecoration.none,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "THEN,",
                        style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.none,
                          fontSize: 27,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "$toCurrency :",
                            style: TextStyle(
                              color: Colors.redAccent,
                              decoration: TextDecoration.none,
                              fontSize: 27,
                            ),
                          ),
                          Text(
                            " ${data!.rate.roundToDouble()}",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.none,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          future = CurrencyConvertApiHelper.currencyConvertApiHelper
                              .currencyConvertorAPI(
                            from: fromCurrency,
                            to: toCurrency,
                          );
                        });
                      },
                      child: const Text(
                        "CONVERT",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
