import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as flutterDateTimePickerPlus;

class CoreServiceDatePicker {
  openMonthAndYearPickerActionSheet({
    required BuildContext context,
    DateTime? defaultDate,
    required Function(DateTime dateTime) onSelected,
  }) {
    dynamic localeType = flutterDateTimePickerPlus.LocaleType.th;

    DateTime currentDate = DateTime(2023, 10, 30);
    DateTime minDate =
        DateTime(currentDate.year - 1, currentDate.month + 1, currentDate.day);
    DateTime maxDate = currentDate;

    flutterDateTimePickerPlus.DatePicker.showPicker(
      context,
      locale: localeType,
      theme: flutterDateTimePickerPlus.DatePickerTheme(
        backgroundColor: Colors.white,
        doneStyle: const TextStyle(
          color: Colors.blue,
        ),
        cancelStyle: TextStyle(
          color: Colors.grey.withOpacity(0.7),
        ),
        itemStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      pickerModel: CustomMonthAndYearPicker(
        locale: localeType,
        minTime: minDate,
        maxTime: maxDate,
        currentTime: defaultDate ?? currentDate,
      ),
      onConfirm: (dateTime) {
        onSelected(dateTime);
      },
    );
  }
}

class CustomMonthAndYearPicker
    extends flutterDateTimePickerPlus.DatePickerModel {
  CustomMonthAndYearPicker({
    DateTime? currentTime,
    DateTime? minTime,
    DateTime? maxTime,
    flutterDateTimePickerPlus.LocaleType? locale,
  }) : super(
          locale: locale,
          minTime: minTime,
          maxTime: maxTime,
          currentTime: currentTime,
        );

  @override
  List<int> layoutProportions() {
    return [
      1, // Month on the left
      1, // Year on the right
      0, // Day
    ];
  }
}
