import 'dart:ui';

import 'package:countup/countup.dart';
import 'package:covid19/controller/parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BotSetHm extends StatefulWidget {
  final String negara, kota, iso2;
  final int update, sembuh, terkonfirmasi, meniggal, aktif;

  BotSetHm({
    this.negara,
    this.kota,
    this.update,
    this.iso2,
    this.sembuh,
    this.terkonfirmasi,
    this.meniggal,
    this.aktif,
  });
  @override
  _BotSetHmState createState() => _BotSetHmState();
}

class _BotSetHmState extends State<BotSetHm> {
  var date;
  @override
  void initState() {
    super.initState();
    date = DateTime.fromMillisecondsSinceEpoch(widget.update);
    print(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: Get.height / 3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.negara,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.network(
                      "https://www.countryflags.io/" +
                          widget.iso2.toLowerCase() +
                          "/flat/48.png",
                      width: 20,
                    ),
                  ],
                ),
                widget.kota == null
                    ? Text("")
                    : Text(
                        widget.kota,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Countup(
                      begin: 0,
                      end: double.tryParse(
                        widget.sembuh.toString(),
                      ),
                      duration: Duration(milliseconds: 2000),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green.shade700,
                      ),
                    ),
                    Text(
                      "Sembuh",
                      style: TextStyle(
                        color: Colors.green.shade700,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Countup(
                      begin: 0,
                      end: double.tryParse(
                        widget.terkonfirmasi.toString(),
                      ),
                      duration: Duration(milliseconds: 2000),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.yellow.shade700,
                      ),
                    ),
                    Text(
                      "Terkonfirmasi",
                      style: TextStyle(
                        color: Colors.yellow.shade700,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          ////////

          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Countup(
                      begin: 0,
                      end: double.tryParse(
                        widget.aktif.toString(),
                      ),
                      duration: Duration(milliseconds: 2000),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.purple.shade700,
                      ),
                    ),
                    Text(
                      "Aktif",
                      style: TextStyle(
                        color: Colors.purple.shade700,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Countup(
                      begin: 0,
                      end: double.tryParse(
                        widget.meniggal.toString(),
                      ),
                      duration: Duration(milliseconds: 2000),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red.shade700,
                      ),
                    ),
                    Text(
                      "Meninggal",
                      style: TextStyle(
                        color: Colors.red.shade700,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Diupdate pada : ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                hari.format(date),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          )

          // Text(
          //   hari.format(date),
          // )
        ],
      ),
    );
  }
}
