import 'package:Pourosova/shared/utils/colors.dart';
import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context,
    {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(DateTime.now().year + 10),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.mainColor, // <-- SEE HERE
            onPrimary: Colors.white, // <-- SEE HERE
            onSurface: Colors.black, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: AppColors.mainColor, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return picked;
}
