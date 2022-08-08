import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const Map<FlexScheme, Widget> _schemeOptions = <FlexScheme, Widget>{
  FlexScheme.hippieBlue: Padding(
    padding: EdgeInsets.all(6),
    child: Text(
      'Hippie\nblue',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11),
    ),
  ),
  FlexScheme.money: Padding(
    padding: EdgeInsets.all(6),
    child: Text(
      'Green\nmoney',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11),
    ),
  ),
  FlexScheme.redWine: Padding(
    padding: EdgeInsets.all(6),
    child: Text(
      'Red red\nwine',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11),
    ),
  ),
  FlexScheme.custom: Padding(
    padding: EdgeInsets.all(6),
    child: Text(
      'Custom\npurple',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11),
    ),
  ),
};

// const List<String> availabeThemes = [
//   'amber',
//   'aquaBlue',
//   'bahamaBlue',
//   'barossa',
//   'bigStone',
//   'blue',
//   'brandBlue',
//   'custom',
//   'damask',
//   'deepBlue',
//   'deepPurple',
//   'ebonyClay',
//   'espresso',
//   'gold',
//   'green',
//   'greyLaw',
//   'hippieBlue',
//   'indigo',
//   'jungle',
//   'mallardGreen',
//   'mandyRed',
//   'mango',
//   'material',
//   'materialHc',
//   'money',
//   'outerSpace',
//   'purpeBrown',
//   'red',
//   'redWine',
//   'sakura',
//   'shark',
//   'vesuviusBurn',
//   'wasabi'
// ];
//
