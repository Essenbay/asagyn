import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:zakazflow/core/extensions/context.dart';

extension DateTimeX on DateTime {
  static DateTime? formatServerToLocaleDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) {
      return null;
    }
    //Add timezone of Almaty
    dateTimeStr = '$dateTimeStr.000+0600';

    final inputDateTime = DateTime.parse(dateTimeStr).toUtc();

    final localDateTime = inputDateTime.toLocal();

    return localDateTime;
  }

  static DateTime parseFromServer(String dateString) {
    dateString = dateString.replaceAll(RegExp(r'\[.*\]$'), '');
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime;
  }

  static DateTime parseDateTime(String value) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(value);
  }

  static DateTime parseDate(String value) {
    return DateFormat('yyyy.MM.dd').parse(value);
  }

  String getDateString() {
    final format = DateFormat('yyyy.MM.dd');
    return format.format(this);
  }

  String getDateTimeString(BuildContext context) {
    final format =
        DateFormat('dd MMM yyyy, HH:MM', context.localized.localeName);
    return format.format(this);
  }

  String getMonthStr() {
    final format = DateFormat('MMMM');
    return format.format(this);
  }

  String getDateMonth() {
    final format = DateFormat('dd MM');
    return format.format(this);
  }

  static DateFormat shortFullDateDateFormat(BuildContext context) =>
      DateFormat('E, d MMM y', context.localized.localeName);
  static DateFormat fullDateFormat(BuildContext context) =>
      DateFormat('EEEE, d MMMM y', context.localized.localeName);
  static DateFormat shortDate(BuildContext context) =>
      DateFormat('d MMM', context.localized.localeName);
  static Duration findMinDateDifference(List<DateTime> dates) {
    if (dates.length < 2) {
      return Duration.zero;
    }

    Duration minDifference = dates[1].difference(dates[0]);

    for (int i = 2; i < dates.length; i++) {
      Duration difference = dates[i].difference(dates[i - 1]);
      if (difference < minDifference) {
        minDifference = difference;
      }
    }

    return minDifference;
  }
}
