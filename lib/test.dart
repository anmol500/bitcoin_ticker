import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List winnos = [12, 2, 42, 4, 5, 6, 12];

main() {
  var ticket1 = ['a', 's', 'd'];

  var h = ticket1.map<DropdownMenuItem<String>>((String e) {
    return DropdownMenuItem<String>(child: Text(''));
  }).toList();
  var t = ticket1.map((e) => DropdownMenuItem(child: Text(e)));
  // var r = ticket1.map<DropdownMenuItem<String>>((String value) {
  //   return DropdownMenuItem<String>(
  //     value: value,
  //     child: Text(value),
  //   );
  // }).toList();

  List<Text> te = [];

  print(h);
}

List l;
