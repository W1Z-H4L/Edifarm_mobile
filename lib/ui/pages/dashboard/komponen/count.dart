import 'package:Edifarm/API/Api_service.dart';
import 'package:Edifarm/controler/CurrentJadwal.dart';
import 'package:Edifarm/models/Aktivitas.dart';
import 'package:Edifarm/models/Counting.dart';
import 'package:Edifarm/shared/Theme_App.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:get/get.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Future listblog;
  List<Count_Model> listblog1 = [];

  @override
  void initState() {
    super.initState();
    listblog = ServiceApiCount().getData();
    listblog.then((value) {
      setState(() {
        listblog1 = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 95,
        child: listblog1.length == 0
            ? Text(
                "____",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: -0.2,
                  color: AppTheme.grey.withOpacity(0.5),
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listblog1.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      right: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: Image.asset("assets/icon_pupuk.png"),
                        ),
                        Text(
                          listblog1[index].cOUNTKegiatan! + " Kegiatan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: -0.2,
                            color: AppTheme.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
