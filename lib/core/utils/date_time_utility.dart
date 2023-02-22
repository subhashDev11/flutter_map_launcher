import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './logger_utils.dart';

class DateTimeUtility {
  static DateTime? getDateFromSTR(String? time) {
    if (time == null) {
      return null;
    }
    final format = DateFormat('yyy-MM-dd');
    DateTime dt = format.parse(time);
    return dt;
  }

  static String? parseDate(String? date) {
    try {
      final dt = getDateFromSTR(date);
      if (dt == null) {
        return null;
      }
      DateFormat formatter = DateFormat('dd-MM-yyyy');
      return formatter.format(dt);
    } catch (e) {
      return null;
    }
  }

  static String getDayMonth(DateTime dateTime) {
    DateFormat formatter = DateFormat('MMM dd');
    return formatter.format(dateTime);
  }

  static DateTime? getDateFromMonthlyCreated(String? date) {
    if (date == null) {
      return null;
    }
    if (date.isEmpty) {
      return null;
    }
    final dateTime = DateTime.tryParse(date); //p
    return dateTime;
  }

  static String? getFormattedDateFromMonthlyCreated(String? date) {
    if (date == null) {
      return null;
    }
    if (date.isEmpty) {
      return null;
    }
    final dateTime = DateTime.tryParse(date); //p
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    if (dateTime == null) {
      return '';
    }
    final String formatted = formatter.format(dateTime);
    return formatted.toString();
  }

  static String monthlyUpdateSortTitle(String? date) {
    if (date == null) {
      return '';
    }
    final dateTime = DateTime.tryParse(date); //parseNormal2DateTime(date, myFormat: "MMM dd");
    /*if (kDebugMode) {
      print('monthlyUpdateSortTitle dateTime - $date');
    }*/
    return dateTime != null ? getDayMonth(dateTime) : "";
  }

  static Future<DateTime?> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year + 50,
      ),
    );
    return date;
  }

  static String getFormattedDateFromInput(String date) {
    try {
      /// inputFormat - format getting from api or other func.
      var inputFormat = DateFormat('dd/MM/yyyy').parse(date);

      /// outputFormat - convert into format you want to show.
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(inputFormat);
      return formatted.toString();
    } catch (e) {
      AppLogger.e('Error to parse date > $e');
      return '';
    }
  }

  static String? getFormattedDate(DateTime? inputDate) {
    if (inputDate == null) {
      return null;
    }
    try {
      /// outputFormat - convert into format you want to show.
      final formatted = DateFormat('yyyy-MM-dd').format(inputDate);
      return formatted.toString();
    } catch (e) {
      AppLogger.e('Error to parse date > $e');
      return '';
    }
  }
/*
  final date = DateTime.now();
  final format = DateFormat('yyyy-MM-dd');
  print(format.format(date));
   */
}
