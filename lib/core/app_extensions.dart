import 'package:test_today/core/core.dart';
import 'package:flutter/material.dart';

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(this);
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension DateTimeX on DateTime {
  bool isUnderage() =>
      (DateTime(DateTime.now().year, month, day).isAfter(DateTime.now())
          ? DateTime.now().year - year - 1
          : DateTime.now().year - year) <
      16;
}

extension GetAge on DateTime {
  int getAge({DateTime? currentDateValue}) {
    final birthDate = this;
    DateTime currentDate = currentDateValue ?? DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}

extension IsDarkTheme on BuildContext {
  bool isDarkTheme() {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

extension ToList on String? {
  List<String> toList() {
    final str = this;
    if (str != null && str.isNotEmpty) {
      try {
        final list = str.split(',');
        return list;
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}

extension ToString on List<String>? {
  String toStr() {
    final list = this;
    if (list != null && list.isNotEmpty) {
      try {
        final str = list.join(',');
        return str;
      } catch (e) {
        return '';
      }
    } else {
      return '';
    }
  }
}

/*
extension ListSortByCreatedAt on List<MonthlyUpdateModel> {
  List<MonthlyUpdateModel> listSortByCreatedAt(){
    final List<MonthlyUpdateModel> list = this;
    list.sort((a, b){
      if(a.createdAt!=null && b.createdAt!=null) {
        final apd = DateTimeUtility.getDateFromMonthlyCreated(a.createdAt);
        final bpd = DateTimeUtility.getDateFromMonthlyCreated(b.createdAt);
        if(apd!=null && bpd!=null){
          return apd.compareTo(bpd);
        }
      }
    });
    return list;
  }
}*/
