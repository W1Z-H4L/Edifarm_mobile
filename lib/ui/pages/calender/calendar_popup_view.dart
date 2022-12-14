import 'dart:convert';

import 'package:Edifarm/API/Api_connect.dart';
import 'package:Edifarm/API/Api_service.dart';
import 'package:Edifarm/controler/CurentUser.dart';
import 'package:Edifarm/models/Aktivitas.dart';
import 'package:Edifarm/shared/Theme_App.dart';
import 'package:Edifarm/ui/pages/aktivitas/aktivitas.dart';
import 'package:Edifarm/ui/pages/calender/filter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'custom_calendar.dart';
import 'package:http/http.dart' as http;

class CalendarPopupView extends StatefulWidget {
  const CalendarPopupView(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.onCancelClick,
      this.barrierDismissible = true,
      this.animationController,
      this.animation,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final bool barrierDismissible;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final AnimationController? animationController;
  final Animation<double>? animation;

  final Function(DateTime, DateTime)? onApplyClick;
  final Function()? onCancelClick;

  @override
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  DateTime? startDate = DateTime.now();
  DateTime? endDate;
  double topBarOpacity = 0.0;
  Animation<double>? topBarAnimation;
  late Future listblog;
  List<Aktivitas1> listblog1 = [];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    animationController?.forward();
    super.initState();
    // start = TextEditingController();
    // finish = TextEditingController();
    () async {
      listblog1 = await getData();
      print(listblog1);
    };
    // listblog.then((value) {
    //   // setState(() {
    //   //   listblog1 = value;
    //   // });
    // });
  }

  @override
  void dispose() {
    animationController?.dispose();
    // start.dispose();
    // finish.dispose();
    super.dispose();
  }

  final CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 24, left: 24, top: 100),
                    child: ListView(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: CalenderAppTheme.buildLightTheme()
                              .backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(4, 4),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Dari',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 16,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          startDate != null
                                              ? DateFormat('EEE, dd MMM')
                                                  .format(startDate!)
                                              : '--/-- ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 74,
                                    width: 1,
                                    color: CalenderAppTheme.buildLightTheme()
                                        .dividerColor,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Hingga',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 16,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          endDate != null
                                              ? DateFormat('EEE, dd MMM')
                                                  .format(endDate!)
                                              : '--/-- ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                height: 1,
                              ),
                              CustomCalendarView(
                                minimumDate: widget.minimumDate,
                                maximumDate: widget.maximumDate,
                                initialEndDate: widget.initialEndDate,
                                initialStartDate: widget.initialStartDate,
                                startEndDateChange: (DateTime startDateData,
                                    DateTime endDateData) {
                                  setState(() {
                                    startDate = startDateData;
                                    endDate = endDateData;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16, top: 8),
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: CalenderAppTheme.buildLightTheme()
                                        .primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        blurRadius: 8,
                                        offset: const Offset(4, 4),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                        topRight: Radius.circular(24)),
                                    color: AppTheme.green,
                                    child: InkWell(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24),
                                          topRight: Radius.circular(24)),
                                      highlightColor: AppTheme.splash,
                                      onTap: () {
                                        try {
                                          // animationController.reverse().then((f) {

                                          // });
                                          widget.onApplyClick!(
                                              startDate!, endDate!);
                                          Navigator.pop(context);
                                        } catch (_) {}
                                      },
                                      child: Center(
                                        child: InkWell(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AppTheme.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Text(
                                                'Cari',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontFamily:
                                                        AppTheme.fontName,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            onTap: () => pam()

                                            // showDialog(
                                            //     context: context,
                                            //     builder: (context) {
                                            //       return Container(
                                            //         padding: EdgeInsets.only(
                                            //             top: 50, bottom: 50),
                                            //         height: 150,
                                            //         width: 150,
                                            //         decoration: BoxDecoration(
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   30),
                                            //         ),
                                            //         child: AlertDialog(
                                            //           title: Text(
                                            //             "Apakah Anda Ingin Melihat Aktivitas Ditanggal $startDate hingga tanggal $endDate ?  ",
                                            //             selectionColor:
                                            //                 Colors.white,
                                            //             style: TextStyle(
                                            //                 color: AppTheme.black,
                                            //                 fontFamily:
                                            //                     AppTheme.fontName,
                                            //                 fontSize: 12,
                                            //                 fontWeight:
                                            //                     FontWeight.w400),
                                            //           ),
                                            //           actions: [
                                            //             Container(
                                            //               height: 30,
                                            //               width: 60,
                                            //               alignment:
                                            //                   Alignment.center,
                                            //               decoration: BoxDecoration(
                                            //                   color:
                                            //                       AppTheme.orange,
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .circular(
                                            //                               10)),
                                            //               child: TextButton(
                                            //                   onPressed: () {
                                            //                     Navigator.pop(
                                            //                         context);
                                            //                   },
                                            //                   child: const Text(
                                            //                     "Tidak",
                                            //                     style: TextStyle(
                                            //                         color: AppTheme
                                            //                             .white,
                                            //                         fontFamily:
                                            //                             AppTheme
                                            //                                 .fontName,
                                            //                         fontSize: 10,
                                            //                         fontWeight:
                                            //                             FontWeight
                                            //                                 .w400),
                                            //                   )),
                                            //             ),
                                            //             Container(
                                            //               height: 30,
                                            //               width: 60,
                                            //               alignment:
                                            //                   Alignment.center,
                                            //               decoration: BoxDecoration(
                                            //                   border: Border.all(
                                            //                       color: Colors
                                            //                           .orange),
                                            //                   color:
                                            //                       AppTheme.white,
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .circular(
                                            //                               10)),
                                            //               child: TextButton(
                                            //                   onPressed: () {
                                            //                     Pop();
                                            //                   },
                                            //                   child: const Text(
                                            //                     "Ya",
                                            //                     style: TextStyle(
                                            //                         color: AppTheme
                                            //                             .orange,
                                            //                         fontFamily:
                                            //                             AppTheme
                                            //                                 .fontName,
                                            //                         fontSize: 10,
                                            //                         fontWeight:
                                            //                             FontWeight
                                            //                                 .w400),
                                            //                   )),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       );
                                            //     });

                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget fill() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
                height: 800,
                child: listblog1.length == 0
                    ? const Center(
                        child: Text(
                          'Belum Melakukan Kegiatan Apapun',
                          style: TextStyle(
                              color: AppTheme.darkText,
                              fontFamily: AppTheme.fontName,
                              fontSize: 12),
                        ),
                      )
                    : ListView.builder(
                        itemCount: listblog1.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                right: 32,
                                left: 32,
                                top: 24,
                              ),
                              child: DottedBorder(
                                strokeWidth: 1,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(25),
                                color: Color.fromARGB(255, 1, 104, 97),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          left: 16,
                                          right: 16,
                                          bottom: 16,
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      top: 0, left: 0),
                                                  child: Text(
                                                      listblog1[index]
                                                          .kegiatan!,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            AppTheme.fontName,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 14,
                                                        letterSpacing: 0.2,
                                                        color: AppTheme.green,
                                                      ))),
                                              const Spacer(),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      top: 0, left: 0),
                                                  child: Text(
                                                      listblog1[index].status!,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            AppTheme.fontName,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 14,
                                                        letterSpacing: 0.2,
                                                        color: AppTheme.green,
                                                      ))),
                                            ]),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                            bottom: 16,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 1,
                                                      ),
                                                      child: Text(
                                                          listblog1[index]
                                                              .tanggalSelesai!,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontName,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 10,
                                                            letterSpacing: 0.2,
                                                            color:
                                                                AppTheme.green,
                                                          )))),
                                              const Spacer(),
                                            ],
                                          ))
                                    ]),
                              ));
                        }))));
  }

  // Future pam() async {
  //   FutureBuilder(
  //       future: getData(),
  //       builder: (context, snapshot) {
  //         return listblog1 != null
  //             ? Container(
  //                 height: 500,
  //                 width: 500,
  //                 color: Colors.black,
  //               )
  //             : loadingData();
  //       });
  // }
  void pam() async {
    listblog1 = await getData();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Filter(
        blog: listblog1,
      ),
    ));
  }

  Widget loadingData() {
    return const SafeArea(
        child: Center(
      child: CircularProgressIndicator(color: AppTheme.orange),
    ));
  }

  // TextEditingController start = TextEditingController();
  // TextEditingController finish = TextEditingController();

  // Future field() => showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //             buttonPadding: EdgeInsets.only(bottom: 100),
  //             title: Text('Masukan Rentang Tanggal'),
  //             content: Container(
  //               height: 160,
  //               width: 300,
  //               child: Column(
  //                 children: [
  //                   Text('Masukan tanggal awal'),
  //                   TextFormField(
  //                     controller: start,
  //                     showCursor: true,
  //                     cursorHeight: 25,
  //                     style: GoogleFonts.montserrat(),
  //                     decoration: const InputDecoration(
  //                       focusedBorder: OutlineInputBorder(
  //                           borderSide: BorderSide(color: AppTheme.green)),
  //                       labelText: 'Tanggal Awal',
  //                       hintText: 'Format Tanggal yyyy-mm-dd',
  //                       hintStyle: AppTheme.custom,
  //                       labelStyle: AppTheme.custom1,
  //                       focusColor: AppTheme.green,
  //                       fillColor: AppTheme.green,
  //                     ),
  //                   ),
  //                   Text('Masukan tanggal akhir'),
  //                   TextFormField(
  //                     controller: finish,
  //                     showCursor: true,
  //                     cursorHeight: 25,
  //                     style: GoogleFonts.montserrat(),
  //                     decoration: const InputDecoration(
  //                       focusedBorder: OutlineInputBorder(
  //                           borderSide: BorderSide(color: AppTheme.green)),
  //                       labelText: 'Tanggal Akhir',
  //                       hintText: 'Format Tanggal yyyy-mm-dd',
  //                       hintStyle: AppTheme.custom,
  //                       labelStyle: AppTheme.custom1,
  //                       focusColor: AppTheme.green,
  //                       fillColor: AppTheme.green,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             actions: [
  //               Row(
  //                 children: [
  //                   Container(
  //                     height: 40,
  //                     width: 70,
  //                     alignment: Alignment.center,
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           primary: AppTheme.white, onPrimary: AppTheme.white),
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: const Text(
  //                         'Cancel',
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           color: AppTheme.green,
  //                           fontFamily: AppTheme.fontName,
  //                           fontWeight: FontWeight.w400,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     height: 40,
  //                     width: 70,
  //                     alignment: Alignment.center,
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                           primary: AppTheme.green, onPrimary: AppTheme.white),
  //                       onPressed: () {
  //                         Pop();
  //                       },
  //                       child: const Text(
  //                         'Cari',
  //                         style: TextStyle(
  //                           fontSize: 12,
  //                           color: AppTheme.white,
  //                           fontFamily: AppTheme.fontName,
  //                           fontWeight: FontWeight.w400,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ]));

  Future getData() async {
    try {
      final response = await http.post(Uri.parse(ApiConnect.kalender), body: {
        "id_lahan": _currentUser.user.idLahan.toString(),
        "tanggal_mulai": '$startDate',
        "tanggal_selesai": '$endDate'
      });
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Aktivitas1> blog = it.map((e) => Aktivitas1.fromJson(e)).toList();

        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
