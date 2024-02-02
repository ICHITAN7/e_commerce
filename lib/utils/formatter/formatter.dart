import 'package:intl/intl.dart';
class HFormatter {
  static String formatDate(DateTime? date){
    date??=DateTime.now();
    return DateFormat('dd-mmm-yyyy').format(date);
  }
}