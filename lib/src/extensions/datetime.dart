import 'package:intl/intl.dart';

extension StringFromDate on DateTime {
  String convertDateTime2String({String format = 'yy-MM-dd'}) {
    return DateFormat(format).format(this);
  }
}

extension DateFromString on String {
  DateTime convertString2DateTime(
      {String format = "yyyy-MM-ddTHH:mm:ss.SSSZ"}) {
    return DateFormat(format).parse(this);
  }

  String convertString2String(
      {String inputFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ",
      String outputFormat = "yyyy-MM-dd"}) {
    final input = convertString2DateTime(format: inputFormat);
    return input.convertDateTime2String(format: outputFormat);
  }
}
