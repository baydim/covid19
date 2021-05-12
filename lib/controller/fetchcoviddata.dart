import 'package:covid19/controller/urlcontroller.dart';
import 'package:covid19/model/ModelCovidList.dart';
// import 'package:covid19/model/ModelCovidDaily.dart';
import 'package:covid19/model/ModelCovidListCountry.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetDataCovid extends GetxController {
  ModelCovidListCountry mclc;
  List<ModelCovidList> mcl;

  bool lo = true;
  bool lo2 = true;
  // bool lo2 = true;

  //get data list country
  // getDataListCountry() async {
  //   lo = true;
  //   var url = Uri.parse(urli[4]);
  //   var res = await http.get(url);

  //   if (res.statusCode == 200) {
  //     final modelCovidListCountry = modelCovidListCountryFromMap(res.body);
  //     mclc = modelCovidListCountry;
  //     lo = false;
  //     update();
  //   }
  //   if (res.statusCode != 200) {
  //     lo = true;
  //     update();
  //   }
  //   update();
  // }

  getcovidatacon() async {
    lo2 = true;
    var url = Uri.parse(urli[0]);
    var res = await http.get(url);

    if (res.statusCode == 200) {
      final modelCovidList = modelCovidListFromMap(res.body);
      mcl = modelCovidList;

      lo2 = false;
      update();
    }
    if (res.statusCode != 200) {
      lo2 = true;
      update();
    }
    update();
  }

  //get data covid daily by date
  // List<ModelCovidDaily> mcd;
  // getDataCovidDaily() async {
  //   lo2 = true;
  //   // String now = hari.format(DateTime.now());
  //   // DateTime d = DateTime.now();
  //   // String bulan = d.month.toString();
  //   // String hari = (int.tryParse(d.day.toString()) - 1).toString();
  //   // String tahun = d.year.toString();

  //   // var url = Uri.parse(urli[3] + "/" + "$bulan-$hari-$tahun");
  //   var url = Uri.parse("https://covid19.mathdro.id/api/daily/");
  //   print(url.toString());
  //   var res = await http.get(url);

  //   if (res.statusCode == 200) {
  //     final modelCovidDaily = modelCovidDailyFromMap(res.body);
  //     // Map data = {"data": res.body};
  //     mcd = modelCovidDaily;

  //     print(mcd.toString());

  //     lo2 = false;
  //     update();
  //   }
  //   if (res.statusCode != 200) {
  //     print("gagal");
  //     lo2 = true;
  //     update();
  //   }
  //   update();
  // }
}
