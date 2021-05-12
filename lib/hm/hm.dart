import 'package:covid19/controller/fetchcoviddata.dart';
import 'package:covid19/hm/botsethm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Hm extends StatefulWidget {
  @override
  _HmState createState() => _HmState();
}

class _HmState extends State<Hm> {
  GetDataCovid g = Get.put(GetDataCovid());

  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  movcam({double lat, double long}) {
    // LatLng l = LatLng(lat, long);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 7,
        ),
      ),
    );
    // .then((result) =>
    //     print("mapController.animateCamera() returned $result"));
  }

  @override
  void initState() {
    super.initState();
    // g.getDataListCountry();
    g.getcovidatacon();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetDataCovid>(
      init: GetDataCovid(),
      builder: (val) {
        var a = val.mcl;

        return Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox.expand(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MapboxMap(
                    styleString:
                        "mapbox://styles/baydim/ckogkjit22e5t18mg0no79e5a",
                    onMapCreated: _onMapCreated,
                    zoomGesturesEnabled: true,
                    rotateGesturesEnabled: false,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(0, 0),
                      zoom: 1,
                    ),
                    onStyleLoadedCallback: onStyleLoadedCallback,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        if (val.lo2)
                          for (var i = 0; i < 7; i++)
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 65,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                        else
                          for (var i = 0; i < 10; i++)
                            InkWell(
                              onTap: () {
                                movcam(lat: a[i].lat, long: a[i].long);
                                Get.bottomSheet(
                                  BotSetHm(
                                    negara: a[i].countryRegion,
                                    kota: a[i].provinceState,
                                    update: a[i].lastUpdate,
                                    iso2: a[i].iso2,
                                    sembuh: a[i].recovered,
                                    terkonfirmasi: a[i].recovered,
                                    meniggal: a[i].deaths,
                                    aktif: a[i].active,
                                  ),
                                  isScrollControlled: true,
                                  barrierColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: Image.network(
                                      "https://www.countryflags.io/" +
                                          a[i].iso2.toLowerCase() +
                                          "/flat/64.png",
                                      width: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          a[i].countryRegion,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),

                                        a[i].provinceState == null
                                            ? SizedBox(
                                                width: 0,
                                                height: 0,
                                              )
                                            : Text(
                                                a[i].provinceState,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              )

                                        // Text(a.recovered.toString()),
                                        // Text(a.lat.toString()),
                                        // Text(a.long.toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.black,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void onStyleLoadedCallback() {}
