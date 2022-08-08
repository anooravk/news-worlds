import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 26.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
);
const kChipsTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const kSubTextStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w300,
  color: Colors.black,
);
const kDetailsTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w300,
  // color: Colors.black,
);
const kTitleDetailsTextStyle = TextStyle(
  fontSize: 26.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w900,
  // color: Colors.black,
);

const kTextFieldInputDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  hintText: 'Search latest news',
  icon: Icon(
    Icons.search,
    color: Colors.white,
  ),
  hintStyle: TextStyle(
    fontSize: 14.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w300,
    color: Colors.white,
  ),
);
