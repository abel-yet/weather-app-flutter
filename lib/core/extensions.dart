import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BuildContextExtensions on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}

extension DateTimeExtensions on DateTime {
  String get getFormattedDate {
    final formatter = DateFormat("d MMMM, EEEE");
    return formatter.format(this);
  }

  String get getNameOfDay {
    if (day == DateTime.now().day) {
      return "Today";
    }

    if (day == DateTime.now().day + 1) {
      return "Tomorrow";
    }

    final formatter = DateFormat("EEE, MMM d");

    return formatter.format(this);
  }

  String get getTime {
    final formatter = DateFormat("h a");

    return formatter.format(this);
  }
}
