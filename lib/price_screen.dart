import 'dart:io' as s show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  //TODO: Update the Text Widget with the live bitcoin data here.
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: s.Platform.isIOS
                ? buildCupertinoPicker()
                : buildDropdownButton(),
          ),
        ],
      ),
    );
  }

  buildDropdownButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(39, 0, 39, 0),
      child: DropdownButton(
        isExpanded: true,
        dropdownColor: Colors.blue,
        value: selectCurrency,
        onChanged: (value) {
          setState(() {
            selectCurrency = value;
          });
        },
        items: currenciesList
            .map((e) => DropdownMenuItem(
                  child: Center(child: Text(e)),
                  value: e,
                ))
            .toList(),
      ),
    );
  }

  CupertinoPicker buildCupertinoPicker() {
    return CupertinoPicker(
      magnification: 1.2,
      useMagnifier: true,
      backgroundColor: Colors.blue,
      itemExtent: 32,
      onSelectedItemChanged: (onSelectedItemChanged) {
        print(onSelectedItemChanged);
      },
      children: currenciesList
          .map(
            (e) => Text(e),
          )
          .toList(),
    );
  }
}
