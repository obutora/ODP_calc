import 'package:flutter/material.dart';

import '../../const.dart';

InputDecoration searchInputDecoration({required String hintText}) {
  return InputDecoration(
    focusColor: kGreen,
    hintText: hintText,
    hintStyle:
        kTextSearchBox.copyWith(color: kGreen, fontWeight: FontWeight.w400),
    errorStyle: kTextDescription2.copyWith(color: kOrange),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreen, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    ),
    fillColor: kGreen,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreen, width: 3),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreen, width: 3),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kOrange, width: 3),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
