import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownValue = 'AUD';

  List currency = [
    'AUD',
    'AST',
    'CAT',
    'CNX',
    'EVR',
    'GUP',
    'HVN',
    'INS',
    'ITC',
    'MOD',
    'MNX',
    'NVC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(" 😃 Currency Converter "), centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "1 BTC = 32962.88 AUD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "1 ETH = 2409.57 AUD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "1 XRP = 0.5327 AUD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "1 USDT = 1.4356 AUD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  "1 BCH = 200.55 AUD",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Current Currency",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Spacer(),
                    DropdownButton(
                        value: dropDownValue,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownColor: Colors.blueAccent,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: currency.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            dropDownValue = val.toString();
                          });
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
