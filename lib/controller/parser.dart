import 'package:intl/intl.dart';

final carihari = new DateFormat('MM-dd-yyyy');

final hari = new DateFormat('EE, dd MMMM yyyy', 'id_ID');

final angka =
    NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
